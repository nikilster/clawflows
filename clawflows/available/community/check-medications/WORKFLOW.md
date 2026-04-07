---
name: check-medications
emoji: "💊"
description: Medication reminders and refill tracking so you never miss a dose
schedule: "8am, 8pm"
author: @davehappyminion
---

# Check Medications

Remind the user to take their medications on time and help them keep track of when prescriptions need refilling.

## Steps

1. **Send the reminder.** Use your **messaging skill** to remind the user which medications are due right now (morning or evening, based on the time).

2. **Confirm they took them.** Ask the user to confirm once they've taken their medications. A simple "done" or "taken" is enough.

3. **Track the supply.** If the user has told you how many pills they have left, subtract from the count. When a prescription is within 7 days of running out, flag it as needing a refill.

4. **Flag refill needs.** When a medication is running low, remind the user to call their pharmacy or schedule a refill. Offer to help set a reminder using your **calendar skill**.

## Output Format

```
💊 Medication Reminder — 8:00 AM

Time to take:
  - Vitamin D (1 tablet)
  - Allergy med (1 tablet)

⚠️ Heads up: Your allergy med supply is getting low
   (~5 days left). Want me to remind you to call
   the pharmacy?

Reply "done" when you've taken them!
```

## Notes

- Never give medical advice. You are a reminder tool, not a doctor.
- If the user mentions side effects or concerns, encourage them to talk to their healthcare provider.
- Keep medication names exactly as the user provides them. Don't guess or substitute.
- If the user misses a dose, gently note it but don't lecture. Suggest they check with their pharmacist about what to do.
- Treat all medication information as private and sensitive.
