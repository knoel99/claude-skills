---
name: config-claude-code
description: >-
  Configurer Claude Code : changer le fournisseur d'IA (Anthropic ou z.ai/GLM)
  et modifier les paramètres de settings.json. À utiliser quand l'utilisateur
  veut changer de fournisseur / provider, basculer vers z.ai (GLM), revenir à
  Anthropic, ou ajuster un réglage de Claude Code (modèle, env, permissions,
  timeout, cleanupPeriodDays…). Mots-clés : changer fournisseur, switch provider,
  z.ai, zAI, GLM, ANTHROPIC_BASE_URL, settings.json, paramètres Claude Code.
---

# Configurer Claude Code (fournisseur d'IA + paramètres)

Cette skill aide à **basculer le fournisseur d'IA** utilisé par Claude Code et à
**modifier les paramètres** de `settings.json`, en toute sécurité.

Mécanique de base (identique pour tout fournisseur compatible Anthropic) :
Claude Code lit l'endpoint et les identifiants depuis un bloc **`env`** dans
`settings.json`. Changer de fournisseur = écrire/retirer quelques variables
dans ce bloc `env`.

## Règles de sécurité (NON négociables)

1. **Ne jamais inventer, deviner ou coder en dur un secret.** Les clés/API
   tokens (`ANTHROPIC_API_KEY`, `ANTHROPIC_AUTH_TOKEN`) viennent **toujours de
   l'utilisateur**. Si la clé manque, la **demander** — ne pas continuer sans.
2. **Les secrets vont dans un fichier gitignoré** : par défaut
   `./.claude/settings.local.json` (du projet courant). **Jamais** dans
   `./.claude/settings.json` (versionné → fuite de secret).
3. **Vérifier le gitignore** : s'assurer que `.claude/settings.local.json` est
   bien ignoré par git (`git check-ignore .claude/settings.local.json`). Si non,
   l'ajouter à `.gitignore` avant d'écrire le secret.
4. **Ne jamais afficher la clé en clair** dans la réponse après l'avoir reçue.

## Ce que je peux régler seul vs ce que je dois demander

| Sans secret — je le règle | Secret — l'utilisateur le fournit |
|---|---|
| `ANTHROPIC_BASE_URL` | `ANTHROPIC_AUTH_TOKEN` (z.ai) |
| `API_TIMEOUT_MS`, `CLAUDE_CODE_AUTO_COMPACT_WINDOW` | `ANTHROPIC_API_KEY` (Anthropic direct) |
| `ANTHROPIC_DEFAULT_OPUS/SONNET/HAIKU_MODEL` (optionnel) | `CLAUDE_CODE_OAUTH_TOKEN` |
| `model`, `effortLevel`, `permissions`, `cleanupPeriodDays`… | tout `apiKeyHelper` / passphrase mTLS |

## Procédure

### Étape 1 — Demander le fournisseur cible
Proposer la liste (via AskUserQuestion). **Pour le moment : `Anthropic` et `z.ai (GLM)`.**
La liste est volontairement extensible — ajouter d'autres profils plus tard sous
« Profils de fournisseurs ».

### Étape 2 — Appliquer le profil
Lire le `settings.local.json` existant (s'il existe), **fusionner** le bloc `env`
(ne pas écraser les autres clés), puis réécrire le fichier.

### Étape 3 — Prévenir du redémarrage
Les changements de `env` dans `settings.json` ne prennent effet qu'**au
redémarrage de Claude Code**. Le dire explicitement à l'utilisateur.

---

## Profils de fournisseurs

### Anthropic (natif — défaut)
Endpoint Anthropic standard. Authentification par login OAuth (`/login`) ou par
`ANTHROPIC_API_KEY`.

**Pour (re)venir sur Anthropic** : il faut **RETIRER** les variables z.ai du bloc
`env` (les vider à `""` ne suffit pas) :
- supprimer `ANTHROPIC_BASE_URL`
- supprimer `ANTHROPIC_AUTH_TOKEN`
- supprimer `ANTHROPIC_DEFAULT_OPUS_MODEL`, `…_SONNET_MODEL`, `…_HAIKU_MODEL`
- supprimer `CLAUDE_CODE_AUTO_COMPACT_WINDOW` si ajouté pour le contexte 1M

Claude Code retombe alors sur l'endpoint Anthropic et le login/clé habituels.
Si l'utilisateur veut la clé directe plutôt que OAuth, lui demander
`ANTHROPIC_API_KEY` et la mettre dans `env` (fichier gitignoré).

### z.ai (GLM Coding Plan)
Endpoint compatible Anthropic servi par z.ai. Source : `docs.z.ai/devpack/tool/claude`.

Bloc `env` à écrire (le **token est demandé à l'utilisateur**) :

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://api.z.ai/api/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "<CLÉ_ZAI_FOURNIE_PAR_L_UTILISATEUR>",
    "API_TIMEOUT_MS": "3000000"
  }
}
```

- **Clé** : `ANTHROPIC_AUTH_TOKEN` (pas `ANTHROPIC_API_KEY`). L'utilisateur la crée
  sur `https://z.ai/manage-apikey/apikey-list` (abonnement GLM Coding Plan requis).
