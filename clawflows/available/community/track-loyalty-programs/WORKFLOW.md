---
name: track-loyalty-programs
emoji: "✨"
description: Monthly check on your loyalty points, miles, and rewards balances
schedule: "1st 9am"
author: @davehappyminion
---

# Track Loyalty Programs

Points expire, miles go unused, and free rewards sit unclaimed. This workflow gives you a monthly snapshot of all your loyalty and rewards programs so nothing goes to waste.

## Steps

1. Ask the user which loyalty programs they're enrolled in (airlines, hotels, credit cards, coffee shops, retail stores, etc.). Remember these for future runs.
2. Use your **browser skill** and **email skill** to check current balances and recent activity for each program.
3. Flag any points or miles that are expiring soon.
4. Check for easy redemption opportunities — flights, hotel nights, free items, or statement credits.
5. Present a clean summary sorted by urgency (expiring first, then by value).

## Output Format

```
✨ Loyalty & Rewards Summary — March 2026

⚠️ Expiring Soon:
- Hilton Honors: 42,000 points expire April 15
  Enough for: 1 free night at most US properties

💰 Your Balances:
- Delta SkyMiles: 68,400 miles (no expiration)
- Chase Ultimate Rewards: 35,200 points (~$528 travel value)
- Starbucks: 312 stars (6 free drinks)
- Target Circle: $4.50 in savings

💡 Suggestions:
- Book a Hilton stay before April 15 or transfer points to avoid losing them
- Your Delta miles are close to a round-trip domestic flight (~75k)
```

## Notes

- On the first run, help the user build their list of programs. Save it for future runs.
- Never log into accounts without the user's permission and credentials.
- If you can't check a balance automatically, remind the user to check it manually.
- Focus on programs with real value — skip anything with less than $1 worth of rewards.
