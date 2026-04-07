---
name: send-daily-wrap
emoji: "🌆"
description: Daily wrap-up — summarizes what you accomplished today from git, tasks, and calendar, then previews tomorrow.
author: @davehappyminion
schedule: "6pm"
---

# Daily Wrap

End-of-day summary — what you did, what's pending, what's tomorrow. Close the loop.

## 1. Gather Today's Accomplishments

### Git Commits
Using **git**, find your commits from today across all repositories.

### Completed Tasks
Using your **task manager skill**, get tasks completed today.

### Meetings Attended
Using your **calendar skill**, list today's meetings.

### Emails Sent
Using your **email skill**, count emails sent today.

## 2. Identify What's Still Open

### Unfinished
- Tasks started but not completed
- PRs opened but not merged
- Threads awaiting response

### Rolled Over
- Tasks due today that didn't get done
- Will become tomorrow's priorities

## 3. Preview Tomorrow

### Calendar
Using your **calendar skill**, get tomorrow's events.
- First event time
- Total meetings
- Any high-stakes items

### Tasks Due
Using your **task manager skill**, get tomorrow's tasks.

## 4. Generate the Wrap

```
🌙 Daily Wrap — {Day}, {Date}

✅ ACCOMPLISHED
• Merged auth refactor PR (#234)
• Fixed Safari payment bug
• Wrote 3 tests for checkout
• Team sync, 1:1 with Sarah

📊 BY THE NUMBERS
• {X} commits across {Y} repos
• {Z} tasks completed
• {N} emails sent
• {M} meetings

🔄 STILL OPEN
• Dashboard redesign — 60% done
• PR review for Mike — tomorrow

📅 TOMORROW
• First event: Standup at 9:00 AM
• {X} meetings scheduled
• Top priority: Finish dashboard

💡 REFLECTION
{Summary of the day}
"Solid progress on auth. Dashboard taking longer — might need to adjust scope."

---
{Closing based on productivity}
"Strong day — {X} tasks done. Rest up!"
or
"Lighter day — momentum builds tomorrow."
```

## 5. Deliver

Using your **messaging skill**, send the wrap to the user.

## 6. Prompt for Reflection (Optional)

Ask:
- "Anything to add about today?"
- "What's the one thing for tomorrow?"
- "Any wins worth celebrating?"

Store responses for weekly review.

## Tracking

- Last wrap date
- Daily stats history (for trends)

## Notes

- Schedule for end of workday (5-6 PM) or before bed (9 PM)
- Runs before send-bedtime-reminder
- Keep history for weekly/monthly reviews
- Celebrate consistency: "5 days in a row of closing loops!"
- If nothing accomplished: "Planning day. Momentum builds."
