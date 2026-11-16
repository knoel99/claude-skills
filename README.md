# skills

Personal [Agent Skills](https://agentskills.io/specification) for Claude Code and Grok Build.
Each skill is a folder with a `SKILL.md` and optional `scripts/`, `references/` and `assets/`.

## Skills

### Grokbot (`skills/grokbot/`)

| Skill | What it does |
|-------|--------------|
| [`agora-scene`](skills/grokbot/agora-scene) | Runs a timed multi-bot scene, one headless grok session per bot |
| [`dialogue-turns`](skills/grokbot/dialogue-turns) | Parses a bot turn and keeps private thoughts out of the shared transcript |
| [`grok-status`](skills/grokbot/grok-status) | Follows a grok streaming-json log and writes status files |

### General (`skills/general/`)

| Skill | What it does |
|-------|--------------|
| [`amanda-explains`](skills/general/amanda-explains) | Teaches an advanced concept through a fable with a late reveal |
| [`config-claude-code`](skills/general/config-claude-code) | Switches the Claude Code provider (Anthropic / z.ai) and edits `settings.json` |

## Install

As Claude Code plugins:

```
/plugin marketplace add knoel99/skills
/plugin install grokbot@knoel99-skills
/plugin install general@knoel99-skills
```

Or symlink every skill into `~/.claude/skills/` (set `CLAUDE_SKILLS_DIR` to change the target):

```bash
git clone https://github.com/knoel99/skills.git && skills/scripts/install.sh
```

## Dev setup: gstack + ponytail everywhere

[`scripts/dev-setup.sh`](scripts/dev-setup.sh) installs [gstack](https://github.com/garrytan/gstack)
and [ponytail](https://github.com/DietrichGebert/ponytail) for every agent it finds
(Claude Code and Codex plugins, Cursor hooks, `~/.agents/skills` for the rest). It is idempotent:
about 45 s the first time, under a second afterwards.

| Where | How it runs |
|-------|-------------|
| Claude Code, local or cloud | Automatically: `SessionStart` hook in `.claude/settings.json`; ponytail is also declared as a project plugin |
| Codex CLI, Cursor, other agents, local | Run `scripts/dev-setup.sh` once; [`AGENTS.md`](AGENTS.md) tells them to use both |
| Codex cloud / any cloud with a setup script | Set the environment's setup script to `bash scripts/dev-setup.sh` |
| Another machine, without cloning this repo | `curl -fsSL https://raw.githubusercontent.com/knoel99/skills/main/scripts/dev-setup.sh \| bash` |

`scripts/dev-setup.sh --status` shows what is installed; `--update` pulls both repos
and re-runs their setup. Opt out of a step with `DEV_SETUP_SKIP="codex agents"`.

## Third-party skills

Skills I use but don't maintain. They are not copied here; install them from their source.

| Skill | Source | Install |
|-------|--------|---------|
| ponytail | [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) | `/plugin marketplace add DietrichGebert/ponytail` |
| Azure skills | [microsoft/azure-skills](https://github.com/microsoft/azure-skills) | `/plugin marketplace add microsoft/azure-skills` |
| context-hub | [andrewyng/context-hub](https://github.com/andrewyng/context-hub) | See its README (`chub` CLI + `get-api-docs` skill) |
| geo-seo-claude | [zubair-trabzada/geo-seo-claude](https://github.com/zubair-trabzada/geo-seo-claude) | See its README (`install.sh`) |
| alphaxiv-paper-lookup | [alphaxiv.org](https://www.alphaxiv.org/skills/alphaxiv-paper-lookup/SKILL.md) | Save that `SKILL.md` to `~/.claude/skills/alphaxiv-paper-lookup/` |

## Contributing

1. `cp -r template skills/<group>/<name>` and fill in `SKILL.md` (`name` must match the folder).
2. Add the skill to a plugin in `.claude-plugin/marketplace.json`.
3. Put tests in `scripts/test_*.py`; CI runs them.
4. Run `python3 scripts/validate_skills.py`.

## License

[Apache 2.0](LICENSE)
