# claude-skills

Agent Skills maison pour **Claude Code** et **Grok Build**, au format ouvert
[Agent Skills](https://agentskills.io/specification) : un dossier par skill, un
`SKILL.md` (frontmatter `name` + `description`) et, si besoin, `scripts/`,
`references/`, `assets/`.

Organisation inspirée de [`anthropics/skills`](https://github.com/anthropics/skills) :
skills à plat dans `skills/`, regroupées en plugins par un catalogue
`.claude-plugin/marketplace.json`.

## Catalogue

| Plugin | Skill | Rôle |
|--------|-------|------|
| `agent-simulation` | [`agora-scene`](skills/agora-scene) | Scène multi-bots minutée, une session grok headless par bot |
| | [`dialogue-turns`](skills/dialogue-turns) | Analyse un tour de bot, garde les pensées privées hors du transcript partagé |
| | [`grok-status`](skills/grok-status) | Suit un log streaming-json de grok et écrit des fichiers de statut |
| `research-learning` | [`alphaxiv-paper-lookup`](skills/alphaxiv-paper-lookup) | Vue d'ensemble structurée d'un article arXiv via alphaxiv.org |
| | [`amanda-explains`](skills/amanda-explains) | Enseigne un concept avancé par une fable à révélation tardive |
| `developer-tools` | [`config-claude-code`](skills/config-claude-code) | Bascule de fournisseur (Anthropic / z.ai) et réglages `settings.json` |
| | [`nuclear-ponytail`](skills/nuclear-ponytail) | Revue de code combinée : audit qualité + chasse à la sur-ingénierie |

Sotopia et Concordia ont inspiré les objectifs privés, les secrets et le narrateur
à vue partielle d'`agent-simulation` ; ce projet est indépendant des deux.

## Structure

```
.claude-plugin/marketplace.json   catalogue : plugins → skills
skills/<name>/                    une skill = SKILL.md + scripts/ (+ tests) …
template/SKILL.md                 point de départ d'une nouvelle skill
spec/                             règles de format appliquées en CI
scripts/                          install.sh, update.sh, validate_skills.py
vendor/                           skills tierces en sous-modules git
.github/workflows/ci.yml          validation + tests unitaires
```

## Installation

### Comme plugins Claude Code (marketplace)

```
/plugin marketplace add knoel99/claude-skills
/plugin install agent-simulation@knoel99-skills
```

### Toutes les skills, y compris les sources tierces (liens symboliques)

```bash
git clone --recurse-submodules https://github.com/knoel99/claude-skills.git
```

```bash
cd claude-skills && scripts/install.sh
```

`install.sh` lie chaque skill racine de `skills/` et `vendor/` dans
`~/.claude/skills/` (cible modifiable via `CLAUDE_SKILLS_DIR`). Il est idempotent.
Redémarrer Claude Code pour voir les nouvelles skills dans `/skills`.

Déjà cloné sans sous-modules : `git submodule update --init --recursive`.

### Grok Build

Les skills `agent-simulation` demandent l'accord avant tout téléchargement ; si le
dossier est déjà sur le disque, elles lancent directement `scripts/` depuis la skill.

## Mise à jour des sources tierces

```bash
scripts/update.sh
```

Tire la dernière version de chaque sous-module, rafraîchit `alphaxiv-paper-lookup`
(simple fichier), puis relance `install.sh`. Committer ensuite les nouveaux pointeurs.

| Source | Type | Origine |
|--------|------|---------|
| `vendor/context-hub` | sous-module | https://github.com/andrewyng/context-hub |
| `vendor/geo-seo-claude` | sous-module | https://github.com/zubair-trabzada/geo-seo-claude |
| `vendor/azure-skills` | sous-module | https://github.com/microsoft/azure-skills |
| `vendor/ponytail` | sous-module | https://github.com/DietrichGebert/ponytail |
| `skills/alphaxiv-paper-lookup` | fichier | https://www.alphaxiv.org/skills/alphaxiv-paper-lookup/SKILL.md |

Chaque skill installée ajoute son nom et sa description au contexte ; pour en
désactiver une, supprimer son lien dans `~/.claude/skills/`.

## Ajouter une skill

1. `cp -r template skills/<name>` puis remplir `SKILL.md` (`name` = nom du dossier).
2. Ajouter `./skills/<name>` à un plugin de `.claude-plugin/marketplace.json`.
3. Tests éventuels dans `skills/<name>/scripts/test_*.py` (lancés par la CI).
4. Vérifier : `python3 scripts/validate_skills.py`.

## Licence

Apache 2.0 (voir [LICENSE](LICENSE)). Les sous-modules de `vendor/` gardent leur
propre licence.
