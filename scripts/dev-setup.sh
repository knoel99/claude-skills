#!/usr/bin/env bash
# dev-setup.sh — install pstack (Lauren Tan, cursor/plugins) and ponytail
# (DietrichGebert/ponytail) for every coding agent found on this machine:
# Claude Code, Codex, Copilot CLI, Gemini CLI, OpenCode, Cursor, and any agent
# reading ~/.agents/skills.
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
#   DEV_SETUP_SKIP   space-separated steps to skip: claude codex copilot gemini opencode cursor agents
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
  local a
  printf '%-9s %s\n' pstack   "$( [ -d "$PSTACK_DIR/pstack/skills" ] && echo "ok ($PSTACK_DIR/pstack)" || echo missing)"
  printf '%-9s %s\n' ponytail "$( [ -f "$PONYTAIL_DIR/AGENTS.md" ] && echo "ok ($PONYTAIL_DIR)" || echo missing)"
  if have claude; then
    printf '%-9s %s\n' claude "$(claude plugin list 2>/dev/null | grep -oE '(pstack|ponytail)@[a-z-]+' | sort -u | tr '\n' ' ')"
  fi
  for a in codex copilot gemini opencode; do
    have "$a" && "$a" --version >/dev/null 2>&1 && printf '%-9s %s\n' "$a" "$( [ -f "$MARKERS/$a-ponytail" ] && echo 'ponytail plugin installed' || echo 'ponytail plugin missing'), skills in ~/.agents/skills"
  done
  return 0
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

# ── Other CLIs: ponytail through each one's own plugin system ────────────
# once NAME LABEL CMD...: run CMD once per machine (marker file), skip if the CLI is absent.
once() {
  local name="$1" label="$2"; shift 2
  skip "$name" && return 0
  have "$name" && "$name" --version >/dev/null 2>&1 || return 0   # real CLI, not a stub
  if [ -f "$MARKERS/$name-ponytail" ]; then ok+=("$name: ponytail present")
  elif "$@"; then touch "$MARKERS/$name-ponytail"; ok+=("$name: ponytail installed$label")
  else warn+=("$name: ponytail install failed (see $LOG)"); fi
}
codex_install()   { run codex plugin marketplace add DietrichGebert/ponytail && run codex plugin add ponytail@ponytail; }
copilot_install() { run copilot plugin marketplace add DietrichGebert/ponytail && run copilot plugin install ponytail@ponytail; }
once codex   " (trust its hooks once with /hooks)" codex_install
once copilot ""                                    copilot_install
once gemini  ""  run gemini extensions install https://github.com/DietrichGebert/ponytail --consent
# OpenCode 1 has no `plugin add`: register the npm plugin in its global config.
opencode_install() {
  local cfg="$HOME/.config/opencode/opencode.json"
  mkdir -p "$(dirname "$cfg")"
  python3 - "$cfg" <<'PY' >>"$LOG" 2>&1
import json, os, sys
p = sys.argv[1]
c = json.load(open(p)) if os.path.exists(p) else {}
c.setdefault("plugin", [])
if "@dietrichgebert/ponytail" not in c["plugin"]:
    c["plugin"].append("@dietrichgebert/ponytail")
json.dump(c, open(p, "w"), indent=2)
PY
}
once opencode "" opencode_install

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
