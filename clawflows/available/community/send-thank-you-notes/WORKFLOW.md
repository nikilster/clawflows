---
name: send-thank-you-notes
emoji: "💌"
description: Helps you write and send thoughtful thank-you messages after events, gifts, or favors
author: @davehappyminion
---

# Send Thank-You Notes

A little gratitude goes a long way. This workflow helps you remember to say thanks after someone does something kind — whether it's a dinner party, a birthday gift, a job interview, or a favor.

## Steps

1. Use your **calendar skill** to scan the past 3-7 days for events that might warrant a thank-you (dinners, interviews, parties, meetings with favors noted).
2. Ask the user if there's anything else to add — gifts received, favors done, or kindnesses not captured in the calendar.
3. For each item, draft a short, warm thank-you message tailored to the situation and the person.
4. Present all drafts for review and ask which ones to send and through which channel (text, email, handwritten note reminder).
5. Send approved messages using your **messaging skill** or **email skill**.

## Output Format

```
💌 Thank-You Notes to Send

1. Dinner at Jake & Lina's (Saturday)
   To: Lina
   Via: Text
   Draft: "Thank you so much for having us over Saturday! The pasta was
   incredible. We need to get the recipe from you."

2. Job interview at Acme Co (Thursday)
   To: Rachel Torres (interviewer)
   Via: Email
   Draft: "Hi Rachel, thank you for taking the time to meet with me on
   Thursday. I really enjoyed learning about the team's work on..."
```

## Notes

- Always let the user review and edit messages before sending.
- Keep messages sincere and specific — mention something concrete about what you're thankful for.
- For formal situations (interviews, business), default to email. For personal ones, default to text.
- If you're unsure whether a thank-you is needed, suggest it and let the user decide.
