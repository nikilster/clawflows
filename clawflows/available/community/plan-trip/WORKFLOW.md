---
name: plan-trip
emoji: "✈️"
description: Research and plan a trip with flights, hotels, activities, and a day-by-day itinerary
author: @davehappyminion
---

# Plan a Trip

Taking a trip but don't know where to start? This workflow helps you go from "I want to visit Tokyo" to a full itinerary with flights, places to stay, things to do, and a day-by-day plan.

## Steps

1. Ask the user for the basics: destination, travel dates, number of travelers, budget range, and what kind of trip they want (relaxing, adventure, culture, food, mix of everything).
2. Use your **browser skill** to research flight options, comparing prices and times from major airlines and booking sites.
3. Research accommodation options that match the budget and preferences — hotels, Airbnbs, or hostels.
4. Find top-rated activities, restaurants, and local experiences at the destination. Factor in the season and any local events during the travel dates.
5. Build a day-by-day itinerary draft that balances activities with downtime.
6. Present the full plan and ask the user what they'd like to adjust.

## Output Format

```
✈️ Trip Plan: Lisbon, Portugal
   April 10-16 (6 nights) · 2 travelers · ~$3,000 budget

Flights:
- Outbound: Delta — JFK → LIS, Apr 10, 7pm ($420/person)
- Return: TAP — LIS → JFK, Apr 16, 11am ($385/person)

Stay:
- Hotel Pessoa (Chiado) — $140/night, 4.6 stars
- Alt: Airbnb in Alfama — $95/night, rooftop terrace

Day 1 (Apr 10): Arrive, check in, evening walk along the Tagus
Day 2 (Apr 11): Belém Tower, pastéis de nata, Jerónimos Monastery
Day 3 (Apr 12): Day trip to Sintra
...
```

## Notes

- Present multiple options at different price points when possible.
- Always confirm the user's home airport and any airline preferences.
- Include practical tips: visa requirements, currency, tipping customs, transit from airport.
- This is a research and planning tool — actual booking is up to the user unless they ask for help.
