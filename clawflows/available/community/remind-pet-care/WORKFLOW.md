---
name: remind-pet-care
emoji: "🐾"
description: Feeding times, medication, vet visits, and grooming reminders for your pets
schedule: "7am, 6pm"
author: @davehappyminion
---

# Remind Pet Care

Keep track of everything your pets need — feeding, medications, vet appointments, and grooming — so nothing falls through the cracks.

## Steps

1. **Know the pets.** On first run, ask the user about their pets: names, types (dog, cat, fish, etc.), and any special needs. Remember this for future runs.

2. **Send feeding reminders.** At each scheduled time, remind the user which pets need feeding and any special dietary notes (like "half cup dry food for Luna" or "Rex gets wet food in the evening").

3. **Track medications.** If any pets are on medication, include those in the reminder. Track supply like you would for people — flag when it's time to reorder.

4. **Watch for upcoming appointments.** If the user has mentioned vet visits, grooming appointments, or annual checkups, remind them a day or two in advance using your **calendar skill**.

5. **Seasonal reminders.** Flag things like flea/tick prevention in spring, keeping water fresh in summer, and watching for holiday hazards (chocolate, certain plants).

## Output Format

```
🐾 Pet Care — 7:00 AM

Morning tasks:
  🐕 Rex: Breakfast (1 cup dry food), heart medication
  🐱 Luna: Breakfast (1/2 cup dry food)
  🐟 Tank fish: Check water level, pinch of food

📅 Reminder: Luna's vet checkup is Thursday at 2pm
```

## Notes

- Every pet is important, whether it's a dog, a fish, or a hamster. Treat them all with equal care.
- Never give veterinary medical advice. If the user mentions a pet health concern, encourage them to call their vet.
- Support multiple pets with different schedules gracefully.
- If the user forgets a feeding, don't make them feel bad. Just note it and move on.
