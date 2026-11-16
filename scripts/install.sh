#!/usr/bin/env bash
# Symlink every skill of this repo into ~/.claude/skills/ (override with
# CLAUDE_SKILLS_DIR). Idempotent: stale links into this repo are removed first.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$DEST"

for link in "$DEST"/*; do
  [ -L "$link" ] || continue
  case "$(readlink -f "$link" || true)" in "$REPO_ROOT"/*) rm -f "$link" ;; esac
done

count=0
for skill in "$REPO_ROOT"/skills/*/*/SKILL.md; do
  dir="$(dirname "$skill")"
  dest="$DEST/$(basename "$dir")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "  ! skipped $(basename "$dir"): a real directory already exists in $DEST"
    continue
  fi
  ln -sfn "$dir" "$dest"
  count=$((count+1))
done

echo "✓ $count skills linked into $DEST"
