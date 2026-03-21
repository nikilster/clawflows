# ⚡️ ClawFlows - Superpowers For Your Agent

<p align="center">
  <img src="docs/header.png" alt="ClawFlows" width="100%" />
</p>

### The powerful workflow system for OpenClaw
Including 101 prebuilt workflows you can enable in 1 click 🎉
<br/><br/>

Some examples
- 📧 **Process my email** (9am, 1pm, 5pm) — Junk unsubscribed, noise archived, important stuff summarized. Your inbox, handled.
- ☀️ **Morning briefing** (7am) — Weather, calendar, priorities, and fires — delivered before you open your eyes.
- 🛏️ **Sleep mode** (10pm) — Every light off, music stopped, thermostat down, bedroom fan on. One command. Five systems. Done.
- 🎯 **Prep for my meeting** (every 30 min) — Attendees researched, history pulled, talking points written. Ready before you are.
- 🔨 **Build something while I sleep** (midnight) — Picks an idea, builds it overnight, hands you a finished project in the morning.

<br/>

Benefits
- ✏️ **Easily Create Workflows** Plain text, easy to create, easy to read, easy to share.
- ✅ **Reliable & Deterministic** Works every time. No scattered instructions across memory, heartbeat, and cron.
- 🔄 **Versioned & Reusable Workflows** Easily modify, save, and rollback your workflows
- 🌍 **Community Workflows** 100+ prebuilt workflows. Easily build & share workflows with your friends!

<br/>

## 🚀 Get Started In 10 Seconds

### Option 1: Direct install (recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/nikilster/clawflows/main/system/install.sh \
  | bash
