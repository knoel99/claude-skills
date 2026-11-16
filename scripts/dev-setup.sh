#!/usr/bin/env bash
# dev-setup.sh — install pstack (Lauren Tan, cursor/plugins) and ponytail
# (DietrichGebert/ponytail) for every coding agent found on this machine:
# Claude Code, Codex, Cursor, and any agent reading ~/.agents/skills.
#
# Idempotent and fast when nothing changed: finished steps are skipped.
# Safe to run from a SessionStart hook, a cloud environment setup script, or
# by hand:
#
#   scripts/dev-setup.sh            # install / repair
#   scripts/dev-setup.sh --status   # show what is installed, change nothing
#   scripts/dev-setup.sh --update   # pull both repos and the Claude plugins
#
# Environment:
#   DEV_SETUP_HOME   where the checkouts go (default ~/.local/share/dev-setup)
#   DEV_SETUP_SKIP   space-separated steps to skip: claude codex cursor agents
#   DEV_SETUP_LOG    log file (default ~/.cache/dev-setup.log)
#
# A failed step prints a warning and is retried on the next run; the script
# itself exits 0 so it never blocks an agent session (use --status to check).
set -uo pipefail

HOME_DIR="${DEV_SETUP_HOME:-$HOME/.local/share/dev-setup}"
PSTACK_DIR="$HOME_DIR/cursor-plugins"     # sparse checkout: pstack/ only
PONYTAIL_DIR="$HOME_DIR/ponytail"
SKIP=" ${DEV_SETUP_SKIP:-} "
LOG="${DEV_SETUP_LOG:-$HOME/.cache/dev-setup.log}"
MARKERS="$HOME/.cache/dev-setup"
MODE="${1:-install}"

mkdir -p "$(dirname "$LOG")" "$MARKERS" "$HOME_DIR"
ok=(); warn=()
skip() { [[ "$SKIP" == *" $1 "* ]]; }
have() { command -v "$1" >/dev/null 2>&1; }
run() { echo "+ $*" >>"$LOG"; "$@" >>"$LOG" 2>&1; }

