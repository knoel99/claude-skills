# Agent instructions

These rules apply to every coding agent working in this repository
(Claude Code, Codex, Cursor, Gemini, OpenCode…), locally or in the cloud.

## Setup: gstack + ponytail

Before writing code, make sure both are installed:

```bash
scripts/dev-setup.sh --status   # check
scripts/dev-setup.sh            # install or repair (idempotent, ~1 s when done)
```

Claude Code runs this automatically at session start (`.claude/settings.json`).
Other agents: run it yourself once if `--status` reports something missing.

## ponytail — how to write code

Follow the ponytail ruleset for every change: the simplest, shortest solution
that works; YAGNI, standard library first, no abstraction nobody asked for.
The full ruleset is in `~/.local/share/ponytail/AGENTS.md` (installed by the
setup script) — read it at the start of a coding task if your agent did not
load it through the ponytail plugin. `ponytail-review` reviews a diff against it.

## gstack — how to work

Use gstack's skills for the workflow around the code:

- planning: `/office-hours`, `/plan-eng-review`, `/spec`
- before pushing: `/review` on the diff, `/verify` until tests are green
- testing a site, API or CLI: `/qa`
- shipping: `/ship`
- web browsing: use `/browse` from gstack; never use `mcp__claude-in-chrome__*` tools.

On agents other than Claude Code the skills are prefixed (`gstack-review`,
`gstack-qa`…); ask for them by name.

## This repository

- Skills live in `skills/<group>/<name>/SKILL.md`; validate with
  `python3 scripts/validate_skills.py`.
- Tests: `python3 -m unittest skills/*/*/scripts/test_*.py`.
