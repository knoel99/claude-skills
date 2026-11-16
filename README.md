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
| [`amanda-askill`](skills/general/amanda-askill) | Illustrates a niche academic principle with a three-paragraph story, named and explained only at the end |
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
