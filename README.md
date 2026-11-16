# skills

Personal [Agent Skills](https://agentskills.io/specification) for Claude Code and Grok Build.
Each skill is a folder with a `SKILL.md` and optional `scripts/`, `references/` and `assets/`.

## Skills

| Skill | What it does |
|-------|--------------|
| [`grokbot/agora-scene`](skills/grokbot/agora-scene) | Runs a timed multi-bot scene, one headless grok session per bot |
| [`grokbot/dialogue-turns`](skills/grokbot/dialogue-turns) | Parses a bot turn and keeps private thoughts out of the shared transcript |
| [`grokbot/grok-status`](skills/grokbot/grok-status) | Follows a grok streaming-json log and writes status files |
| [`general/amanda-askill`](skills/general/amanda-askill) | Illustrates a niche academic principle with a three-paragraph story, named and explained only at the end |

## Install

As Claude Code plugins:

```
/plugin marketplace add knoel99/skills
/plugin install grokbot@knoel99-skills
/plugin install general@knoel99-skills
```

Or symlink every skill into `~/.claude/skills/` (override with `CLAUDE_SKILLS_DIR`):

```bash
git clone https://github.com/knoel99/skills.git && skills/scripts/install.sh
```

## Dev setup

[`scripts/dev-setup.sh`](scripts/dev-setup.sh) installs [pstack](https://github.com/cursor/plugins/tree/main/pstack)
and [ponytail](https://github.com/DietrichGebert/ponytail) for every agent it finds (Claude Code, Codex, Copilot CLI,
Gemini CLI, OpenCode, Cursor, and `~/.agents/skills` for the rest). It is idempotent.

Claude Code runs it at session start. Elsewhere, run it once, or set it as a cloud environment's setup script.
Options: `--status`, `--update`, and `DEV_SETUP_SKIP="codex cursor"` to skip steps.

## Third-party skills

Skills I use but don't maintain; install them from their source.

| Skill | Source |
|-------|--------|
| Azure skills | [microsoft/azure-skills](https://github.com/microsoft/azure-skills) (`/plugin marketplace add microsoft/azure-skills`) |
| context-hub | [andrewyng/context-hub](https://github.com/andrewyng/context-hub) |
| geo-seo-claude | [zubair-trabzada/geo-seo-claude](https://github.com/zubair-trabzada/geo-seo-claude) |
| alphaxiv-paper-lookup | [alphaxiv.org](https://www.alphaxiv.org/skills/alphaxiv-paper-lookup/SKILL.md) (save to `~/.claude/skills/alphaxiv-paper-lookup/`) |

## Contributing

1. `cp -r template skills/<group>/<name>` and fill in `SKILL.md` (`name` must match the folder).
2. Add the skill to a plugin in `.claude-plugin/marketplace.json`.
3. Put tests in `scripts/test_*.py`; CI runs them.
4. Run `python3 scripts/validate_skills.py`.

## License

[Apache 2.0](LICENSE)
