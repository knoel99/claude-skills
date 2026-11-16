# Spécification Agent Skills

Les skills de ce dépôt suivent le standard ouvert **Agent Skills** : https://agentskills.io/specification

Règles appliquées ici (vérifiées par `scripts/validate_skills.py` en CI) :

| Règle | Détail |
|-------|--------|
| Un dossier par skill | `skills/<name>/SKILL.md` |
| `name` | obligatoire, minuscules, chiffres et tirets, ≤ 64 caractères, identique au nom du dossier |
| `description` | obligatoire, ≤ 1024 caractères, dit quoi faire **et quand** |
| Ressources | `scripts/`, `references/`, `assets/` (facultatifs), chemins relatifs au dossier de la skill |
| Catalogue | chaque skill appartient à exactement un plugin dans `.claude-plugin/marketplace.json` |
