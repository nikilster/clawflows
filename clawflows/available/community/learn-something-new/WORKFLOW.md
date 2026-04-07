---
name: learn-something-new
emoji: "📚"
description: Daily micro-learning — picks a topic from your interests and delivers a 2-minute lesson with one key takeaway you can use today.
author: @davehappyminion
schedule: "8am"
---

# Learn Something New

A bite-sized daily lesson on something you're curious about. Builds knowledge over time without feeling like homework.

## 1. Load Interests

Check for saved interests at `~/.openclaw/data/learning/interests.json`. If missing, ask: "What are you curious about? Give me 3-5 topics." Save for next time and add to the list whenever they mention new interests.

## 2. Pick Today's Topic

Rotate topics so you don't repeat two days in a row. Check `~/.openclaw/data/learning/history/` to avoid repeating lessons. Pick a specific, focused subtopic — not "astronomy" but "why Saturn's rings are disappearing."

## 3. Deliver the Lesson

Keep it to a 2-minute read:

- **The hook** — one surprising fact or question
- **The explanation** — 3-4 short paragraphs covering the core idea
- **The takeaway** — one thing they can remember or share today

Use plain language. Make it feel like a smart friend telling them something cool.

## 4. Save and Present

Save to `~/.openclaw/data/learning/history/{date}.md`.

```
📚 Today's Lesson — Cooking

Why caramelizing onions takes so long
(and why recipes lie about it)

[2-minute lesson]

💡 Takeaway: Real caramelized onions need 30-45 minutes.
Low heat, occasional stirring, zero shortcuts.

📊 Streak: 12 days | Topics explored: 5 | Lessons: 47
```

Send via your **messaging skill**.

## Notes

- Keep lessons genuinely interesting, not textbook-dry. The goal is curiosity, not obligation.
- If the user replies with a follow-up question, answer it — don't turn it into a lecture.
- Track which topics get the most engagement and lean into those.
- Never repeat a lesson. There are infinite interesting things to learn.
- Two minutes means two minutes. Respect the user's morning.
