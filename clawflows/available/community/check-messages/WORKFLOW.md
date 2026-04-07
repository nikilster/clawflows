---
name: check-messages
emoji: "💬"
description: Unified message triage — checks Slack, Discord, Telegram, WhatsApp, and other messaging platforms for what needs your attention.
author: @davehappyminion
schedule: "9am, 12pm, 3pm, 6pm"
---

# Check Messages

Unified inbox for all your messaging platforms. One summary instead of five apps.

## 1. Gather Messages

Using your **messaging skills**, check each platform for unread messages and mentions:

### Platforms to Check
- **Slack** — DMs, mentions, channels with unreads
- **Discord** — DMs, mentions, server notifications
- **Telegram** — Unread chats, mentions
- **WhatsApp** — Unread conversations
- **iMessage** — Unread messages
- **Other** — Any messaging platforms the user has connected

Only check platforms you have skills for.

## 2. Categorize Messages

### 🔴 Urgent — Respond Now
- Direct questions waiting for you
- Time-sensitive ("can you join in 10 min?")
- From VIPs (boss, key clients, family)
- Contains "urgent", "ASAP", "help"

### 🟡 Important — Respond Today
- Active conversations you're in
- Action items assigned to you
- Threads where you were @mentioned
- Messages from close colleagues

### 🟢 FYI — Read When Free
- Channel announcements
- Group chat noise
- News/updates that don't need response
- Bot notifications

### ⚪ Skip
- Automated notifications
- Muted channels
- Old messages in fast-moving channels

## 3. Present the Summary

```
💬 Message Triage — {Date} {Time}

🔴 URGENT ({count})

[Slack] @jane in #engineering (2 min ago)
"Can you review this PR before standup?"
→ Needs: PR review

[Telegram] Mom (1 hour ago)
"Are you coming Sunday?"
→ Needs: Confirm or decline

🟡 IMPORTANT ({count})

[Discord] @mike in #general (3 hours ago)
"Thoughts on the new design?"
→ Needs: Opinion

🟢 FYI ({count})
• [Slack] #announcements — New policy posted
• [Discord] #releases — v2.3.0 shipped
• [Telegram] Group — 47 messages (general chat)

📊 Summary
• {X} messages across {Y} platforms
• {Z} need responses
• Oldest urgent: {time}
```

## 4. Quick Actions

For each message, offer:
- **Reply** — Draft a response
- **Snooze** — Remind in 1hr/tomorrow
- **Mark read** — Dismiss
- **Open** — Jump to the app/thread

## 5. Deliver Summary (Optional)

If running on schedule, send summary to user's preferred channel using your **messaging skill**.

## Notes

- Run on-demand ("check my messages") or scheduled (every few hours)
- Don't overwhelm — summarize if 200+ unreads
- Learn which channels matter vs. noise
- Respect focus time — don't interrupt with non-urgent stuff
