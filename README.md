# claude-skills

Collection de skills pour Claude Code : skills maison (dossier `skills/`) +
sources externes suivies en **sous-modules git** (dossier `vendor/`) pour rester
synchronisées avec leurs dépôts d'origine.

## Installation

```bash
git clone --recurse-submodules https://github.com/knoel99/claude-skills.git
cd claude-skills
./install.sh        # lie toutes les skills dans ~/.claude/skills/
```

Déjà cloné sans `--recurse-submodules` ?

```bash
git submodule update --init --recursive
./install.sh
```

`install.sh` crée un lien symbolique par skill « racine » dans `~/.claude/skills/`
(en ignorant tests, fixtures, copies internes de plugin et benchmarks). Il est
**idempotent** : relançable à volonté. Cible personnalisable via
`CLAUDE_SKILLS_DIR`. Redémarrer Claude Code pour que les nouvelles skills
apparaissent dans `/skills`.

## Mise à jour

```bash
./update.sh         # tire la dernière version de chaque source + réinstalle
git add -A && git commit -m "Met à jour les sources de skills" && git push
```

`update.sh` fait `git submodule update --remote --merge` (dernière version de
chaque dépôt d'origine), re-télécharge la skill alphaxiv (simple fichier), puis
relance `install.sh`.

## Sources

| Source | Type | Contenu |
|--------|------|---------|
| `skills/` | local | skills maison (`config-claude-code`, `amanda-explains`…) + `alphaxiv-paper-lookup` (fichier vendu) |
| `vendor/context-hub` | sous-module | https://github.com/andrewyng/context-hub |
| `vendor/geo-seo-claude` | sous-module | https://github.com/zubair-trabzada/geo-seo-claude |
| `vendor/azure-skills` | sous-module | https://github.com/microsoft/azure-skills |
| `vendor/ponytail` | sous-module | https://github.com/DietrichGebert/ponytail |
| `skills/alphaxiv-paper-lookup` | fichier | https://www.alphaxiv.org/skills/alphaxiv-paper-lookup/SKILL.md (pas de dépôt git → rafraîchi par `update.sh`) |

## Note

`install.sh` lie **toutes** les skills disponibles (~60). Chaque skill ajoute son
nom + sa description au contexte de Claude Code ; pour en désactiver, supprimer
le lien correspondant dans `~/.claude/skills/`.
