#!/usr/bin/env bash
# dev-setup.sh — install gstack and ponytail for every coding agent found on
# this machine (Claude Code, Codex, any agent reading ~/.agents/skills).
#
# Idempotent and fast when nothing changed: each step leaves a marker and is
# skipped next time. Safe to run from a SessionStart hook, a cloud environment
# setup script, or by hand:
#
#   scripts/dev-setup.sh            # install / repair
#   scripts/dev-setup.sh --status   # show what is installed, change nothing
#   scripts/dev-setup.sh --update   # pull both repos, then re-run their setup
#
# Environment:
#   GSTACK_DIR          gstack checkout   (default ~/.claude/skills/gstack)
#   PONYTAIL_DIR        ponytail checkout (default ~/.local/share/ponytail)
#   GSTACK_SETUP_ARGS   args for gstack's ./setup (default "--team --host auto -q")
#   DEV_SETUP_SKIP      space-separated steps to skip: gstack ponytail claude codex agents
#   DEV_SETUP_LOG       log file (default ~/.cache/dev-setup.log)
#
# A failed step prints a warning and is retried on the next run; the script
# itself exits 0 so it never blocks an agent session (use --status to check).
set -uo pipefail

GSTACK_REPO="https://github.com/garrytan/gstack.git"
PONYTAIL_REPO="https://github.com/DietrichGebert/ponytail.git"
GSTACK_DIR="${GSTACK_DIR:-$HOME/.claude/skills/gstack}"
PONYTAIL_DIR="${PONYTAIL_DIR:-$HOME/.local/share/ponytail}"
GSTACK_SETUP_ARGS="${GSTACK_SETUP_ARGS:---team --host auto -q}"
SKIP=" ${DEV_SETUP_SKIP:-} "
LOG="${DEV_SETUP_LOG:-$HOME/.cache/dev-setup.log}"
MARKERS="$HOME/.cache/dev-setup"
MODE="${1:-install}"

mkdir -p "$(dirname "$LOG")" "$MARKERS"
export PATH="$HOME/.bun/bin:$HOME/.local/bin:$PATH"

ok=(); warn=()
skip() { [[ "$SKIP" == *" $1 "* ]]; }
have() { command -v "$1" >/dev/null 2>&1; }
run() { echo "+ $*" >>"$LOG"; "$@" >>"$LOG" 2>&1; }
head_of() { git -C "$1" rev-parse HEAD 2>/dev/null; }

# Clone $2 into $1, or fast-forward it when --update is given.
checkout() {
  local dir="$1" url="$2"
  if [ ! -d "$dir/.git" ]; then
    mkdir -p "$(dirname "$dir")"
    run git clone --single-branch --depth 1 "$url" "$dir"
  elif [ "$MODE" = "--update" ]; then
    run git -C "$dir" pull --ff-only
  fi
}

status() {
  printf '%-10s %s\n' gstack   "$( [ -d "$GSTACK_DIR/bin" ] && echo "ok ($GSTACK_DIR, $(cat "$GSTACK_DIR/VERSION" 2>/dev/null))" || echo missing)"
  printf '%-10s %s\n' ponytail "$( [ -f "$PONYTAIL_DIR/AGENTS.md" ] && echo "ok ($PONYTAIL_DIR)" || echo missing)"
  if have claude; then
    printf '%-10s %s\n' claude "$(claude plugin list 2>/dev/null | grep -q 'ponytail' && echo 'ponytail plugin installed' || echo 'ponytail plugin missing')"
  fi
  if have codex; then
    printf '%-10s %s\n' codex "$( [ -f "$MARKERS/codex-ponytail" ] && echo 'ponytail plugin installed' || echo 'ponytail plugin missing')"
  fi
}

if [ "$MODE" = "--status" ]; then status; exit 0; fi
echo "=== dev-setup $(date -u +%FT%TZ) ===" >>"$LOG"

# ── gstack ──────────────────────────────────────────────────────────────
if ! skip gstack; then
  if ! have bun; then
    # gstack's ./setup needs Bun (https://bun.sh). Official installer, user-local.
    run bash -c 'curl -fsSL https://bun.sh/install | bash'
  fi
  if ! have bun; then
    warn+=("gstack: Bun is missing and could not be installed (see $LOG)")
  elif ! checkout "$GSTACK_DIR" "$GSTACK_REPO"; then
    warn+=("gstack: clone/pull failed (see $LOG)")
  else
    stamp="$(head_of "$GSTACK_DIR") $GSTACK_SETUP_ARGS"
    if [ "$(cat "$MARKERS/gstack" 2>/dev/null)" = "$stamp" ]; then
      ok+=("gstack: up to date")
    else
      rm -f "$MARKERS/gstack"
      # shellcheck disable=SC2086 # GSTACK_SETUP_ARGS is a word list on purpose
      if (cd "$GSTACK_DIR" && run ./setup $GSTACK_SETUP_ARGS </dev/null); then
        echo "$stamp" >"$MARKERS/gstack"; ok+=("gstack: installed")
      else
        warn+=("gstack: ./setup failed (see $LOG)")
      fi
    fi
  fi
fi

# ── ponytail checkout (ruleset + skills for agents without a plugin) ──────
if ! skip ponytail; then
  if checkout "$PONYTAIL_DIR" "$PONYTAIL_REPO"; then
    ok+=("ponytail: $PONYTAIL_DIR")
  else
    warn+=("ponytail: clone/pull failed (see $LOG)")
  fi
fi

# ── Claude Code: ponytail plugin at user scope (every project) ───────────
if ! skip claude && have claude; then
  if claude plugin list 2>/dev/null | grep -q 'ponytail'; then
    ok+=("claude: ponytail plugin present")
  elif { claude plugin marketplace list 2>/dev/null | grep -q 'ponytail' \
         || run claude plugin marketplace add DietrichGebert/ponytail; } \
       && run claude plugin install ponytail@ponytail; then
    ok+=("claude: ponytail plugin installed (active from the next session)")
  else
    warn+=("claude: ponytail plugin install failed (see $LOG)")
  fi
fi

# ── Codex: ponytail plugin ──────────────────────────────────────────────
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

# ── Generic agents: ~/.agents/skills (Codex and other skills-aware CLIs) ─
if ! skip agents && [ -d "$PONYTAIL_DIR/skills" ]; then
  mkdir -p "$HOME/.agents/skills"
  for s in "$PONYTAIL_DIR"/skills/*/; do
    [ -f "$s/SKILL.md" ] || continue
    dest="$HOME/.agents/skills/$(basename "$s")"
    [ -e "$dest" ] && [ ! -L "$dest" ] && continue
    ln -sfn "${s%/}" "$dest"
  done
fi

# ── Summary (short: a SessionStart hook puts stdout into the context) ─────
for m in ${ok[@]+"${ok[@]}"}; do echo "✓ $m"; done
for m in ${warn[@]+"${warn[@]}"}; do echo "! $m"; done
exit 0