- **Modèles** : par défaut, **ne pas** coder en dur les IDs de modèles — z.ai fait
  le mapping côté serveur (Opus/Sonnet/Haiku → GLM) et déconseille le hard-code
  (sinon pas de mise à jour auto). Ne pinner les modèles que si l'utilisateur le
  demande explicitement ; dans ce cas, **vérifier les IDs courants** sur
  `docs.z.ai/devpack/tool/claude` (ex. slot Haiku = `glm-4.5-air`) au lieu de
  supposer, puis ajouter `ANTHROPIC_DEFAULT_OPUS_MODEL` / `…_SONNET_MODEL` /
  `…_HAIKU_MODEL`.
- **Contexte 1M** : si on pinne un modèle en variante `[1m]`, ajouter aussi
  `"CLAUDE_CODE_AUTO_COMPACT_WINDOW": "1000000"`.

---

## Modifier d'autres paramètres de Claude Code

Pour les réglages **non secrets** (modèle, effort, permissions, nettoyage…),
écrire dans `./.claude/settings.json` (versionné, partagé équipe) **sauf** si ça
contient un secret → alors `settings.local.json`. Réglages utilisateur globaux
(tous projets) : `~/.claude/settings.json`.

Clés courantes de `settings.json` :

| Clé | Type | Rôle |
|---|---|---|
| `model` | string | Modèle par défaut (ex. `"claude-sonnet-4-6"`) |
| `effortLevel` | string | `low` \| `medium` \| `high` \| `xhigh` |
| `env` | object | Variables d'environnement par session (endpoint, modèles, timeouts) |
| `permissions` | object | Règles `allow` / `deny` / `ask` (fusionnées entre scopes) |
| `apiKeyHelper` | string | Script qui fournit une clé tournante (sortie = secret) |
| `cleanupPeriodDays` | number | Purge des sessions de plus de N jours |
| `includeCoAuthoredBy` / `attribution` | bool/object | Attribution des commits/PR |
| `fallbackModel` | array | Chaîne de repli (max 3) |
| `availableModels` / `enforceAvailableModels` | array/bool | Restreindre les modèles sélectionnables |

> Pour les réglages simples (thème, modèle), suggérer plutôt la commande `/config`
> à l'utilisateur. Pour les hooks et permissions automatisées, voir la skill
> `update-config`.

Précédence (du plus fort au plus faible) : variables d'environnement du shell →
réglages « managed » → flags CLI → `settings.local.json` → `settings.json`
projet → `~/.claude/settings.json`. Une variable `env` dans un settings de scope
supérieur l'emporte sur un settings de scope inférieur.

## Vérification finale

1. `git check-ignore .claude/settings.local.json` → doit renvoyer le chemin
   (sinon le secret n'est pas protégé : corriger `.gitignore`).
2. Relire le JSON écrit (sans afficher le secret) pour confirmer la structure.
3. Rappeler : **redémarrer Claude Code** pour que le changement de fournisseur
   prenne effet.

## Références officielles
- Claude Code — env vars : https://code.claude.com/docs/en/env-vars
- Claude Code — settings : https://code.claude.com/docs/en/settings
- Claude Code — authentication : https://code.claude.com/docs/en/authentication
- z.ai — Claude Code : https://docs.z.ai/devpack/tool/claude
