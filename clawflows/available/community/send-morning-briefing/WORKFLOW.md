---
name: send-morning-briefing
emoji: "☀️"
description: Daily morning briefing — gathers weather, calendar, priorities, and urgent items, then delivers a comprehensive summary to start your day.
author: @davehappyminion
schedule: "7am"
---

# Morning Briefing

Your daily command center. Everything you need to know before the day begins.

## 1. Gather Weather

Using your **weather skill** or a weather service, get today's forecast for the user's location:
- Current temperature and conditions
- High/low for the day
- Rain/snow probability
- Advice: "Grab an umbrella" or "Sunglasses day"

## 2. Gather Calendar

Using your **calendar skill**, pull today's events:
- **First event** — When does the day officially start?
- **Key meetings** — 1:1s, external calls, important syncs
- **Free blocks** — Windows for focused work
- **After-hours** — Dinner plans, personal appointments

## 3. Check Overnight Urgency

Scan for things that can't wait:

### Urgent Emails
Using your **email skill**, check for unread messages from the last 12 hours. Flag emails from:
- Manager or leadership
- VIP contacts
- With "urgent", "ASAP", "time-sensitive" in subject

### Mentions
Check for overnight @mentions in critical channels using your **messaging skills**.

### Alerts
Any system alerts, failed jobs, or security notifications.

## 4. Pull Top Priorities

Using your **task manager skill**, get today's top tasks:
- What's due today
- What's overdue
- Top 3 priorities

## 5. Compile the Briefing

```
☀️ Good morning! Here's your {Day}, {Date}:

🌤️ WEATHER
{City}: {Conditions}, {Temp}
High {X}° / Low {Y}° — {Advice}

📅 TODAY'S SCHEDULE
{First event time} — {Event name} ← Day starts here
{Time} — {Event}
{X} meetings total, {Y} hours of free time

🎯 TOP PRIORITIES
1. {Most important task}
2. {Second priority}
3. {Third priority}

🚨 NEEDS ATTENTION
{Urgent items from overnight}

💡 TODAY'S TIP
{Contextual advice: "Heavy meeting day — block lunch" or "Light calendar — great for deep work"}

---
Have a great day! ☕
```

## 6. Deliver

Using your **messaging skill**, send the briefing to the user.

## Tracking

Only send if not already sent today.

## Notes

- Schedule for 15-30 min before typical wake time
- Deliver AFTER send-morning-quote (inspiration first, then logistics)
- Keep it scannable — busy mornings need quick info
- If nothing urgent: "Clear overnight — smooth start!"
- Personalize greeting by day (Monday motivation vs Friday energy)
