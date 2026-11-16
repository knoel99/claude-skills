#!/usr/bin/env python3
"""Valide les skills de skills/ et le catalogue .claude-plugin/marketplace.json.

Usage : python3 scripts/validate_skills.py   (code de sortie 1 en cas d'erreur)
"""
import json
import re
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
NAME_RE = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")


def frontmatter(path: Path) -> dict:
    text = path.read_text(encoding="utf-8")
    m = re.match(r"^---\n(.*?)\n---\n", text, re.S)
    if not m:
        raise ValueError("frontmatter YAML absent (--- ... ---)")
    data = yaml.safe_load(m.group(1))
    if not isinstance(data, dict):
        raise ValueError("frontmatter n'est pas un objet YAML")
    return data


def main() -> int:
    errors = []
    skills = sorted(p.parent for p in (ROOT / "skills").glob("*/SKILL.md"))
    for d in (ROOT / "skills").iterdir():
        if d.is_dir() and not (d / "SKILL.md").exists():
            errors.append(f"{d.name}: SKILL.md manquant")

    for d in skills:
        try:
            fm = frontmatter(d / "SKILL.md")
        except ValueError as e:
            errors.append(f"{d.name}: {e}")
            continue
        name, desc = fm.get("name"), fm.get("description")
        if not name or not NAME_RE.match(str(name)) or len(str(name)) > 64:
            errors.append(f"{d.name}: name invalide ({name!r})")
        elif name != d.name:
            errors.append(f"{d.name}: name {name!r} ≠ nom du dossier")
        if not desc or not str(desc).strip():
            errors.append(f"{d.name}: description manquante")
        elif len(str(desc)) > 1024:
            errors.append(f"{d.name}: description > 1024 caractères ({len(str(desc))})")

    market = json.loads((ROOT / ".claude-plugin/marketplace.json").read_text(encoding="utf-8"))
    listed = []
    for plugin in market.get("plugins", []):
        for s in plugin.get("skills", []):
            p = (ROOT / s).resolve()
            if not (p / "SKILL.md").exists():
                errors.append(f"marketplace: {plugin['name']} référence {s} introuvable")
            listed.append(p)
    for d in skills:
        n = listed.count(d.resolve())
        if n != 1:
            errors.append(f"{d.name}: présent {n} fois dans marketplace.json (attendu : 1)")

    for e in errors:
        print(f"✗ {e}")
    print(f"{'✗' if errors else '✓'} {len(skills)} skills vérifiées, {len(errors)} erreur(s)")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
