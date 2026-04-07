# Contributing Workflows

Thanks for contributing to ClawFlows! This guide explains how to submit your workflow.

## Quick Start

```bash
# 1. Create your workflow
clawflows create

# 2. Test it
clawflows run your-workflow-name

# 3. Submit it
clawflows submit your-workflow-name
```

That's it! The `submit` command copies your workflow to the submissions folder and tells you how to open a PR.

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

See `community-submissions/_template/WORKFLOW.md` for a complete example.

## Submitting via Pull Request

### Using the CLI (Recommended)

```bash
clawflows submit your-workflow-name
```

This will:
1. Copy your workflow to `community-submissions/your-workflow-name/`
2. Show you the next steps to create a PR

### Manual Submission

1. Fork this repo
2. Copy your workflow folder to `community-submissions/your-workflow-name/`
3. Open a PR with the workflow name as the title

## Review Process

1. **Submit** — Open a PR with your workflow
2. **Review** — Maintainers will review for quality and safety
3. **Feedback** — We may request changes
4. **Merge** — Approved workflows get moved to the community collection

### What We Look For

- Clear, actionable instructions
- Proper secret placeholder syntax
- Works with standard OpenClaw setup
- No hardcoded personal data
- Useful to others in the community

## Questions?

Open an issue or ask in the PR!
