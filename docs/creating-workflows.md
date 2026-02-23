# Creating Workflows

How to build your own ClawFlows workflow.

## Creating a Workflow (for Agents)

When a user wants a custom workflow, walk them through it conversationally before creating anything.

### Step 1: Ask These Questions

1. **What should it do?** — Get the core idea
2. **When should it run?** — Scheduled (e.g., "9am", "9am, 5pm") or only when they ask (on-demand)?
3. **Anything specific?** — Details about how it should work

That's it. You pick the name and emoji based on what they describe.

### Step 2: Create It

```bash
clawflows create --from-json '{
  "name": "remind-to-stretch",
  "emoji": "🧘",
  "summary": "Stretch reminders during work hours",
  "schedule": "9am, 11am, 1pm, 3pm, 5pm",
  "description": "Send me a friendly reminder to stretch and take a quick break from the desk."
}'
```

#### JSON Fields

| Field | Required | Example |
|-------|----------|---------|
| `name` | Yes | `remind-to-stretch` (you pick this — lowercase, hyphenated) |
| `emoji` | No | `🧘` (you pick this — default: 🔧) |
| `summary` | Yes | One-line description |
| `schedule` | No | `"9am"` or `"9am, 5pm"` — omit for on-demand |
| `description` | Yes | What the workflow should do |

### Step 3: Show It and Ask for Edits

After creating the workflow:

1. **Read the WORKFLOW.md** that was just created and show the user the full contents
2. **Ask if they want any changes** — "Here's your workflow — want to tweak anything?"
3. If they want edits, make the changes directly to the WORKFLOW.md file and show them the updated version
4. Repeat until they're happy

The workflow is created in `workflows/available/custom/` and automatically enabled. AGENTS.md is updated so you know about it. Custom workflows are safe from updates.

### Example Conversation

```
User: "make me a workflow to remind me to stretch"

Agent: "On it! Should this run on a schedule (like every few hours during
work) or only when you ask?"

User: "every 2 hours while I'm working"

Agent: "Got it — I'll set it for 9am, 11am, 1pm, 3pm, and 5pm."

[Runs: clawflows create --from-json '{"name": "remind-to-stretch", ...}']
[Reads the created WORKFLOW.md]

Agent: "Here's your new workflow:

---
name: remind-to-stretch
emoji: 🧘
description: Stretch reminders during work hours
schedule: "9am, 11am, 1pm, 3pm, 5pm"
---

# Remind To Stretch

Send me a friendly reminder to stretch and take a quick break from the desk.

---

It's enabled and will run 5 times during work hours. Want to tweak anything?"

User: "can you add a tip about a specific stretch each time?"

Agent: [Updates the WORKFLOW.md, shows the new version]

"Updated! Here's the new version: ..."
```

## Workflow Structure

Each workflow is a folder with a `WORKFLOW.md` and optional supporting files:

```
my-workflow/
├── WORKFLOW.md          # Instructions (frontmatter + steps)
├── config.env           # Optional: environment variables
└── scripts/             # Optional: helper scripts
    └── do-thing.sh
```

The only required file is `WORKFLOW.md`. Scripts and config are optional — most workflows don't need them.

## WORKFLOW.md Format

```yaml
---
name: send-morning-briefing
emoji: ☀️
description: Daily morning briefing — gathers weather, calendar, priorities, and news into one summary.
author: nikilster @nikil
schedule: "7am"
requires:
  - name: calendar
    description: Google Calendar or similar
  - name: weather
    description: Weather service
---

# Morning Briefing

## What It Does
1. Check today's calendar
2. Get weather forecast
3. Summarize priorities
4. Deliver briefing

## After Running
Send the briefing to the user's preferred channel.
```

## Frontmatter Fields

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Matches the folder name. Lowercase, hyphenated, verb-first. |
| `emoji` | No | Single emoji for display. |
| `description` | Yes | What it does — a plain description the agent can match on. |
| `author` | No | Who made it. GitHub username and/or X handle, space-separated. |
| `schedule` | No | When to run automatically. Omit for on-demand only. |
| `requires` | No | Skills and tools needed. Each has a `name` and `description`. |

### The `author` Field

Credit yourself with your GitHub username, X handle, or both:

```yaml
author: nikilster              # GitHub only
author: @nikil                 # X only
author: nikilster @nikil       # Both
```

