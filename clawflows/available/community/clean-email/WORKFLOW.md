---
name: clean-email
emoji: "📧"
description: Inbox cleanup assistant — finds newsletters you never read, promotional emails piling up, and old threads, then suggests unsubscribes and archive actions.
author: @davehappyminion
---

# Clean Email

Tame the inbox chaos. Find the senders filling up your email, figure out which ones you actually read, and clear out the rest.

## 1. Scan the Inbox

Using your **email skill**, analyze the last 30-60 days:

- Count emails by sender
- Identify newsletters and marketing emails
- Find automated notifications (social media, apps, shipping)
- Note which emails were opened vs. ignored
- Flag threads with no reply in 30+ days

## 2. Identify Cleanup Targets

Sort senders into: **never opened** (30+ days), **rarely opened** (less than 20%), **piling up** (10+ unread), and **old threads** (quiet 30+ days). For each, recommend: unsubscribe, archive all, or create a filter.

## 3. Present the Plan

```
📧 Inbox Cleanup — March 2026

YOUR INBOX: 847 unread from 126 senders

🗑️ UNSUBSCRIBE (12 senders, ~180 emails/month)
   Groupon — 22 unread, 0 opened in 60 days
   LinkedIn News — 18 unread, 1 opened
   ... (10 more)

📦 ARCHIVE (old threads, 45 emails)
   "Re: Holiday party planning" — last reply Dec 28
   ... (8 more)

🏷️ CREATE FILTERS (useful but noisy)
   GitHub notifications — 34 emails, auto-label instead

✅ Potential: ~180 fewer emails/month | ~10 min to clean up
```

## 4. Help Execute

Walk the user through each action they approve — unsubscribe links, bulk archives, filter setup. Only act on what they explicitly okay.

Send summary via your **messaging skill**.

## Notes

- **NEVER unsubscribe from anything without explicit approval.**
- **NEVER delete emails.** Archive only — deletion is permanent.
- For suspicious senders, suggest blocking instead of unsubscribing.
- If the inbox has thousands of unread, focus on the top 20 noisiest senders.
- No judgment on what people subscribe to. Their interests are their business.
