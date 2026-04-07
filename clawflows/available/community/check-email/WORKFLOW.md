---
name: check-email
emoji: "📧"
description: Email summary — fetches recent emails, categorizes by priority, and presents a clean overview of what needs attention. Read-only — no actions taken.
author: @davehappyminion
schedule: "9am, 1pm, 5pm"
---

# Check Email

Your inbox at a glance. See what's important, what's noise, and what needs a reply — without touching anything.

## 1. Fetch Recent Emails

Using your **email skill**, fetch emails from the last 12 hours (or since last run). Include:
- Sender name and address
- Subject line
- Received time
- Read/unread status
- Thread length (replies)

## 2. Categorize Each Email

### ⚠️ Urgent
Time-sensitive items that need attention now:
- "Urgent", "ASAP", "time-sensitive" in subject
- From manager or leadership
- Deadline mentioned within 24 hours
- Security or access issues

### 📧 Needs Response
Real humans expecting a reply:
- Direct questions to you
- Requests for input or approval
- Active threads you're part of
- From VIPs (manager, clients, family)

### 📥 FYI
Useful but no response needed:
- Receipts and order confirmations
- Shipping and delivery notifications
- Calendar responses (accepted/declined)
- Automated reports and summaries
- Security alerts (note but don't act)

### 📦 Noise
Low-value items you probably don't need:
- Marketing emails and promotions
- Newsletters you haven't opened recently
- Automated notifications (GitHub, LinkedIn, social media)
- Mailing list digests

## 3. Present the Summary

```
📬 Email Summary — {Date} {Time}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ URGENT ({count})
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. **{Sender}** — {Subject}
   {What they need}
   Received: {time ago}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📧 NEEDS RESPONSE ({count})
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. **{Sender}** — {Subject}
   {Summary}: "{Key question}"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📥 FYI ({count})
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

• **Amazon** — Order shipped, arriving Thursday
• **Bank** — Monthly statement available

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📦 NOISE ({count})
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

{count} marketing · {count} newsletters · {count} notifications

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• {total} emails since last check
• {urgent} urgent · {needs_response} need reply · {fyi} FYI · {noise} noise
• Oldest unread: {time ago}
```

## 4. Offer Next Steps

After presenting the summary, ask if the user wants to:
- **Read** — Open a specific email for full details
- **Reply** — Draft a response to any "Needs Response" item
- **Run process-email** — Enable the process-email workflow for auto-cleanup

## This Workflow is Read-Only

- **NO archiving** — Nothing gets moved or archived
- **NO unsubscribing** — No mailing list changes
- **NO deleting** — Nothing gets removed
- **NO sending** — No replies sent without explicit request
- Just fetch, categorize, and display

## Notes

- Run 2-3x daily for a fresh view
- Morning catches overnight emails, afternoon catches midday
- If inbox is empty: "Inbox zero — nothing to report! 🎉"
- Pairs well with `process-email` for users who want automatic cleanup