```

### Option 2: Let your OpenClaw do it

Send this to your agent:

```
Install https://raw.githubusercontent.com/nikilster/clawflows/main/system/AGENT.md
```

<br>

## 🧞‍♂️ All 101 Workflows

### 🏠 Smart Home

| Workflow | What it does |
|----------|-------------|
| 🛏️ [activate-sleep-mode](workflows/available/community/activate-sleep-mode/WORKFLOW.md) | Turns off all lights, speakers, thermostats + turns on bedroom fan |
| 🌙 [activate-night-mode](workflows/available/community/activate-night-mode/WORKFLOW.md) | Dims lights to warm red, plays sleep music |
| 🌅 [activate-morning-mode](workflows/available/community/activate-morning-mode/WORKFLOW.md) | Bright warm lights, comfortable thermostat, energizing music |
| 🧘 [activate-focus-mode](workflows/available/community/activate-focus-mode/WORKFLOW.md) | Bright daylight lights, mutes speakers, blocks distracting sites |
| 🚪 [activate-away-mode](workflows/available/community/activate-away-mode/WORKFLOW.md) | Everything off, thermostat to eco — for when you leave the house |

### ☀️ Daily Routines

| Workflow | What it does |
|----------|-------------|
| ✨ [send-morning-inspiration](workflows/available/community/send-morning-inspiration/WORKFLOW.md) | Inspirational quote to start the day, themed to your goals |
| ☀️ [send-morning-briefing](workflows/available/community/send-morning-briefing/WORKFLOW.md) | Weather, calendar, priorities, urgent items — your daily command center |
| 📅 [check-calendar](workflows/available/community/check-calendar/WORKFLOW.md) | 48-hour radar with conflict detection, travel time, and prep notes |
| 😴 [send-bedtime-reminder](workflows/available/community/send-bedtime-reminder/WORKFLOW.md) | Tomorrow preview, sleep math, and wind-down suggestions |
| 🌙 [prep-tomorrow](workflows/available/community/prep-tomorrow/WORKFLOW.md) | Evening routine — reviews tomorrow's calendar, suggests what to prep, sets priorities |
| 📝 [morning-journal](workflows/available/community/morning-journal/WORKFLOW.md) | Guided journaling — reflection questions, pattern detection, mood tracking over time |

### 💪 Health & Wellness

| Workflow | What it does |
|----------|-------------|
| 📊 [track-habits](workflows/available/community/track-habits/WORKFLOW.md) | Log daily habits and get a weekly scorecard with streaks and trends |
| 💧 [track-water](workflows/available/community/track-water/WORKFLOW.md) | Hydration check-ins throughout the day to help you drink enough water |
| 💪 [plan-workouts](workflows/available/community/plan-workouts/WORKFLOW.md) | Weekly exercise plan tailored to your schedule and fitness goals |
| 💊 [check-medications](workflows/available/community/check-medications/WORKFLOW.md) | Medication reminders and refill tracking so you never miss a dose |
| 🧘 [stretch-reminder](workflows/available/community/stretch-reminder/WORKFLOW.md) | Movement break reminders with simple stretches during work hours |
| 😴 [track-sleep](workflows/available/community/track-sleep/WORKFLOW.md) | Evening sleep logger that tracks your rest and shows weekly trends |
| 🧠 [mental-health-checkin](workflows/available/community/mental-health-checkin/WORKFLOW.md) | Daily mood and energy check-in to help you notice patterns |
| 🙏 [write-gratitude-journal](workflows/available/community/write-gratitude-journal/WORKFLOW.md) | Evening gratitude — 3 good things, what you learned, who you appreciate |

### 🏡 Home & Family

| Workflow | What it does |
|----------|-------------|
| 🍽️ [plan-meals](workflows/available/community/plan-meals/WORKFLOW.md) | Weekly meal plan based on your diet, what's in season, and calendar busyness + grocery list |
| 🌦️ [check-weather-alerts](workflows/available/community/check-weather-alerts/WORKFLOW.md) | Proactive weather alerts tied to your calendar — rain before your outdoor meeting |
| 🎂 [send-birthday-reminders](workflows/available/community/send-birthday-reminders/WORKFLOW.md) | Upcoming birthdays with gift ideas and message templates, 3 days early |
| 🧹 [schedule-chores](workflows/available/community/schedule-chores/WORKFLOW.md) | Weekly chore rotation that keeps your household running smoothly |
| 🐾 [remind-pet-care](workflows/available/community/remind-pet-care/WORKFLOW.md) | Feeding times, medication, vet visits, and grooming for your pets |
| 🌱 [remind-plants](workflows/available/community/remind-plants/WORKFLOW.md) | Plant watering schedule based on your plants and the season |
| 🏠 [check-home-maintenance](workflows/available/community/check-home-maintenance/WORKFLOW.md) | Monthly home upkeep reminders — filters, batteries, gutters, seasonal tasks |
| 🎒 [check-school-events](workflows/available/community/check-school-events/WORKFLOW.md) | Weekly parent briefing on upcoming school events and deadlines |
| 💑 [plan-date-night](workflows/available/community/plan-date-night/WORKFLOW.md) | Weekly date night ideas based on your budget, mood, and what's nearby |
| 🚗 [check-car-maintenance](workflows/available/community/check-car-maintenance/WORKFLOW.md) | Oil changes, tire rotations, registration, insurance — nothing sneaks up on you |

### 💰 Finance & Shopping

| Workflow | What it does |
|----------|-------------|
| 🧾 [check-bills](workflows/available/community/check-bills/WORKFLOW.md) | Upcoming bills, due dates, and amount spikes — nothing slips through |
| 💳 [check-subscriptions](workflows/available/community/check-subscriptions/WORKFLOW.md) | Find forgotten subscriptions, calculate monthly burn, suggest what to cancel |
| 📦 [track-packages](workflows/available/community/track-packages/WORKFLOW.md) | Consolidated delivery status board from order confirmation emails |
| 🏷️ [find-deals](workflows/available/community/find-deals/WORKFLOW.md) | Monitor price drops on wishlist items and alert when they hit your target price |
| 💰 [send-expense-report](workflows/available/community/send-expense-report/WORKFLOW.md) | Scans email for receipts, categorizes spending, sends a monthly report |
| 💰 [track-budget](workflows/available/community/track-budget/WORKFLOW.md) | Weekly spending check — scans receipts and bank notifications against your budget |
| 🎯 [track-savings-goals](workflows/available/community/track-savings-goals/WORKFLOW.md) | Monthly progress tracker for vacation, emergency fund, and other savings targets |
| 🛡️ [check-warranties](workflows/available/community/check-warranties/WORKFLOW.md) | Tracks warranties and return windows — alerts you before they expire |
| 🧾 [prep-taxes](workflows/available/community/prep-taxes/WORKFLOW.md) | Tax document checklist — gather W-2s, 1099s, receipts, track what's missing |
| 📉 [check-price-drops](workflows/available/community/check-price-drops/WORKFLOW.md) | Monitors your wishlist for price drops and scans promo emails for deals |

### 💬 Communication

| Workflow | What it does |
|----------|-------------|
| 📧 [check-email](workflows/available/community/check-email/WORKFLOW.md) | Read-only inbox summary — categorizes emails and surfaces what matters |
| 📧 [process-email](workflows/available/community/process-email/WORKFLOW.md) | Auto-unsubscribes, archives noise, summarizes what needs attention |
| 🔔 [check-follow-ups](workflows/available/community/check-follow-ups/WORKFLOW.md) | Finds unanswered emails, promises you made, and balls about to drop |
| 💬 [check-messages](workflows/available/community/check-messages/WORKFLOW.md) | Unified triage across Slack, Discord, Telegram, WhatsApp |
| 🐦 [check-x](workflows/available/community/check-x/WORKFLOW.md) | X/Twitter — check notifications, respond to mentions, engage authentically |
| 📇 [process-contacts](workflows/available/community/process-contacts/WORKFLOW.md) | Deduplicates contacts, flags missing fields, identifies stale entries |

### 👋 Social & Relationships

| Workflow | What it does |
|----------|-------------|
| 👋 [reconnect-friends](workflows/available/community/reconnect-friends/WORKFLOW.md) | Weekly nudge to reach out to people you haven't talked to in a while |
| 💌 [send-thank-you-notes](workflows/available/community/send-thank-you-notes/WORKFLOW.md) | Prompts thank-you messages after events, gifts, or favors |
| 📨 [check-rsvps](workflows/available/community/check-rsvps/WORKFLOW.md) | Finds event invitations that still need a response |
| 🧠 [remember-conversations](workflows/available/community/remember-conversations/WORKFLOW.md) | Log key takeaways, promises, and personal details from conversations |

### 📊 Productivity & Planning

| Workflow | What it does |
|----------|-------------|
| ✅ [triage-tasks](workflows/available/community/triage-tasks/WORKFLOW.md) | Morning task review — what's due, overdue, and your top 3 priorities |
| 📅 [plan-week](workflows/available/community/plan-week/WORKFLOW.md) | Sunday evening planning — reviews calendar, sets priorities, preps for Monday |
| 📋 [review-week](workflows/available/community/review-week/WORKFLOW.md) | Friday reflection — calendar, tasks, goals progress, what went well |
| 📊 [review-month](workflows/available/community/review-month/WORKFLOW.md) | Monthly review — wins, struggles, goal progress, adjustments for next month |
| 🏔️ [set-quarterly-goals](workflows/available/community/set-quarterly-goals/WORKFLOW.md) | Quarterly goal-setting — review last quarter, set 3-5 measurable goals |
| ⏱️ [track-time](workflows/available/community/track-time/WORKFLOW.md) | Daily time audit — where did your hours go? Shows patterns over time |
| 🎧 [block-deep-work](workflows/available/community/block-deep-work/WORKFLOW.md) | Protects focus time — finds gaps in your schedule and blocks deep work windows |
| 🧹 [clear-open-tabs](workflows/available/community/clear-open-tabs/WORKFLOW.md) | Browser tab cleanup — bookmark keepers, close stale ones, fresh start |
| 🗺️ [plan-errands](workflows/available/community/plan-errands/WORKFLOW.md) | Saturday errand planner — groups by location, suggests efficient route |

### 💼 Work & Meetings

| Workflow | What it does |
|----------|-------------|
| 🔍 [prep-next-meeting](workflows/available/community/prep-next-meeting/WORKFLOW.md) | Researches attendees, pulls context, generates talking points before your next meeting |
| 🧍 [build-standup](workflows/available/community/build-standup/WORKFLOW.md) | Auto-generates daily standup from git commits and completed tasks |
| 🌆 [send-daily-wrap](workflows/available/community/send-daily-wrap/WORKFLOW.md) | End-of-day summary — what you accomplished, what's pending, tomorrow preview |
| 📆 [sync-calendar-tasks](workflows/available/community/sync-calendar-tasks/WORKFLOW.md) | Extracts action items from calendar events, suggests tasks |
| 💼 [prep-interview](workflows/available/community/prep-interview/WORKFLOW.md) | Company research, interviewer profiles, practice questions — full prep packet |

### ✈️ Travel & Events

| Workflow | What it does |
|----------|-------------|
| ✈️ [plan-trip](workflows/available/community/plan-trip/WORKFLOW.md) | Research flights, hotels, activities, and build a day-by-day itinerary |
| 🧳 [build-packing-list](workflows/available/community/build-packing-list/WORKFLOW.md) | Smart packing list based on destination, weather, and activities |
| 🚗 [check-commute](workflows/available/community/check-commute/WORKFLOW.md) | Morning commute briefing — traffic, transit delays, weather, departure time |
| ✨ [track-loyalty-programs](workflows/available/community/track-loyalty-programs/WORKFLOW.md) | Monthly check on points, miles, and rewards — flags expiring balances |
| 🎉 [prep-event](workflows/available/community/prep-event/WORKFLOW.md) | Get ready for any event — what to wear, bring, know, and expect |

### 📚 Content & Learning

| Workflow | What it does |
|----------|-------------|
| 📚 [curate-reading-list](workflows/available/community/curate-reading-list/WORKFLOW.md) | Scan HN, Reddit, RSS for articles you'd love — deduplicated and ranked |
| 📰 [send-news-digest](workflows/available/community/send-news-digest/WORKFLOW.md) | Curated news on topics you care about — no doom-scrolling required |
| 📱 [draft-social-posts](workflows/available/community/draft-social-posts/WORKFLOW.md) | Generate a week of social content from your work and interests — never posts automatically |
| 🎧 [summarize-podcasts](workflows/available/community/summarize-podcasts/WORKFLOW.md) | Key takeaways and timestamps from any podcast episode |
| ✍️ [daily-writing-prompt](workflows/available/community/daily-writing-prompt/WORKFLOW.md) | Creative writing prompt every morning — fiction, memoir, poetry, observation |
| 🌙 [log-dreams](workflows/available/community/log-dreams/WORKFLOW.md) | Morning dream journal — tracks recurring themes and symbols over time |
| 📚 [learn-something-new](workflows/available/community/learn-something-new/WORKFLOW.md) | Daily 2-minute lesson on a topic you're curious about |

### 📷 Photos & Files

| Workflow | What it does |
|----------|-------------|
| 📷 [backup-photos](workflows/available/community/backup-photos/WORKFLOW.md) | Organize, deduplicate, and sort photos — separates screenshots from real photos |
| 📥 [process-downloads](workflows/available/community/process-downloads/WORKFLOW.md) | Organizes downloads by file type, removes duplicates, archives old files |
| 📸 [process-screenshots](workflows/available/community/process-screenshots/WORKFLOW.md) | Sorts screenshots into dated folders, removes duplicates, cleans up old ones |
| 📸 [review-photos-today](workflows/available/community/review-photos-today/WORKFLOW.md) | "On this day" photo memories from previous years |

### 🔒 Digital Hygiene

| Workflow | What it does |
|----------|-------------|
| 💾 [check-disk](workflows/available/community/check-disk/WORKFLOW.md) | Disk space audit — large files, caches, cleanup recommendations |
| 🌐 [check-network](workflows/available/community/check-network/WORKFLOW.md) | Scan home network for devices, check speed, verify DNS/VPN, flag unknowns |
| 🔒 [check-security](workflows/available/community/check-security/WORKFLOW.md) | Security hygiene — updates, open ports, FileVault, Firewall status |
| 🔕 [process-notifications](workflows/available/community/process-notifications/WORKFLOW.md) | Audits notification settings, identifies noisy apps, suggests silencing |
| 🔖 [sync-bookmarks](workflows/available/community/sync-bookmarks/WORKFLOW.md) | Checks bookmarks for dead links, removes duplicates, organizes by topic |
| 🔐 [review-passwords](workflows/available/community/review-passwords/WORKFLOW.md) | Flags weak, reused, or breached passwords — helps you prioritize updates |
| 📧 [clean-email](workflows/available/community/clean-email/WORKFLOW.md) | Finds newsletters you never read, suggests unsubscribes and bulk archives |
| 🔒 [check-privacy](workflows/available/community/check-privacy/WORKFLOW.md) | Reviews app permissions and connected accounts — suggests tightening up |
| 💾 [backup-important-files](workflows/available/community/backup-important-files/WORKFLOW.md) | Weekly backup check — verifies critical files are protected |

### 🎄 Seasonal

| Workflow | What it does |
|----------|-------------|
| 🧽 [spring-clean](workflows/available/community/spring-clean/WORKFLOW.md) | Room-by-room deep-clean checklist with progress tracking |
| 🎁 [plan-holiday-gifts](workflows/available/community/plan-holiday-gifts/WORKFLOW.md) | Gift planning and tracking — budgets, ideas, and what's bought vs pending |
| 🎆 [set-new-year-goals](workflows/available/community/set-new-year-goals/WORKFLOW.md) | Annual goal-setting — reflect on last year, set intentions for the new one |
| 📝 [prep-back-to-school](workflows/available/community/prep-back-to-school/WORKFLOW.md) | Supply lists, schedule setup, lunch planning — the full parent survival kit |

### 🔧 Dev Tools

| Workflow | What it does |
|----------|-------------|
| 🔍 [check-repos](workflows/available/community/check-repos/WORKFLOW.md) | Scans local git repos for uncommitted changes, stale branches, unpushed commits |
| 📋 [review-prs](workflows/available/community/review-prs/WORKFLOW.md) | Daily PR hygiene — stale reviews, new comments, merge-ready, failing CI |
| 📦 [check-dependencies](workflows/available/community/check-dependencies/WORKFLOW.md) | Outdated deps, known CVEs, available updates across npm, pip, cargo, brew |
| 🐳 [clean-docker](workflows/available/community/clean-docker/WORKFLOW.md) | Prune dangling images, stopped containers, unused volumes — asks before deleting |
| 📜 [rotate-logs](workflows/available/community/rotate-logs/WORKFLOW.md) | Archive old logs, flag fast-growing files, report disk usage |
| 📦 [sync-dotfiles](workflows/available/community/sync-dotfiles/WORKFLOW.md) | Backs up dotfiles and Homebrew config to a git repo |
| 📝 [build-changelog](workflows/available/community/build-changelog/WORKFLOW.md) | Generates a formatted changelog from git history since the last tag |
| 🔨 [build-nightly-project](workflows/available/community/build-nightly-project/WORKFLOW.md) | Picks an idea from a queue and builds a small project overnight |
| 💻 [review-week-git](workflows/available/community/review-week-git/WORKFLOW.md) | Weekly dev review — git commits, PRs, code reviews, technical decisions |

### ⚙️ System

| Workflow | What it does |
|----------|-------------|
| 🔄 [update-clawflows](workflows/available/community/update-clawflows/WORKFLOW.md) | Pull latest workflows from GitHub and check for announcements |

### 🌐 Community Created

| Workflow | What it does | Author |
|----------|-------------|--------|
| 🔐 [check-aws-security](community-submissions/check-aws-security/WORKFLOW.md) | Security audit for AWS infrastructure — EC2, security groups, IAM, Secrets Manager, CloudTrail | [@march_io](https://x.com/march_io) |

<br>

## How to Use

Once installed, just talk to your agent naturally:

```
"Run my morning briefing"
"Check my calendar for conflicts"
"Turn on sleep mode"
"Process my email"
```

Or use the CLI to manage workflows directly:

```bash
# See what's available
clawflows list

