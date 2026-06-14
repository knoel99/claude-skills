#!/usr/bin/env bash
# Installe toutes les skills de ce dépôt (locales + sous-modules vendor/) dans
# ~/.claude/skills/ via des liens symboliques. Idempotent : relancer après un
# `update.sh` (ou un `git pull`) suffit à refléter les ajouts/suppressions.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$DEST"

# 1) Nettoyage : retire les liens existants qui pointent vers ce dépôt
#    (laisse intactes les vraies skills perso et les liens d'autres dépôts).
for link in "$DEST"/*; do
  [ -L "$link" ] || continue
  case "$(readlink -f "$link" || true)" in
    "$REPO_ROOT"/*) rm -f "$link" ;;
  esac
done

# 2) Collecte les dossiers contenant un SKILL.md, en excluant le bruit
#    (tests, fixtures, copies internes de plugin, benchmarks, node_modules).
mapfile -t skill_dirs < <(
  find "$REPO_ROOT/skills" "$REPO_ROOT/vendor" -type f -name SKILL.md \
    -not -path '*/test/*'      -not -path '*/tests/*' \
    -not -path '*/fixtures/*'  -not -path '*/.github/*' \
    -not -path '*/benchmarks/*' -not -path '*/node_modules/*' \
    -printf '%h\n' 2>/dev/null | sort -u
)

# 3) Ne garde que les skills "racines" : si un dossier ancêtre est déjà une
#    skill, la skill imbriquée sera embarquée via le lien du parent.
roots=()
for d in "${skill_dirs[@]}"; do
  nested=0
  for o in "${skill_dirs[@]}"; do
    [ "$o" = "$d" ] && continue
    case "$d" in "$o"/*) nested=1; break ;; esac
  done
  [ "$nested" -eq 0 ] && roots+=("$d")
done

# 4) Crée les liens. Le nom = champ `name:` du frontmatter, sinon le dossier.
#    En cas de collision, suffixe par la source (nom du sous-module / "local").
declare -A used
installed=0; skipped=0
for d in "${roots[@]}"; do
  name="$(awk -F':' '/^name:/{sub(/^[^:]*:[[:space:]]*/,"");gsub(/^["'"'"' ]+|["'"'"' ]+$/,"");print;exit}' "$d/SKILL.md")"
  [ -z "$name" ] && name="$(basename "$d")"

  rel="${d#$REPO_ROOT/}"
  if [[ "$rel" == vendor/* ]]; then src="${rel#vendor/}"; src="${src%%/*}"; else src="local"; fi

  target="$name"
  if [[ -n "${used[$name]:-}" ]]; then target="${name}__${src}"; fi
  used["$target"]=1

  dest="$DEST/$target"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "  ! ignore '$target' : un dossier réel existe déjà dans $DEST"
    skipped=$((skipped+1)); continue
  fi
  ln -sfn "$d" "$dest"
  installed=$((installed+1))
done

echo "✓ $installed skills liées dans $DEST (${skipped} ignorées)"