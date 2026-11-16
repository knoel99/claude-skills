---
name: nuclear-ponytail
description: Combined code review — thermo-nuclear quality audit + ponytail over-engineering pass, merged into one report
argument-hint: "[base ref, default: main]"
allowed-tools: Bash, Read, Task, Skill, Grep, Glob
---

You are running a **combined code review** over the current branch's changes against base `${1:-main}`.

## 1. Gather the diff (do this first, in one message)
- `git diff ${1:-main}...HEAD --stat` then `git diff ${1:-main}...HEAD` for the full patch.
- Read the full current contents of each changed file (skip deletions/binaries/lockfiles).
- If the diff is empty, report "Aucun changement vs `${1:-main}`." and stop.

## 2. Run both reviews in parallel (ONE message, two calls)
- **Task** with `subagent_type: "thermo-nuclear-code-quality-review"`. Its user prompt must contain two labeled sections: `### Git / diff output` (the patch + stat) and `### Changed file contents` (each file, fenced). This covers maintainability, structure, the 1k-line rule, spaghetti, and code-judo.
- **Skill** `ponytail:ponytail-review` (over-engineering only: what to delete / shrink / replace with stdlib or native). It reviews the same working-tree changes.

## 3. Merge into a single report
Wait for both, then synthesize — do NOT just paste the two outputs back to back.

**Rédaction (s'applique à tout le rapport).** Chaque constat est rédigé en phrases complètes, pas en notes télégraphiques, et suit la même structure en trois temps :
1. **Situation actuelle** — ce que fait le code aujourd'hui, avec les refs `file:line`.
2. **Problème et conséquences** — pourquoi c'est un défaut et ce qu'il provoque concrètement (bug latent, drift, dette…), en explicitant le scénario.
3. **Modification proposée et justifiée** — le changement recommandé ET la raison pour laquelle il est le bon (pas seulement quoi, mais pourquoi).

Garder les sections ci-dessous ; seule la forme rédactionnelle change.

### 🔴 Structure & maintainability (thermo-nuclear)
High-conviction findings in the rubric's priority order, chacun rédigé selon la structure en trois temps. Keep file:line refs.

### ✂️ Sur-engineering — à supprimer (ponytail)
Les coupes proposées par ponytail, reformulées en phrases complètes (situation / pourquoi c'est superflu / ce qui le remplace et pourquoi). Conserver les tags (`delete:`, `stdlib:`, `native:`, `yagni:`, `shrink:`) et les refs `file:line` dans la prose. Terminer par le net de lignes supprimables, ou "Lean already. Ship."

### ⚖️ Verdict
- **De-duplicate**: when both tools flag the same code, state it once and note both agreed (stronger signal).
- **Flag conflicts**: thermo may want a stronger abstraction where ponytail wants deletion — surface the tension explicitly and give your recommendation, don't hide it.
- Conclusion ship/no-ship rédigée en phrases complètes, avec les 1 à 3 corrections prioritaires expliquées (pas une simple liste de titres).
