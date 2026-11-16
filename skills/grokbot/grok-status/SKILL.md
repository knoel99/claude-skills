---
name: grok-status
description: >
  Follow a Grok Build streaming-json log and write status.txt and messages.jsonl
  while a headless grok run is in progress. Use when launching or resuming a
  Grok Heavy job, or when someone asks how that job is going. Do not use to
  write the research, the decision, or output.md. Do not use when the status
  program is already installed and no run is in progress.
---

# grok-status

## When to use

Use this at the start of a Grok Heavy job, and again beside every `grok` launch so the log is followed while the process runs.

Do not use it to research, judge, or rewrite `output.md`.

## Find the program

Use the first one that exists, and call it `STATUS`:

1. `scripts/grok-status.py` in this skill's folder (Claude, Cursor or Grok Build already has it on disk).
2. `~/.grok/heavy/status.py` from an earlier job.

Only if neither exists, ask once before downloading. Show this URL:

`https://github.com/knoel99/skills/tree/master/skills/grokbot/grok-status`

Do not download before a yes. On no, stop. On yes, run:

```bash
mkdir -p ~/.grok/heavy
curl -fsSL -o ~/.grok/heavy/status.py.tmp \
  https://raw.githubusercontent.com/knoel99/skills/master/skills/grokbot/grok-status/scripts/grok-status.py \
  && python3 ~/.grok/heavy/status.py.tmp --help >/dev/null \
  && mv ~/.grok/heavy/status.py.tmp ~/.grok/heavy/status.py
```

If any step fails, delete `~/.grok/heavy/status.py.tmp`, report the error, and stop. Do not start grok with a broken or missing status program. Never overwrite a working `~/.grok/heavy/status.py`.

## Run

Start it beside grok. It is not a second grok. Create the run folder first.

```bash
mkdir -p /workspace/runs/<id>
python3 "$STATUS" \
  --log /workspace/runs/<id>/run.log \
  --out /workspace/runs/<id>/status.txt \
  --messages /workspace/runs/<id>/messages.jsonl \
  --session /workspace/runs/<id>/session \
  --output /workspace/runs/<id>/output.md \
  --pid-file /workspace/runs/<id>/pid
```

The grok command must use `--output-format streaming-json`. Do not add `--include-partial-messages`.

## What it writes

- `status.txt` — four lines. Read this when asked for progress.
- `messages.jsonl` — one record per tool call, assistant text, and final result. It skips `stream_event` lines and thinking text.
- `session` — the session id, once seen.
- `output.md` — only if that file is missing or empty when the process exits. Never replace an `output.md` that already has text.

## Progress answer

Read `status.txt` and return those four lines. Do not scan `run.log`. Do not add an opinion.
