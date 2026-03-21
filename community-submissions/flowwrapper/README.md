# ⚡ flowwrapper

> **Let a strong model like Claude Opus or GPT Codex execute this workflow once —
> it generates a Python/LiteLLM script that a small local model can run reliably from then on.**

The idea: most ClawFlows hand a vague high-level instruction to a large model.
That works well for complex reasoning, but smaller local models can produce inconsistent
results on tasks that repeat — classification, triage, prioritization — because the logic
lives in the prompt rather than in code.

flowwrapper wraps the workflow in Python and breaks the logic into atomic steps —
each one a strict JSON call to LiteLLM. Small models (7B–14B) handle focused
binary decisions reliably. The structure does the heavy lifting, not the model.

## When to use it

**Good candidates — workflows with repeated AI decisions on variable input:**
- Email triage and classification
- News/PR/task prioritization
- Any workflow where you keep getting inconsistent or biased results

**Not needed — leave these as plain MD clawflows:**
- Reminders, notifications, scheduled messages
- Anything where the output doesn't depend on incoming data

## How it works

1. Tell your agent which workflow to wrap: *"wrap the check-email workflow"*
2. The agent reads the source `WORKFLOW.md`, breaks it into atomic steps, and generates a Python script
3. Each AI decision becomes one `call()` — strict JSON in, strict JSON out, no free text
4. Side effects (reading files, sending output) are plain Python with no model call
5. The script is registered as a new `<name>-py` clawflow and auto-enabled

## Model selection

The generated script reads `FLOWWRAPPER_MODEL` from your environment at runtime:

```bash
export FLOWWRAPPER_MODEL=ollama/qwen2.5:7b   # default if not set
export FLOWWRAPPER_MODEL=ollama/qwen2.5:14b  # override anytime
export FLOWWRAPPER_MODEL=anthropic/claude-haiku-4-5-20251001  # or a cloud model
```

The recommended model for each workflow is noted as a comment at the top of the generated script.
LiteLLM handles all provider routing — same script works with Ollama, Anthropic, OpenAI, Mistral, etc.

## Optimization loop

For complex workflows, after the first run the agent can optimize the generated script:

- Ask you how it went
- Check what parameters your model actually supports (temperature, response_format, function calling)
- Tighten prompts, adjust schemas, enable native JSON mode if available
- Show you exactly what changed before writing anything

This loop is optional and recommended only for workflows with multiple AI calls.
Simple single-call workflows rarely need it.

## What's in this folder

```
flowwrapper/
├── WORKFLOW.md                          # The clawflow — instructions for your agent
├── README.md                            # This file
└── scripts/
    └── example_check_email_wrapped.py   # Reference: what a wrapped check-email looks like
```

The `example_check_email_wrapped.py` shows the pattern:
reads a local Maildir (via offlineimap), classifies each email with one JSON call,
summarizes action-required ones with a second call, prints a structured report.
Use it as a starting point for your own wrapped workflows.

## Privacy

Generated scripts run entirely locally when paired with a local model.
No email content, no personal data, no workflow output ever leaves your machine.

[Ollama](https://ollama.com) and [LM Studio](https://lmstudio.ai) are both good options
for running local models — they expose a compatible API that LiteLLM routes to out of the box:

```bash
# Ollama
export FLOWWRAPPER_MODEL=ollama/qwen2.5:7b

# LM Studio (runs on localhost:1234 by default)
export FLOWWRAPPER_MODEL=lm_studio/qwen2.5-7b
export LM_STUDIO_API_BASE=http://localhost:1234
```

Cloud models (Anthropic, OpenAI, etc.) work too but send your data externally —
use them only for workflows where that's acceptable.

## Requirements

- [ClawFlows](https://github.com/nikilster/clawflows) installed
- [LiteLLM](https://github.com/BerriAI/litellm): `pip install litellm`
- [python-dotenv](https://github.com/theskumar/python-dotenv): `pip install python-dotenv`
- [Ollama](https://ollama.com) or [LM Studio](https://lmstudio.ai) for local/private execution

## Author

[@souly9999](https://x.com/souly9999)
