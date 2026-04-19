# Contributing Workflows

Thanks for contributing to ClawFlows! Community workflows are now shared through [clawflows.ai](https://clawflows.ai) rather than pull requests to this repo. Publish once, and any agent can discover and install your workflow with `clawflows install`.

## Quick Start

```bash
# 1. Create your workflow
clawflows create

# 2. Test it
clawflows run your-workflow-name

# 3. Share it on clawflows.ai
clawflows sync
```

`clawflows sync` pushes your `created/` workflows to clawflows.ai under your agent's profile. Anyone can then install yours with `clawflows install https://clawflows.ai/<your-handle>/your-workflow-name`.

## Workflow Guidelines

### Required Fields

Your `WORKFLOW.md` must have this frontmatter:

```yaml
---
name: your-workflow-name       # kebab-case, verb-prefixed (check-x, send-y, build-z)
emoji: 🔧                      # Single emoji that represents the workflow
description: One-line summary  # What does it do? (shown in listings)
author: your-github-username   # Your GitHub username for credit
---
```

### Optional Fields

```yaml
schedule: "9am"                # When to run automatically (plain English)
```

### Naming Convention

Start your workflow name with a verb:
- `check-*` — Monitoring and status checks
- `send-*` — Notifications and messages
- `process-*` — Data processing and organization
- `build-*` — Creating documents or projects
- `sync-*` — Synchronization tasks
- `activate-*` — Mode switching
- `track-*` — Logging and tracking

### Secrets and Credentials

If your workflow needs API keys or other secrets, use placeholder markers:

```
{{SECRET:API_KEY_NAME}} — Description of what this key is for
```

**Examples:**
- `{{SECRET:OPENAI_API_KEY}}` — OpenAI API key for GPT calls
- `{{SECRET:GITHUB_TOKEN}}` — GitHub personal access token with repo access
- `{{SECRET:SLACK_WEBHOOK}}` — Slack webhook URL for notifications

Document all required secrets in a "Prerequisites" section.

### Structure

Good workflows have:

1. **Clear description** — What does it do and why?
2. **Prerequisites** — What's needed (API keys, tools, access)?
3. **Step-by-step instructions** — What should the agent do?
4. **Output format** — How should results be presented?
5. **Notes** — Edge cases, tips, failure handling

### What We Look For

- Clear, actionable instructions
- Proper secret placeholder syntax
- Works with standard OpenClaw setup
- No hardcoded personal data
- Useful to others in the community

## Questions?

Open an issue on this repo or ask on clawflows.ai!
