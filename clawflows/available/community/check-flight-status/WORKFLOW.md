---
name: check-flight-status
emoji: "🛫"
description: Monitor upcoming flights for delays and changes
schedule: "8am, 12pm, 4pm"
author: kevinmarch
---

# Check Flight Status

Track upcoming flights and alert on delays, gate changes, or cancellations. Proactively suggest rebooking when delays compound.

## When to Run

- **Scheduled**: 3x daily (morning, midday, afternoon) when flights are upcoming
- **On-demand**: User asks "check my flight" or "flight status"
- **Day-of travel**: Increase frequency to hourly

## 1. Find Upcoming Flights

Check for flights in the next 7 days:
- **Calendar events**: Look for events with airline names, flight numbers, or "flight" in title
- **Email confirmations**: Search recent emails for flight confirmations
- **Travel apps**: If integrated, pull from TripIt, airline apps, etc.

Extract for each flight:
- Airline and flight number (e.g., DL234, UA1234, AA100)
- Departure airport and time
- Arrival airport and time
- Confirmation/booking code
- Date

## 2. Check Flight Status

### Method 1: Google Search (Quick & Free)

Google displays flight status directly in search results. Search with natural language:

```
DL234 march 4 nyc to denver
UA1234 today
AA100 march 5
[airline] [flight number] [date]
```

Google will show:
- Departure/arrival times (scheduled vs actual)
- Delay status
- Terminal and gate (when available)
- Aircraft type

This works for most major airlines and is the fastest way to check.

### Method 2: Free Flight Tracking APIs

**FlightAware** (flightaware.com):
- Free tier available with registration
- API: `https://flightaware.com/live/flight/[FLIGHT_NUMBER]`
- Web scrape the page or use their AeroAPI (paid for high volume)

**FlightStats** (flightstats.com):
- Web interface free, API requires subscription
- Good for historical on-time performance

**ADS-B Exchange** (adsbexchange.com):
- Free, open-source flight tracking
- Real-time aircraft positions
- API available: `https://globe.adsbexchange.com/?icao=[ICAO_CODE]`

**Flightradar24** (flightradar24.com):
- Freemium model
- Web: `https://www.flightradar24.com/data/flights/[FLIGHT_NUMBER]`
- Good for real-time tracking once airborne

### Method 3: Airline Websites

Go directly to the airline's flight status page:
- Delta: `delta.com/flight-status`
- United: `united.com/en/us/flightstatus`
- American: `aa.com/travelInformation/flights/status`
- Southwest: `southwest.com/air/flight-status`

Most accept flight number + date and return real-time status.

### What to Look For

- **On time**: Departing as scheduled
- **Delayed**: New departure time, delay duration
- **Gate change**: New gate assignment
- **Cancelled**: Flight cancelled
- **Diverted**: Rerouted to different airport

Note the data source and timestamp when reporting.

## 3. Assess Impact

For any non-normal status, evaluate:

**Delays**:
- How long is the delay?
- Does it affect connections?
- Will the user miss meetings at destination?
- Is it likely to get worse? (weather, mechanical)

**Cancellations**:
- What rebooking options exist?
- Same airline alternatives
- Partner airline alternatives
- Refund eligibility

**Connections at risk**:
- Minimum connection time needed
- Current connection time with delay
- Backup flights if missed

## 4. Research Alternatives (if needed)

If delay >1 hour or cancellation:
- Search for alternative flights on same airline
- Check partner airlines
- Look at nearby airports
- Note: price differences, timing, class availability

Present top 2-3 options with trade-offs.

## 5. Alert the User

**If all flights on time**:
- On scheduled runs: No alert needed (or brief "All flights on time")
- On user request: Confirm status

**If changes detected**:
```
🛫 Flight Update: [Airline] [Flight #]
[Route]: [Origin] → [Destination]

⚠️ Status: [Delayed X hours / Gate changed / Cancelled]
New departure: [Time] (was [Original time])
New gate: [Gate] (was [Original])

Impact:
- [Connection risk, meeting conflict, etc.]

Options:
1. [Keep current booking — arrive at X]
2. [Rebook to Flight Y — arrive at Z, [cost diff]]
3. [Alternative airline — details]

Reply with option # or "more options"
```

## 6. Take Action (if requested)

If user chooses to rebook:
- Guide through rebooking process
- Note airline phone number and confirmation code
- Draft message to affected parties if meetings impacted
- Update calendar with new times

## 7. Monitor Continuously (Day of Travel)

On travel day:
- Check status every hour starting 6 hours before departure
- Alert immediately on any changes
- Track gate assignments as they're posted
- Monitor security wait times if available

## Configuration

Users can customize:
- **Alert threshold**: Only alert if delay >X minutes (default: 30)
- **Check frequency**: How often to poll (default: 3x daily, hourly on travel day)
- **Proactive rebooking**: Auto-search alternatives if delay >X hours

```env
# config.env (optional)
DELAY_ALERT_THRESHOLD_MINUTES=30
PROACTIVE_REBOOK_THRESHOLD_HOURS=2
```

## After Running

Summary of flight status:
- "✅ All [X] upcoming flights on time"
- Or: "⚠️ [Flight] delayed [X] hours — see options above"
