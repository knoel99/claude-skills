#!/usr/bin/env bash
# Met à jour toutes les sources vers leur dernière version d'origine, puis
# réinstalle les liens dans ~/.claude/skills/.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

echo "→ Mise à jour des sous-modules vers l'origine…"
git submodule update --init --remote --merge

echo "→ Rafraîchissement de la skill alphaxiv (fichier seul, hors sous-module)…"
curl -fsSL "https://www.alphaxiv.org/skills/alphaxiv-paper-lookup/SKILL.md" \
  -o skills/alphaxiv-paper-lookup/SKILL.md || echo "  ! échec du fetch alphaxiv (ignoré)"

echo "→ Réinstallation des liens…"
./install.sh

echo
echo "Pense à committer les nouveaux pointeurs de sous-modules :"
echo "  git add -A && git commit -m 'Met à jour les sources de skills' && git push"