# Symlink every skill folder of $1 into $2 (never replaces a real directory).
link_skills() {
  local src="$1" dest="$2" s
  mkdir -p "$dest"
  for s in "$src"/*/; do
    [ -f "$s/SKILL.md" ] || continue
    [ -e "$dest/$(basename "$s")" ] && [ ! -L "$dest/$(basename "$s")" ] && continue
    ln -sfn "${s%/}" "$dest/$(basename "$s")"
  done
}

# Install a Claude Code plugin at user scope (every project): $1 plugin@market, $2 marketplace repo.
claude_plugin() {
  local plugin="$1" market="${1#*@}" repo="$2"
  if claude plugin list 2>/dev/null | grep -q "$plugin"; then
    [ "$MODE" = "--update" ] && run claude plugin update "$plugin"
    ok+=("claude: $plugin present")
  elif { claude plugin marketplace list 2>/dev/null | grep -q "$market" \
         || run claude plugin marketplace add "$repo"; } \
       && run claude plugin install "$plugin"; then
    ok+=("claude: $plugin installed (active from the next session)")
  else
    warn+=("claude: $plugin install failed (see $LOG)")
  fi
}

status() {
  printf '%-9s %s\n' pstack   "$( [ -d "$PSTACK_DIR/pstack/skills" ] && echo "ok ($PSTACK_DIR/pstack)" || echo missing)"
  printf '%-9s %s\n' ponytail "$( [ -f "$PONYTAIL_DIR/AGENTS.md" ] && echo "ok ($PONYTAIL_DIR)" || echo missing)"
  if have claude; then
    printf '%-9s %s\n' claude "$(claude plugin list 2>/dev/null | grep -oE '(pstack|ponytail)@[a-z-]+' | sort -u | tr '\n' ' ')"
  fi
  if have codex; then
    printf '%-9s %s\n' codex "$( [ -f "$MARKERS/codex-ponytail" ] && echo 'ponytail plugin installed' || echo 'ponytail plugin missing'), skills in ~/.agents/skills"
  fi
}

if [ "$MODE" = "--status" ]; then status; exit 0; fi
echo "=== dev-setup $(date -u +%FT%TZ) ===" >>"$LOG"

# ── Checkouts (for agents without a plugin system, and for AGENTS.md) ────
if [ ! -d "$PSTACK_DIR/.git" ]; then
  run git clone --depth 1 --filter=blob:none --sparse https://github.com/cursor/plugins.git "$PSTACK_DIR" \
    && run git -C "$PSTACK_DIR" sparse-checkout set pstack \
    || { rm -rf "$PSTACK_DIR"; warn+=("pstack: clone failed (see $LOG)"); }
elif [ "$MODE" = "--update" ]; then
  run git -C "$PSTACK_DIR" pull --ff-only || warn+=("pstack: pull failed (see $LOG)")
fi
if [ ! -d "$PONYTAIL_DIR/.git" ]; then
  run git clone --depth 1 https://github.com/DietrichGebert/ponytail.git "$PONYTAIL_DIR" \
    || warn+=("ponytail: clone failed (see $LOG)")
elif [ "$MODE" = "--update" ]; then
  run git -C "$PONYTAIL_DIR" pull --ff-only || warn+=("ponytail: pull failed (see $LOG)")
fi

# ── Claude Code: both as plugins ─────────────────────────────────────────
if ! skip claude && have claude; then
  claude_plugin pstack@cursor-plugins cursor/plugins
  claude_plugin ponytail@ponytail DietrichGebert/ponytail
fi

# ── Codex: ponytail plugin (pstack's skills come through ~/.agents/skills) ─
if ! skip codex && have codex; then
  if [ -f "$MARKERS/codex-ponytail" ]; then
    ok+=("codex: ponytail plugin present")
  elif run codex plugin marketplace add DietrichGebert/ponytail \
       && run codex plugin add ponytail@ponytail; then
    touch "$MARKERS/codex-ponytail"
    ok+=("codex: ponytail plugin installed (trust its hooks once with /hooks)")
  else
    warn+=("codex: ponytail plugin install failed (see $LOG)")
  fi
fi

# ── Cursor: pstack skills + ponytail's native hooks ──────────────────────
if ! skip cursor && [ -d "$HOME/.cursor" ]; then
  [ -d "$PSTACK_DIR/pstack/skills" ] && link_skills "$PSTACK_DIR/pstack/skills" "$HOME/.cursor/skills"
  if [ -f "$MARKERS/cursor-ponytail" ]; then
    ok+=("cursor: pstack skills + ponytail hooks present")
  elif have node && [ -f "$PONYTAIL_DIR/scripts/cursor-hooks.js" ] \
       && run node "$PONYTAIL_DIR/scripts/cursor-hooks.js" install; then
    touch "$MARKERS/cursor-ponytail"; ok+=("cursor: pstack skills + ponytail hooks installed")
  else
    warn+=("cursor: ponytail hooks install failed (see $LOG)")
  fi
fi

# ── Generic agents (Codex and other skills-aware CLIs): ~/.agents/skills ──
if ! skip agents; then
  [ -d "$PSTACK_DIR/pstack/skills" ] && link_skills "$PSTACK_DIR/pstack/skills" "$HOME/.agents/skills"
  [ -d "$PONYTAIL_DIR/skills" ] && link_skills "$PONYTAIL_DIR/skills" "$HOME/.agents/skills"
fi

# ── Summary (short: a SessionStart hook puts stdout into the context) ─────
for m in ${ok[@]+"${ok[@]}"}; do echo "✓ $m"; done
for m in ${warn[@]+"${warn[@]}"}; do echo "! $m"; done
exit 0
