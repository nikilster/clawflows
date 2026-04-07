---
name: track-savings-goals
emoji: "🎯"
description: Monthly savings progress tracker — shows how close you are to each savings target
schedule: "1st 9am"
author: @davehappyminion
---

# Track Your Savings Goals

Check in on your savings goals at the start of each month. See what progress you've made and what's left to go.

## Steps

1. **Review goals** — Ask the user about their current savings goals if this is the first time running. Common ones include emergency fund, vacation, big purchase, retirement contribution, or debt payoff.

2. **Check progress** — Use your **email skill** to look for bank statements, transfer confirmations, or savings account notifications from the past month.

3. **Calculate progress** — For each goal, figure out how much has been saved vs. the target amount. Show percentage complete and estimated completion date at current pace.

4. **Celebrate wins** — Call out any milestones hit (25%, 50%, 75%) or goals completed.

5. **Suggest next steps** — If any goal is falling behind pace, offer a gentle suggestion for getting back on track.

## Output Format

```
Savings Check-In — [month]

Goal              | Saved    | Target   | Progress
Emergency Fund    | $3,200   | $5,000   | ████████░░ 64%
Vacation          | $800     | $2,000   | ████░░░░░░ 40%
New Laptop        | $450     | $600     | ███████░░░ 75%

Nice — your laptop fund is almost there! At this pace
you'll hit it by mid-next-month.

Emergency fund is on track for August completion.
```

## Notes

- Never ask for bank account credentials or login information.
- The user's savings goals are personal — remember them between runs if possible.
- Keep the tone encouraging. Saving is hard and any progress is worth celebrating.
- If no data is available from emails, ask the user to share their current balances.
