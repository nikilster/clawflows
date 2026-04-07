---
name: send-call-prep
emoji: "📋"
description: Pre-meeting briefing 30 minutes before external calls
author: kevinmarch
---

# Send Call Prep

30 minutes before external meetings, compile a 1-pager briefing with everything the user needs to walk in prepared.

## When to Run

- **Scheduled**: Check every 30 minutes during work hours for upcoming external meetings
- **On-demand**: User asks "prep me for my next call"

## 1. Find Upcoming External Meetings

Check the calendar for meetings starting in the next 30-45 minutes:
- Filter for meetings with external attendees (outside user's org)
- Skip internal standups, 1:1s with direct reports, etc.
- Skip meetings already prepped (check if prep was sent recently)

If no external meetings upcoming, exit quietly.

## 2. Identify the Attendees

For each external attendee:
- **Name and title**: From calendar invite or email signature
- **Company**: Domain from email, or meeting title
- **Role in the meeting**: Are they the decision-maker? Technical contact? Champion?

## 3. Research the Attendees

Use publicly available sources to gather context:

### Email History
Search for prior email threads with attendees (last 30-60 days):
- What topics have you discussed?
- Any pending questions or action items?
- Tone and relationship context

### LinkedIn
Look up each attendee on LinkedIn:
- Current role and tenure
- Career background (previous companies, roles)
- Shared connections
- Recent posts or activity (shows what they care about)
- Education and mutual affiliations

### Web Search
Search for the person and company:
- "[Name] [Company]" — Recent news, interviews, podcasts
- "[Company] news" — Funding, launches, leadership changes
- "[Company] [your industry]" — Relevant context

### Company Research
- Company website: What do they do? Recent announcements?
- Crunchbase/PitchBook: Funding history, investors, valuation
- Press releases: Recent news
- Social media: Company Twitter/LinkedIn for recent activity

## 4. Build the 1-Pager

Compile a concise prep doc:

```markdown
# Call Prep: [Meeting Title]
📅 [Date] at [Time] ([Duration])
👥 [Attendee names and companies]

## Meeting Context
- **Purpose**: [Why this meeting is happening — from invite or thread]
- **Your goal**: [What user wants to achieve]

## Attendee Background

**[Name]** — [Title] at [Company]
- [Current role, how long they've been there]
- [Previous: relevant past roles]
- [LinkedIn insight: recent posts, interests]
- [How you connected / who introduced you]

**[Name 2]** — [Title] at [Company]
- [Background...]

## Company Snapshot
- **What they do**: [One-liner]
- **Stage/Size**: [Funding stage, employee count if known]
- **Recent news**: [Anything notable in last 30 days]

## Prior Interactions
- [Date]: [Brief summary of last email exchange]
- [Date]: [Previous meeting notes if any]
- **Open items**: [Anything pending from last conversation]

## Key Points to Cover
1. [Topic to discuss]
2. [Question to ask]
3. [Update to share]

## Potential Landmines
- [Any sensitive topics, past issues, or things to avoid]

## Prep Actions
- [ ] [Any docs to have ready]
- [ ] [Any numbers to know]
```

## 5. Deliver the Briefing

Send the prep doc to the user via their preferred channel:
- Messaging (Telegram, Slack, etc.)
- Email
- Or display directly in the conversation

Time it for ~30 minutes before the meeting.

## 6. Offer Quick Actions

After sending, offer:
- "Want me to pull up any docs?"
- "Should I draft an agenda to send them?"
- "Need anything else before the call?"

## After Running

Confirm delivery:
- "📋 Prep sent for your [Time] call with [Company]"
- Note if anything was missing (no prior history, new contact, etc.)