- No `@` → links to `github.com/username`
- With `@` → links to `x.com/handle`
- Space-separated if you want both

### Writing Good Descriptions

The `description` field tells humans and agents what the workflow does. Write a clear, concise description — the agent matches on it naturally:

```yaml
description: Bedtime automation — turns off all lights, thermostats, and music, then turns on the bedroom fan.
```

### The `schedule` Field

Set when the workflow runs automatically. Use simple times like `"7am"` or multiple times like `"9am, 1pm, 5pm"`:

```yaml
schedule: "7am"                    # Once daily
schedule: "9am, 1pm, 5pm"          # Three times daily
schedule: "8am, 6pm"               # Twice daily
```

Times are in 12-hour format with am/pm. No days — scheduled workflows run daily at the specified times.

Omit the `schedule` field for on-demand workflows that only run when triggered manually.

### The `requires` Field

List the tools and services the workflow needs. The `name` matches the skill name (from that skill's `SKILL.md` frontmatter). The `description` explains what it is in plain English.

```yaml
requires:
  - name: openhue
    description: Philips Hue smart bulbs
  - name: lutron
    description: Lutron Caseta light switches and dimmers
```

## Naming Convention

Workflow names start with a verb. Pick from these six:

| Verb | Use for | Examples |
|------|---------|----------|
| **activate** | Toggle a mode or state | `activate-sleep-mode`, `activate-night-mode` |
| **process** | Clean up or transform data | `process-email`, `process-notifications` |
| **check** | Monitor or review something | `check-x`, `check-calendar` |
| **build** | Create something new | `build-nightly-project`, `build-changelog` |
| **send** | Deliver output to someone | `send-morning-briefing`, `send-report` |
| **sync** | Reconcile data between systems | `sync-dotfiles`, `sync-calendar` |

## Workflow Content

Keep it **simple and clear**. Each step should be one action described in plain language. Fewer steps is better — if you can say it in 3 steps, don't use 7.

Write clear, numbered steps the agent can follow:

```markdown
## 1. Fetch Data

Pull recent data:

` ` `bash
some-command --flag
` ` `

## 2. Process Results

For each result, do X...

## After Running

Report what you found.
```

## Adding Your Workflow

### For personal use

Run `clawflows create` (interactive) or `clawflows create --from-json '{...}'` (programmatic). This creates the workflow in `workflows/available/custom/` and auto-enables it with a symlink.

### To the community

1. Create and test your workflow with `clawflows create`
2. Submit it with `clawflows submit <name>`

## Optional: Config Files

If your workflow needs user-specific settings, add a `config.env`:

```bash
# config.env
EMAIL=user@example.com
SLACK_CHANNEL=#general
```

Reference it in your workflow:

```markdown
## 1. Load Config

Source the config file:
` ` `bash
source config.env
` ` `
```

The agent will prompt users to fill in their values when they enable the workflow.

## Optional: Scripts

For complex logic, add helper scripts in a `scripts/` folder:

```
my-workflow/
├── WORKFLOW.md
└── scripts/
    ├── fetch-data.sh
    └── process.py
```

Reference them in your workflow:

```markdown
## 2. Fetch Data

Run the fetch script:
` ` `bash
./scripts/fetch-data.sh
` ` `
```

Keep scripts simple and well-commented. The agent will execute them as instructed.

## Keep Workflows Generic

Write workflows so any user can enable them without editing. Never hardcode personal details — let the workflow discover them at runtime.

**Don't hardcode:**
- Names, locations, timezones
- Employers, job titles, skills
- Favorite apps or specific accounts

**Instead:**
- Say "the user" not a specific name
- Check location/timezone at runtime from the system or calendar
- Describe tasks generically — "summarize today's meetings" not "summarize Nikil's React standups"

**Bad:**
```
Check the weather in San Francisco and brief Nikil on his frontend meetings.
```

**Good:**
```
Check the weather for the user's location and summarize today's calendar meetings.
```

If someone shares your workflow with a friend, it should just work.

## Tips

- Keep it self-contained — someone reading just the `WORKFLOW.md` should be able to follow it
- Include example commands with placeholders (`YOUR_EMAIL`, etc.)
- Be specific about what to do, not theory
- End with an "After Running" or "Notes" section
- Test it before submitting
