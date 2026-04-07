---
name: send-birthday-reminders
emoji: "🎂"
description: Birthday and anniversary reminder system — scans contacts and calendar for upcoming celebrations, sends reminders 3 days early with gift ideas and message templates.
author: @davehappyminion
schedule: "8am"
---

# Send Birthday Reminders

Never miss a birthday or anniversary. Scans your contacts daily and sends reminders with enough lead time to actually do something.

## 1. Load the Birthday Database

Check for the birthday list at `~/.openclaw/data/birthdays/contacts.json`. Each entry has: `name`, `relationship` (parent/friend/partner/coworker), `date`, `type` (birthday/anniversary), `interests` (array), and `notes` (past gifts, preferences).

If the file doesn't exist, create it and ask the user to add a few key people.

## 2. Scan Calendar

Using your **calendar skill**, check the next 7 days for events containing "birthday," "bday," or "anniversary." Cross-reference with the database to avoid duplicates.

## 3. Check for Upcoming Dates

For each person, calculate days until their next date. Flag at three intervals:

- **3 days out** — primary reminder (time to order a gift or make plans)
- **1 day out** — final reminder (send a message, confirm plans)
- **Today** — day-of reminder (send your wishes!)

## 4. Generate Gift Suggestions

For 3-day reminders, provide 3-5 personalized ideas based on interests, relationship, and occasion. Include price ranges: budget ($15-30), moderate ($30-75), generous ($75+). Check notes to avoid repeating last year's gift.

## 5. Generate Message Templates

Provide 2-3 message options the user can customize:

- **Casual** — for friends and peers
- **Warm** — for close family and dear friends
- **Professional** — for coworkers and acquaintances

Keep messages genuine, not generic. Use what you know about the person.

## 6. Present the Reminder

### 3 Days Before:

```
🎂 Birthday Reminder

🎉 Your mom's birthday is Saturday, March 15. She's turning 61.

🎁 GIFT IDEAS
  1. 🌱 Seed-of-the-month subscription ($25/3mo) — she loves gardening
  2. 📚 Latest Tana French novel ($18) — mystery fan
  3. 🫖 Artisan tea sampler ($35) — she mentioned wanting to try oolong
  4. 💆 Spa gift card ($75+) — loved this last year
  5. 🌿 Potted herb garden kit ($30) — gardening + cooking

💬 MESSAGE IDEAS
  Warm: "Happy birthday, Mom! Hope your day is as wonderful as you are."
  Heartfelt: "61 years of making everyone feel loved. So grateful. ❤️"

📅 Saturday looks free — want me to block time for a call or dinner?
```

### Day Of:

```
🎂 It's your mom's birthday! She's 61.
  📱 Call or FaceTime  💌 Send your message  🎁 Confirm gift delivery
```

## 7. Deliver

Send reminders via your **messaging skill**. Only send if there's someone to remind about — no empty "no birthdays" messages.

## 8. Monthly Maintenance

Once a month, prompt: "Any new birthdays to add?" After a birthday passes: "How did it go? Want to note what you got them for next year?" Update the contacts file.

## Notes

- Birthday data stays local and is never shared or included in other workflows.
- Don't send reminders for the user's own birthday.
- For anniversaries, note the milestone year and traditional gift themes.
- If a birthday falls on a weekday for close family, suggest celebrating the nearest weekend.
- The 3-day lead time is key — most online orders need 2-3 days for delivery.
- Keep the tone celebratory, not naggy.
