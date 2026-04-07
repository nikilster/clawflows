---
name: submit-clawflows-issue
emoji: "🐛"
description: Submit an issue to the ClawFlows GitHub repo when you encounter a bug or have a feature request.
author: @nikil
---

# Submit Issue to ClawFlows

When you encounter a bug, error, or unexpected behavior while running ClawFlows workflows — or have an idea for improvement — use this workflow to submit a GitHub issue automatically.

## 1. Gather Context

Collect the relevant details:

- **What happened** — the error message, unexpected behavior, or feature idea
- **Which workflow** — the workflow name that triggered the issue (if applicable)
- **Steps to reproduce** — what commands were run or what the agent was doing
- **Environment** — run `clawflows --version` and `uname -ms` to capture version and platform

If this was triggered by an error during another workflow, pull the details from the run log:
```bash
clawflows logs <workflow-name>
```

## 2. Classify the Issue

Determine the type:

- **Bug** — something broke, errored, or behaved unexpectedly
- **Feature Request** — an idea for a new capability or improvement
- **Workflow Issue** — a problem with a specific community workflow

## 3. Draft the Issue

Write a clear, concise GitHub issue:

**Title:** Short summary starting with the type — e.g., "Bug: enable fails for workflows with spaces in name"

**Body:**
```markdown
## Description
[1-2 sentences explaining what happened or what you'd like]

## Steps to Reproduce
1. [Step one]
2. [Step two]
3. [What you observed]

## Expected Behavior
[What should have happened]

## Environment
- ClawFlows version: [version]
- Platform: [macOS/Linux]
- Shell: [bash/zsh]

## Additional Context
[Relevant log output, workflow name, or screenshots]
```

For feature requests, replace "Steps to Reproduce" with a "Use Case" section explaining why this would be useful.

## 4. Submit via GitHub CLI

Use the `gh` CLI to create the issue:

```bash
gh issue create --repo nikilster/clawflows --title "<title>" --body "<body>"
```

If `gh` is not installed or not authenticated, tell the user and provide the issue text so they can submit it manually at https://github.com/nikilster/clawflows/issues/new.

## 5. Confirm

Tell the user the issue was submitted and share the issue URL.

```
🐛 Issue submitted: https://github.com/nikilster/clawflows/issues/XX
Title: Bug: enable fails for workflows with spaces in name
```

## Notes

- Always be respectful and constructive in issue descriptions.
- Include only factual information — no speculation about root causes unless you have evidence.
- Never include sensitive information (API keys, tokens, personal data) in the issue body.
- If you're unsure whether something is a bug, submit it anyway — it's better to report than to stay silent.
- Check existing open issues first with `gh issue list --repo nikilster/clawflows` to avoid duplicates.
