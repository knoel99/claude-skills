# Agent instructions

These rules apply to every coding agent working in this repository
(Claude Code, Codex, Cursor, Gemini, OpenCode…), locally or in the cloud.

## Setup: pstack + ponytail

Before writing code, make sure both are installed:

```bash
scripts/dev-setup.sh --status   # check
scripts/dev-setup.sh            # install or repair (idempotent, ~1 s when done)
```

Claude Code runs this automatically at session start (`.claude/settings.json`).
Other agents: run it yourself once if `--status` reports something missing.

## pstack — how to work

Use [pstack](https://github.com/cursor/plugins/tree/main/pstack) for any task
that needs rigor: start it with `poteto-mode` (in Claude Code:
`/pstack:poteto-mode`), which picks a playbook (bug fix, feature, refactoring,
investigation…) and calls the other pstack skills as needed. Not sure which
skill fits: `poteto-help`. If your agent has no plugin, the skills are in
`~/.agents/skills` (source: `~/.local/share/dev-setup/cursor-plugins/pstack`).

## ponytail — how to write code

Follow the ponytail ruleset for every change: the simplest, shortest solution
that works; YAGNI, standard library first, no abstraction nobody asked for.
The full ruleset is in `~/.local/share/dev-setup/ponytail/AGENTS.md` — read it
at the start of a coding task if your agent did not load it through the
ponytail plugin. `ponytail-review` reviews a diff against it.

## This repository

- Skills live in `skills/<group>/<name>/SKILL.md`; validate with
  `python3 scripts/validate_skills.py`.
- Tests: `python3 -m unittest skills/*/*/scripts/test_*.py`.