# Enable a workflow
clawflows enable send-morning-briefing

# Disable one you don't need
clawflows disable check-x

# Get the latest workflows
clawflows update
```

When you enable a workflow, your agent automatically knows about it — no restart needed.

<br>

## Scheduling

Workflows run on autopilot from the schedule in the WORKFLOW.md file — no manual trigger needed!

```yaml
schedule: "8am, 6pm"
```

You can use plain English: `"7am"`, `"every 2 hours"`, `"morning"`, etc.

<br>

## Creating Your Own

Build your custom workflow:

```bash
clawflows create
```

This walks you through creating a new workflow. See [Creating Workflows](docs/creating-workflows.md) for the full guide.

## Share With the Community

Have a workflow others would love? Submit it!

```bash
# 1. Create and test your workflow
clawflows create
clawflows run your-workflow-name

# 2. Submit it for review
clawflows submit your-workflow-name

# 3. Open a pull request (instructions shown after submit)
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

<br>

## CLI

| Command | What it does |
|---------|-------------|
| `clawflows list` | See all workflows and what's enabled |
| `clawflows list enabled` | Show only enabled workflows |
| `clawflows list available` | Show only available workflows |
| `clawflows dashboard` | Open workflows in your browser |
| `clawflows create` | Create a new custom workflow (interactive) |
| `clawflows create --from-json` | Create from JSON (for agents) |
| `clawflows run <name>` | Run a workflow now |
| `clawflows logs [name] [date]` | Show recent run logs |
| `clawflows enable <name>` | Turn on a workflow |
| `clawflows disable <name>` | Turn off a workflow |
| `clawflows edit <name>` | Copy a community workflow to custom/ for editing |
| `clawflows open <name>` | Open a workflow in your editor |
| `clawflows validate <name>` | Check a workflow has required fields |
| `clawflows submit <name>` | Submit a custom workflow for community review |
| `clawflows share <name>` | Show shareable text for a workflow |
| `clawflows backup` | Back up custom workflows and enabled list |
| `clawflows restore` | Restore from a backup |
| `clawflows update` | Pull the latest workflows from GitHub |
| `clawflows sync-agent` | Refresh your agent's workflow list in AGENTS.md |
| `clawflows uninstall` | Remove clawflows and clean up |

<br>

## Thank you!

⭐ If you're enjoying ClawFlows, a star would be so greatly appreciated!
[Dave the Minion](https://x.com/davehappyminion) worked really hard on this — it would mean a lot to him 🍌
Plus, you'll get notified when new workflows drop!
https://github.com/nikilster/clawflows

## Acknowledgements

Huge shoutout to [Kevin March](https://www.kevinmarch.xyz/) for using ClawFlows in the earliest days and helping contribute to the project! Also huge appreciate to everyone who has given me feedback including everyone at [Alchemy](https://www.alchemy.com/)! Sam, MC, Ben B, [Dave Morin](https://x.com/davemorin), Guillaume, Sahil, Ben Yu, Flor & more)! ❤️🙏


## License

MIT
