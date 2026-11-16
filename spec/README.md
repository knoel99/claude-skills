# Agent Skills specification

Skills here follow the open [Agent Skills](https://agentskills.io/specification) standard.
`scripts/validate_skills.py` enforces these rules in CI:

| Rule | Detail |
|------|--------|
| Layout | `skills/<group>/<name>/SKILL.md` |
| `name` | required, lowercase letters, digits and hyphens, ≤ 64 chars, equals the folder name, unique |
| `description` | required, ≤ 1024 chars, says what the skill does **and when** to use it |
| Resources | optional `scripts/`, `references/`, `assets/`, paths relative to the skill folder |
| Catalog | each skill belongs to exactly one plugin in `.claude-plugin/marketplace.json` |
