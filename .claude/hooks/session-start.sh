#!/usr/bin/env bash
# SessionStart hook: make sure gstack and ponytail are installed, locally and
# in Claude Code cloud sessions. Fast no-op once everything is in place.
exec "${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}/scripts/dev-setup.sh"
