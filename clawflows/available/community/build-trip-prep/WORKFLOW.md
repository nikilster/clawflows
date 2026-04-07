---
name: build-trip-prep
emoji: "✈️"
description: Comprehensive trip preparation packet
author: kevinmarch
---

# Build Trip Prep

When a trip appears on calendar, compile everything needed: weather expectations, flights, lounges, ground transport, visas, and meeting prep.

## When to Run

- **On-demand**: User says "prep me for my trip to [destination]"
- **Scheduled**: Could run weekly to check for upcoming trips in next 14 days

## 1. Identify the Trip

Find trip details from calendar or user input:
- **Destination city/country**
- **Travel dates** (departure and return)
- **Purpose** (business, personal, conference)
- **Flights** (if calendar has flight events or confirmation emails)
- **Hotel** (check calendar events or email confirmations for booking)

If dates or destination unclear, ask the user.

## 2. Check Entry Requirements

Research visa and entry requirements:
- **Visa needed?** Check if user's passport country requires visa
- **Visa type**: Tourist, business, transit
- **How to obtain**: Visa on arrival, e-visa, embassy appointment
- **Processing time**: How long it takes
- **Required documents**: Passport validity, photos, invitation letters

Also check:
- **COVID/health requirements**: Vaccination, testing (if still applicable)
- **Travel advisories**: Any warnings for the destination
- **Passport validity**: Many countries require 6+ months validity

Flag any urgent items (e.g., visa needs 2 weeks but trip is in 5 days).

## 3. Compile Flight Details

Extract from calendar events or email confirmations:
- **Outbound flight**: Airline, flight number, times, airports, confirmation code
- **Return flight**: Same details
- **Connections**: Layover times and airports
- **Seat assignments**: If known
- **Frequent flyer**: Status and number for potential upgrades

If flights not booked, note this as an action item.

## 4. Airport Lounge Options

Based on user's loyalty programs and cards (if known), list lounge options:

**Departure Airport ([Code])**
- [Lounge name] — [Access method: Priority Pass, Amex Centurion, airline status]
- Location: [Terminal/Gate]
- Hours: [Opening hours]

**Arrival Airport ([Code])**
- [Lounge options]

**Layover Airport(s) ([Code])**
- [Lounge options]

If user's lounge access isn't configured, note available paid lounges.

## 5. Ground Transportation

### Airport → Hotel

If a hotel is booked, research the best way to get there:

**Search for local travel tips**:
- Web search: "[city] airport to downtown best transport"
- Look for travel blogs, TripAdvisor, Reddit threads with local advice
- Check if the city has specific apps or services (e.g., Grab in SE Asia, Bolt in Europe)

**Compare options**:
| Option | Est. Cost | Est. Time | Notes |
|--------|-----------|-----------|-------|
| Taxi | $X | Xmin | [pros/cons, e.g., "metered vs flat rate"] |
| Rideshare (Uber/Lyft) | $X | Xmin | [availability, surge pricing risk] |
| Local app ([Name]) | $X | Xmin | [if applicable — often cheaper than Uber] |
| Public transit | $X | Xmin | [routes, complexity, luggage-friendliness] |
| Hotel shuttle | Free/$X | Xmin | [if available] |
| Private transfer | $X | Xmin | [pre-bookable, reliable] |

**Recommend the best option** based on:
- Cost vs. convenience trade-off
- Time of arrival (late night = taxi safer than transit)
- Luggage situation
- Local norms (some cities taxis are fine, others are scams)

### Getting Around During the Trip

- Is rideshare available? Which apps work? (Uber, Lyft, local alternatives)
- Public transit quality and tourist-friendliness
- Walking/biking feasibility for the area
- Any transport cards worth getting (e.g., Oyster in London, Suica in Tokyo)

## 6. Weather Expectations

Instead of a detailed forecast, describe what weather to expect based on the destination and time of year:

**[Destination] in [Month]**:
- **Typical conditions**: [e.g., "Hot and humid", "Mild and rainy", "Cold and dry"]
- **Temperature range**: [e.g., "Usually 70-85°F (21-29°C)"]
- **What to expect**: [e.g., "Afternoon thunderstorms common", "Pack layers for cool evenings"]
- **Pack for**: [e.g., "Light breathable clothing, umbrella", "Warm jacket, waterproof layer"]

This helps with packing without requiring precise forecasts that may change.

## 7. Meeting Prep (if business trip)

Check calendar for meetings during the trip:
- List all scheduled meetings with times (in local timezone)
- Note timezone difference from home
- For each external meeting, flag for detailed prep (see send-call-prep workflow)

## 8. Compile the Packet

Assemble everything into one document:

```markdown
# Trip Prep: [Destination]
📅 [Start Date] — [End Date] ([X] days)

## ⚠️ Action Items
- [ ] [Visa application — due by X]
- [ ] [Book hotel]
- [ ] [Any urgent items]

## ✈️ Flights
**Outbound**: [Date]
[Flight details]

**Return**: [Date]
[Flight details]

## 🛂 Entry Requirements
[Visa/entry info]

## 🌤️ Weather to Expect
[Destination] in [Month]: [Conditions summary]
Pack for: [Guidance]

## 🏨 Hotel
[Hotel name and address]

## 🚗 Getting There
**Airport → Hotel**: [Recommended option with details]
**Getting around**: [Transit tips]

## 🛋️ Lounge Access
[Lounge options by airport]

## 📅 Meetings
[List of meetings in local time]

## 📝 Notes
[Local currency, tipping customs, power adapters, etc.]
```

## 9. Deliver and Offer Actions

Send the packet to the user. Offer:
- "Want me to start visa application?"
- "Should I book ground transport?"
- "Need detailed prep for any of the meetings?"

## After Running

Confirm delivery and flag any urgent items:
- "✈️ Trip packet ready for [Destination]"
- "⚠️ Note: Visa required — application takes [X] days"
