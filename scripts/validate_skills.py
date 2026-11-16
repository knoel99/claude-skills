#!/usr/bin/env python3
"""Validate skills/<group>/<skill>/SKILL.md and .claude-plugin/marketplace.json.

Usage: python3 scripts/validate_skills.py   (exit code 1 on error)
"""
import json
import re
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
NAME_RE = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")


def frontmatter(path: Path) -> dict:
    m = re.match(r"^---\n(.*?)\n---\n", path.read_text(encoding="utf-8"), re.S)
    if not m:
        raise ValueError("missing YAML frontmatter (--- ... ---)")
    data = yaml.safe_load(m.group(1))
    if not isinstance(data, dict):
        raise ValueError("frontmatter is not a YAML mapping")
    return data


def main() -> int:
    errors = []
    dirs = sorted(d for g in (ROOT / "skills").iterdir() if g.is_dir() for d in g.iterdir() if d.is_dir())
    skills = [d for d in dirs if (d / "SKILL.md").exists()]
    errors += [f"{d.relative_to(ROOT)}: missing SKILL.md" for d in dirs if d not in skills]

    names = {}
    for d in skills:
        try:
            fm = frontmatter(d / "SKILL.md")
        except ValueError as e:
            errors.append(f"{d.name}: {e}")
            continue
        name, desc = fm.get("name"), fm.get("description")
        if not name or not NAME_RE.match(str(name)) or len(str(name)) > 64:
            errors.append(f"{d.name}: invalid name ({name!r})")
        elif name != d.name:
            errors.append(f"{d.name}: name {name!r} does not match folder")
        if name in names:
            errors.append(f"{d.name}: duplicate name (also in {names[name]})")
        names[name] = d.parent.name
        if not desc or not str(desc).strip():
            errors.append(f"{d.name}: missing description")
        elif len(str(desc)) > 1024:
            errors.append(f"{d.name}: description over 1024 characters ({len(str(desc))})")

    market = json.loads((ROOT / ".claude-plugin/marketplace.json").read_text(encoding="utf-8"))
    listed = []
    for plugin in market.get("plugins", []):
        for s in plugin.get("skills", []):
            p = (ROOT / s).resolve()
            if not (p / "SKILL.md").exists():
                errors.append(f"marketplace: {plugin['name']} lists missing {s}")
            listed.append(p)
    for d in skills:
        n = listed.count(d.resolve())
        if n != 1:
            errors.append(f"{d.name}: listed {n} times in marketplace.json (expected 1)")

    for e in errors:
        print(f"✗ {e}")
    print(f"{'✗' if errors else '✓'} {len(skills)} skills checked, {len(errors)} error(s)")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
