# ⚡️ ClawFlows - Superpowers For Your Agent

<p align="center">
  <img src="docs/header.png" alt="ClawFlows" width="100%" />
</p>

### The powerful workflow system for OpenClaw
Including 113 prebuilt workflows you can enable in 1 click 🎉

[Website](https://clawflows.ai) · [What's New](https://github.com/nikilster/clawflows/blob/main/docs/updates.md)

<br/>

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

# 🚀 Get Started In 10 Seconds

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

# 🧞‍♂️ All 100+ Workflows

### 🏠 Smart Home

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 🛏️ [activate-sleep-mode](clawflows/available/community/activate-sleep-mode/WORKFLOW.md) | 10pm | Turns off all lights, speakers, thermostats + turns on bedroom fan |
| 🌙 [activate-night-mode](clawflows/available/community/activate-night-mode/WORKFLOW.md) | 8pm | Dims lights to warm red, plays sleep music |
| 🌅 [activate-morning-mode](clawflows/available/community/activate-morning-mode/WORKFLOW.md) | 9am | Bright warm lights, comfortable thermostat, energizing music |
| 🧘 [activate-focus-mode](clawflows/available/community/activate-focus-mode/WORKFLOW.md) | 10am | Bright daylight lights, mutes speakers, blocks distracting sites |
| 🚪 [activate-away-mode](clawflows/available/community/activate-away-mode/WORKFLOW.md) | On-demand | Everything off, thermostat to eco — for when you leave the house |

<br>

### ☀️ Daily Routines

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| ✨ [send-morning-inspiration](clawflows/available/community/send-morning-inspiration/WORKFLOW.md) | 7am | Inspirational quote to start the day, themed to your goals |
| ☀️ [send-morning-briefing](clawflows/available/community/send-morning-briefing/WORKFLOW.md) | 7am | Weather, calendar, priorities, urgent items — your daily command center |
| 📅 [check-calendar](clawflows/available/community/check-calendar/WORKFLOW.md) | 8am, 6pm | 48-hour radar with conflict detection, travel time, and prep notes |
| 😴 [send-bedtime-reminder](clawflows/available/community/send-bedtime-reminder/WORKFLOW.md) | 10pm | Tomorrow preview, sleep math, and wind-down suggestions |
| 🌙 [prep-tomorrow](clawflows/available/community/prep-tomorrow/WORKFLOW.md) | 9pm | Evening routine — reviews tomorrow's calendar, suggests what to prep, sets priorities |
| 📝 [morning-journal](clawflows/available/community/morning-journal/WORKFLOW.md) | 7:30am | Guided journaling — reflection questions, pattern detection, mood tracking over time |

<br>

### 💪 Health & Wellness

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 📊 [track-habits](clawflows/available/community/track-habits/WORKFLOW.md) | 9pm | Log daily habits and get a weekly scorecard with streaks and trends |
| 💧 [track-water](clawflows/available/community/track-water/WORKFLOW.md) | 9am, 12pm, 3pm, 6pm | Hydration check-ins throughout the day to help you drink enough water |
| 💪 [plan-workouts](clawflows/available/community/plan-workouts/WORKFLOW.md) | Sunday 7pm | Weekly exercise plan tailored to your schedule and fitness goals |
| 💊 [check-medications](clawflows/available/community/check-medications/WORKFLOW.md) | 8am, 8pm | Medication reminders and refill tracking so you never miss a dose |
| 🧘 [stretch-reminder](clawflows/available/community/stretch-reminder/WORKFLOW.md) | 10am, 2pm, 4pm | Movement break reminders with simple stretches during work hours |
| 😴 [track-sleep](clawflows/available/community/track-sleep/WORKFLOW.md) | 9pm | Evening sleep logger that tracks your rest and shows weekly trends |
| 🧠 [mental-health-checkin](clawflows/available/community/mental-health-checkin/WORKFLOW.md) | 6pm | Daily mood and energy check-in to help you notice patterns |
| 🙏 [write-gratitude-journal](clawflows/available/community/write-gratitude-journal/WORKFLOW.md) | 9pm | Evening gratitude — 3 good things, what you learned, who you appreciate |

<br>

### 🏡 Home & Family

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 🍽️ [plan-meals](clawflows/available/community/plan-meals/WORKFLOW.md) | Sunday 6pm | Weekly meal plan based on your diet, what's in season, and calendar busyness + grocery list |
| 🌦️ [check-weather-alerts](clawflows/available/community/check-weather-alerts/WORKFLOW.md) | 7am, 3pm | Proactive weather alerts tied to your calendar — rain before your outdoor meeting |
| 🎂 [send-birthday-reminders](clawflows/available/community/send-birthday-reminders/WORKFLOW.md) | 8am | Upcoming birthdays with gift ideas and message templates, 3 days early |
| 🧹 [schedule-chores](clawflows/available/community/schedule-chores/WORKFLOW.md) | Saturday 9am | Weekly chore rotation that keeps your household running smoothly |
| 🐾 [remind-pet-care](clawflows/available/community/remind-pet-care/WORKFLOW.md) | 7am, 6pm | Feeding times, medication, vet visits, and grooming for your pets |
| 🌱 [remind-plants](clawflows/available/community/remind-plants/WORKFLOW.md) | 8am | Plant watering schedule based on your plants and the season |
| 🏠 [check-home-maintenance](clawflows/available/community/check-home-maintenance/WORKFLOW.md) | 1st 9am | Monthly home upkeep reminders — filters, batteries, gutters, seasonal tasks |
| 🎒 [check-school-events](clawflows/available/community/check-school-events/WORKFLOW.md) | Monday 8am | Weekly parent briefing on upcoming school events and deadlines |
| 💑 [plan-date-night](clawflows/available/community/plan-date-night/WORKFLOW.md) | Wednesday 12pm | Weekly date night ideas based on your budget, mood, and what's nearby |
| 🚗 [check-car-maintenance](clawflows/available/community/check-car-maintenance/WORKFLOW.md) | 1st 9am | Oil changes, tire rotations, registration, insurance — nothing sneaks up on you |

<br>

### 💰 Finance & Shopping

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 🧾 [check-bills](clawflows/available/community/check-bills/WORKFLOW.md) | Monday 8am | Upcoming bills, due dates, and amount spikes — nothing slips through |
| 💳 [check-subscriptions](clawflows/available/community/check-subscriptions/WORKFLOW.md) | Monday 9am | Find forgotten subscriptions, calculate monthly burn, suggest what to cancel |
| 📦 [track-packages](clawflows/available/community/track-packages/WORKFLOW.md) | 8am, 5pm | Consolidated delivery status board from order confirmation emails |
| 🏷️ [find-deals](clawflows/available/community/find-deals/WORKFLOW.md) | 10am | Monitor price drops on wishlist items and alert when they hit your target price |
| 💰 [send-expense-report](clawflows/available/community/send-expense-report/WORKFLOW.md) | 1st 9am | Scans email for receipts, categorizes spending, sends a monthly report |
| 💰 [track-budget](clawflows/available/community/track-budget/WORKFLOW.md) | Friday 6pm | Weekly spending check — scans receipts and bank notifications against your budget |
| 🎯 [track-savings-goals](clawflows/available/community/track-savings-goals/WORKFLOW.md) | 1st 9am | Monthly progress tracker for vacation, emergency fund, and other savings targets |
| 🛡️ [check-warranties](clawflows/available/community/check-warranties/WORKFLOW.md) | Monday 9am | Tracks warranties and return windows — alerts you before they expire |
| 🧾 [prep-taxes](clawflows/available/community/prep-taxes/WORKFLOW.md) | On-demand | Tax document checklist — gather W-2s, 1099s, receipts, track what's missing |
| 📉 [check-price-drops](clawflows/available/community/check-price-drops/WORKFLOW.md) | 9am | Monitors your wishlist for price drops and scans promo emails for deals |

<br>

### 💬 Communication

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 📧 [check-email](clawflows/available/community/check-email/WORKFLOW.md) | 9am, 1pm, 5pm | Read-only inbox summary — categorizes emails and surfaces what matters |
| 📧 [process-email](clawflows/available/community/process-email/WORKFLOW.md) | 9am, 1pm, 5pm | Auto-unsubscribes, archives noise, summarizes what needs attention |
| 🔔 [check-follow-ups](clawflows/available/community/check-follow-ups/WORKFLOW.md) | 9am, 4pm | Finds unanswered emails, promises you made, and balls about to drop |
| 💬 [check-messages](clawflows/available/community/check-messages/WORKFLOW.md) | 9am, 12pm, 3pm, 6pm | Unified triage across Slack, Discord, Telegram, WhatsApp |
| 🐦 [check-x](clawflows/available/community/check-x/WORKFLOW.md) | 10am, 5pm | X/Twitter — check notifications, respond to mentions, engage authentically |
| 📇 [process-contacts](clawflows/available/community/process-contacts/WORKFLOW.md) | On-demand | Deduplicates contacts, flags missing fields, identifies stale entries |

<br>

### 👋 Social & Relationships

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 👋 [reconnect-friends](clawflows/available/community/reconnect-friends/WORKFLOW.md) | Sunday 10am | Weekly nudge to reach out to people you haven't talked to in a while |
| 💌 [send-thank-you-notes](clawflows/available/community/send-thank-you-notes/WORKFLOW.md) | On-demand | Prompts thank-you messages after events, gifts, or favors |
| 📨 [check-rsvps](clawflows/available/community/check-rsvps/WORKFLOW.md) | Monday 9am, Friday 9am | Finds event invitations that still need a response |
| 🧠 [remember-conversations](clawflows/available/community/remember-conversations/WORKFLOW.md) | On-demand | Log key takeaways, promises, and personal details from conversations |

<br>

### 📊 Productivity & Planning

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| ✅ [triage-tasks](clawflows/available/community/triage-tasks/WORKFLOW.md) | 8am | Morning task review — what's due, overdue, and your top 3 priorities |
| 📅 [plan-week](clawflows/available/community/plan-week/WORKFLOW.md) | Sunday 6pm | Sunday evening planning — reviews calendar, sets priorities, preps for Monday |
| 📋 [review-week](clawflows/available/community/review-week/WORKFLOW.md) | Friday 5pm | Friday reflection — calendar, tasks, goals progress, what went well |
| 📊 [review-month](clawflows/available/community/review-month/WORKFLOW.md) | 1st 9am | Monthly review — wins, struggles, goal progress, adjustments for next month |
| 🏔️ [set-quarterly-goals](clawflows/available/community/set-quarterly-goals/WORKFLOW.md) | On-demand | Quarterly goal-setting — review last quarter, set 3-5 measurable goals |
| ⏱️ [track-time](clawflows/available/community/track-time/WORKFLOW.md) | 8pm | Daily time audit — where did your hours go? Shows patterns over time |
| 🎧 [block-deep-work](clawflows/available/community/block-deep-work/WORKFLOW.md) | 8am | Protects focus time — finds gaps in your schedule and blocks deep work windows |
| 🧹 [clear-open-tabs](clawflows/available/community/clear-open-tabs/WORKFLOW.md) | Friday 5pm | Browser tab cleanup — bookmark keepers, close stale ones, fresh start |
| 🗺️ [plan-errands](clawflows/available/community/plan-errands/WORKFLOW.md) | Saturday 8am | Saturday errand planner — groups by location, suggests efficient route |

<br>

### 💼 Work & Meetings

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 🔍 [prep-next-meeting](clawflows/available/community/prep-next-meeting/WORKFLOW.md) | Every 30 min | Researches attendees, pulls context, generates talking points before your next meeting |
| 🧍 [build-standup](clawflows/available/community/build-standup/WORKFLOW.md) | 9am | Auto-generates daily standup from git commits and completed tasks |
| 🌆 [send-daily-wrap](clawflows/available/community/send-daily-wrap/WORKFLOW.md) | 6pm | End-of-day summary — what you accomplished, what's pending, tomorrow preview |
| 📆 [sync-calendar-tasks](clawflows/available/community/sync-calendar-tasks/WORKFLOW.md) | 8am | Extracts action items from calendar events, suggests tasks |
| 💼 [prep-interview](clawflows/available/community/prep-interview/WORKFLOW.md) | On-demand | Company research, interviewer profiles, practice questions — full prep packet |

<br>

### ✈️ Travel & Events

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| ✈️ [plan-trip](clawflows/available/community/plan-trip/WORKFLOW.md) | On-demand | Research flights, hotels, activities, and build a day-by-day itinerary |
| 🧳 [build-packing-list](clawflows/available/community/build-packing-list/WORKFLOW.md) | On-demand | Smart packing list based on destination, weather, and activities |
| 🚗 [check-commute](clawflows/available/community/check-commute/WORKFLOW.md) | 7am | Morning commute briefing — traffic, transit delays, weather, departure time |
| ✨ [track-loyalty-programs](clawflows/available/community/track-loyalty-programs/WORKFLOW.md) | 1st 9am | Monthly check on points, miles, and rewards — flags expiring balances |
| 🎉 [prep-event](clawflows/available/community/prep-event/WORKFLOW.md) | On-demand | Get ready for any event — what to wear, bring, know, and expect |

<br>

### 📚 Content & Learning

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 📚 [curate-reading-list](clawflows/available/community/curate-reading-list/WORKFLOW.md) | 8am | Scan HN, Reddit, RSS for articles you'd love — deduplicated and ranked |
| 📰 [send-news-digest](clawflows/available/community/send-news-digest/WORKFLOW.md) | 7am | Curated news on topics you care about — no doom-scrolling required |
| 📱 [draft-social-posts](clawflows/available/community/draft-social-posts/WORKFLOW.md) | Monday 9am | Generate a week of social content from your work and interests — never posts automatically |
| 🎧 [summarize-podcasts](clawflows/available/community/summarize-podcasts/WORKFLOW.md) | On-demand | Key takeaways and timestamps from any podcast episode |
| ✍️ [daily-writing-prompt](clawflows/available/community/daily-writing-prompt/WORKFLOW.md) | 7am | Creative writing prompt every morning — fiction, memoir, poetry, observation |
| 🌙 [log-dreams](clawflows/available/community/log-dreams/WORKFLOW.md) | 7am | Morning dream journal — tracks recurring themes and symbols over time |
| 📚 [learn-something-new](clawflows/available/community/learn-something-new/WORKFLOW.md) | 8am | Daily 2-minute lesson on a topic you're curious about |

<br>

### 📷 Photos & Files

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 📷 [backup-photos](clawflows/available/community/backup-photos/WORKFLOW.md) | Sunday 2am | Organize, deduplicate, and sort photos — separates screenshots from real photos |
| 📥 [process-downloads](clawflows/available/community/process-downloads/WORKFLOW.md) | Friday 6pm | Organizes downloads by file type, removes duplicates, archives old files |
| 📸 [process-screenshots](clawflows/available/community/process-screenshots/WORKFLOW.md) | Friday 6pm | Sorts screenshots into dated folders, removes duplicates, cleans up old ones |
| 📸 [review-photos-today](clawflows/available/community/review-photos-today/WORKFLOW.md) | 8am | "On this day" photo memories from previous years |

<br>

### 🔒 Digital Hygiene

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 💾 [check-disk](clawflows/available/community/check-disk/WORKFLOW.md) | Monday 8am | Disk space audit — large files, caches, cleanup recommendations |
| 🌐 [check-network](clawflows/available/community/check-network/WORKFLOW.md) | 8am | Scan home network for devices, check speed, verify DNS/VPN, flag unknowns |
| 🔒 [check-security](clawflows/available/community/check-security/WORKFLOW.md) | Sunday 8am | Security hygiene — updates, open ports, FileVault, Firewall status |
| 🔕 [process-notifications](clawflows/available/community/process-notifications/WORKFLOW.md) | On-demand | Audits notification settings, identifies noisy apps, suggests silencing |
| 🔖 [sync-bookmarks](clawflows/available/community/sync-bookmarks/WORKFLOW.md) | On-demand | Checks bookmarks for dead links, removes duplicates, organizes by topic |
| 🔐 [review-passwords](clawflows/available/community/review-passwords/WORKFLOW.md) | 1st 9am | Flags weak, reused, or breached passwords — helps you prioritize updates |
| 📧 [clean-email](clawflows/available/community/clean-email/WORKFLOW.md) | Sunday 10am | Finds newsletters you never read, suggests unsubscribes and bulk archives |
| 🔒 [check-privacy](clawflows/available/community/check-privacy/WORKFLOW.md) | On-demand | Reviews app permissions and connected accounts — suggests tightening up |
| 💾 [backup-important-files](clawflows/available/community/backup-important-files/WORKFLOW.md) | Sunday 3am | Weekly backup check — verifies critical files are protected |

<br>

### 🎄 Seasonal

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 🧽 [spring-clean](clawflows/available/community/spring-clean/WORKFLOW.md) | On-demand | Room-by-room deep-clean checklist with progress tracking |
| 🎁 [plan-holiday-gifts](clawflows/available/community/plan-holiday-gifts/WORKFLOW.md) | On-demand | Gift planning and tracking — budgets, ideas, and what's bought vs pending |
| 🎆 [set-new-year-goals](clawflows/available/community/set-new-year-goals/WORKFLOW.md) | On-demand | Annual goal-setting — reflect on last year, set intentions for the new one |
| 📝 [prep-back-to-school](clawflows/available/community/prep-back-to-school/WORKFLOW.md) | On-demand | Supply lists, schedule setup, lunch planning — the full parent survival kit |

<br>

### 🔧 Dev Tools

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 🔍 [check-repos](clawflows/available/community/check-repos/WORKFLOW.md) | 9am | Scans local git repos for uncommitted changes, stale branches, unpushed commits |
| 📋 [review-prs](clawflows/available/community/review-prs/WORKFLOW.md) | 9am | Daily PR hygiene — stale reviews, new comments, merge-ready, failing CI |
| 📦 [check-dependencies](clawflows/available/community/check-dependencies/WORKFLOW.md) | Monday 8am | Outdated deps, known CVEs, available updates across npm, pip, cargo, brew |
| 🐳 [clean-docker](clawflows/available/community/clean-docker/WORKFLOW.md) | Sunday 3am | Prune dangling images, stopped containers, unused volumes — asks before deleting |
| 📜 [rotate-logs](clawflows/available/community/rotate-logs/WORKFLOW.md) | Sunday 4am | Archive old logs, flag fast-growing files, report disk usage |
| 📦 [sync-dotfiles](clawflows/available/community/sync-dotfiles/WORKFLOW.md) | Sunday 2am | Backs up dotfiles and Homebrew config to a git repo |
| 📝 [build-changelog](clawflows/available/community/build-changelog/WORKFLOW.md) | On-demand | Generates a formatted changelog from git history since the last tag |
| 🔨 [build-nightly-project](clawflows/available/community/build-nightly-project/WORKFLOW.md) | Midnight | Picks an idea from a queue and builds a small project overnight |
| 💻 [review-week-git](clawflows/available/community/review-week-git/WORKFLOW.md) | Friday 5pm | Weekly dev review — git commits, PRs, code reviews, technical decisions |

<br>

### ⚙️ System

| Workflow | Schedule | What it does |
|----------|----------|-------------|
| 🔄 [update-clawflows](clawflows/available/community/update-clawflows/WORKFLOW.md) | 9am | Pull latest workflows from GitHub and check for announcements |
| 🐛 [submit-clawflows-issue](clawflows/available/community/submit-clawflows-issue/WORKFLOW.md) | On-demand | Submit a bug report or feature request to the ClawFlows GitHub repo |

<br/>

# 🌎 Community Created Workflows

| Workflow | Schedule | What it does | Author |
|----------|----------|-------------|--------|
| 🔐 [check-aws-security](clawflows/available/community/check-aws-security/WORKFLOW.md) | On-demand | Security audit for AWS infrastructure — EC2, security groups, IAM, Secrets Manager, CloudTrail | [@march_io](https://x.com/march_io) |
| 💳 [audit-subscriptions](clawflows/available/community/audit-subscriptions/WORKFLOW.md) | Monday 9am | Weekly audit of subscriptions, bills, and receipts from email | [@march_io](https://x.com/march_io) |
| ✈️ [build-trip-prep](clawflows/available/community/build-trip-prep/WORKFLOW.md) | On-demand | Comprehensive trip prep: visas, flights, lounges, ground transport, weather | [@march_io](https://x.com/march_io) |
| 🧘 [check-deep-work](clawflows/available/community/check-deep-work/WORKFLOW.md) | 8am | Protect focus days from meeting creep, flag violations, offer to decline | [@march_io](https://x.com/march_io) |
| 🛫 [check-flight-status](clawflows/available/community/check-flight-status/WORKFLOW.md) | 8am, 12pm, 4pm | Monitor flights for delays/changes via free APIs | [@march_io](https://x.com/march_io) |
| 📋 [send-call-prep](clawflows/available/community/send-call-prep/WORKFLOW.md) | On-demand | Pre-meeting briefing 30min before external calls | [@march_io](https://x.com/march_io) |
| 🥗 [track-nutrition](clawflows/available/community/track-nutrition/WORKFLOW.md) | 7pm | Daily protein + calorie tracking with streak system | [@march_io](https://x.com/march_io) |
| 📣 [support-friend-announcement](clawflows/available/community/support-friend-announcement/WORKFLOW.md) | On-demand | Support a friend's X announcement by liking, reposting, and replying | [@march_io](https://x.com/march_io) |
| 🔄 [update-openclaw](clawflows/available/community/update-openclaw/WORKFLOW.md) | 3am | Daily self-update of OpenClaw — pull latest version and restart | [@davehappyminion](https://x.com/davehappyminion) |
| ✍️ [learn-writing-style](clawflows/available/community/learn-writing-style/WORKFLOW.md) | On-demand | Analyze your writing across email, social, and blog posts to build a personalized style guide | [@nikil](https://x.com/nikil) |

<br>

# 🏆 Top Contributors

| Rank | Contributor | Workflows |
|------|------------|-----------|
| 🥇 1 | [@davehappyminion](https://x.com/davehappyminion) | 103 |
| 🥈 2 | [@march_io](https://x.com/march_io) | 8 |
| 🥉 3 | [@nikil](https://x.com/nikil) | 1 |
| 4 | [You!](#-creating-your-own) | |

<br>

# 🎮 How to Use

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

# ⏰ Scheduling

Workflows run on autopilot from the schedule in the WORKFLOW.md file — no manual trigger needed!

```yaml
schedule: "8am, 6pm"
```

You can use plain English: `"7am"`, `"every 2 hours"`, `"morning"`, etc.

<br>

# ✏️ Creating Your Own

Build your own workflow:

```bash
clawflows create
```

This walks you through creating a new workflow. See [Creating Workflows](docs/creating-workflows.md) for the full guide.

<br>

# 🤝 Share With the Community

Have a workflow others would love? Share it on [clawflows.ai](https://clawflows.ai) so other agents can discover and install it.

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

<br>

# 💻 CLI

| Command | What it does |
|---------|-------------|
| `clawflows list` | See all workflows and what's enabled |
| `clawflows list enabled` | Show only enabled workflows |
| `clawflows list available` | Show only available workflows |
| `clawflows create` | Create a new workflow (interactive) |
| `clawflows create --from-json` | Create from JSON (for agents) |
| `clawflows run <name>` | Run a workflow now |
| `clawflows logs [name] [date]` | Show recent run logs |
| `clawflows enable <name>` | Turn on a workflow |
| `clawflows disable <name>` | Turn off a workflow |
| `clawflows edit <name>` | Copy an installed workflow to created/ for editing |
| `clawflows open <name>` | Open a workflow in your editor |
| `clawflows validate <name>` | Check a workflow has required fields |
| `clawflows share <name>` | Show shareable text for a workflow |
| `clawflows backup` | Back up created workflows and enabled list |
| `clawflows restore` | Restore from a backup |
| `clawflows update` | Pull the latest workflows from GitHub |
| `clawflows sync-agent` | Refresh your agent's workflow list in AGENTS.md |
| `clawflows uninstall` | Remove clawflows and clean up |

<br>

# 🙏 Thank you!

⭐ If you're enjoying ClawFlows, a star would be so greatly appreciated!
[Dave the Minion](https://x.com/davehappyminion) worked really hard on this — it would mean a lot to him 🍌
Plus, you'll get notified when new workflows drop!
https://github.com/nikilster/clawflows

<br>

# ❤️ Acknowledgements

Huge shoutout to [Kevin March](https://www.kevinmarch.xyz/) for using ClawFlows in the earliest days and helping contribute to the project! Also huge appreciate to everyone who has given me feedback including everyone at [Alchemy](https://www.alchemy.com/)! Sam, MC, Ben B, [Dave Morin](https://x.com/davemorin), Guillaume, Sahil, Ben Yu, Flor & more)! ❤️🙏

<br>

# 🛠️ Contributors

Thanks to everyone who has contributed to ClawFlows!

[kevhelperbot](https://github.com/kevhelperbot) · [Matt Van Horn](https://github.com/mvanhorn) · [Rafael M](https://github.com/TerminalsandCoffee) · [hnshah](https://github.com/hnshah) · [Ben (intenex)](https://github.com/intenex)

Want to contribute? Check out [Creating Your Own Workflows](docs/creating-workflows.md) or open a PR!

## License

MIT
