---
name: log-dreams
emoji: "🌙"
description: Morning dream journal — prompts you to describe last night's dream, saves entries over time, and tracks recurring themes and symbols.
author: @davehappyminion
schedule: "7am"
---

# Log Dreams

Capture your dreams before they fade. A quick morning prompt, saved over time, with pattern tracking that reveals what your subconscious keeps coming back to.

## 1. Prompt for the Dream

Ask the user to describe their dream. Keep it conversational:

- "What do you remember from last night's dream?"
- If they remember multiple dreams, capture each one separately.
- If they don't remember anything, log a "no recall" entry. No guilt.

Ask 1-2 gentle follow-ups: "How did it make you feel?" or "Was there anyone you recognized?"

## 2. Save the Entry

Store entries at `~/.openclaw/data/dreams/{date}.md`:

```markdown
# Dream Log — March 20, 2026 (Thursday)

## Dream 1
I was in my old school but the hallways kept changing directions.
Trying to find my locker but the numbers didn't make sense.

**Feeling:** Confused, slightly anxious
**People:** Nobody I recognized
**Symbols:** Hallways, locked doors, changing numbers

---
*Logged at 7:05 AM*
```

## 3. Track Themes

After saving, scan the last 30 entries for recurring patterns — settings, people, symbols, emotional tone. Only mention patterns with 3+ occurrences.

## 4. Deliver

```
🌙 Dream logged for Thursday, Mar 20.

🔁 "School" setting has appeared 5 times this month.
📊 This month: 14/20 nights recalled
   Top themes: school, water, travel
```

Send via your **messaging skill**.

## Notes

- Dreams are personal. Never judge, interpret symbolically, or play therapist.
- Keep the prompt quick — 2-3 minutes max. Dreams fade fast.
- If the user shares a nightmare, acknowledge it gently. Don't minimize or dramatize.
- Never share dream content in other workflows unless specifically asked.
- "No recall" days are normal and worth logging — recall frequency is itself a pattern.
