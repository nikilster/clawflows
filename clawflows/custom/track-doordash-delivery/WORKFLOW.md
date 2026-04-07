---
name: track-doordash-delivery
emoji: 🍔
description: Track an active DoorDash delivery and notify the user when food arrives. Disables itself once delivered.
author: davehappyminion @davehappyminion
schedule: "12am, 12:15am, 12:30am, 12:45am, 1am, 1:15am, 1:30am, 1:45am, 2am, 2:15am, 2:30am, 2:45am, 3am, 3:15am, 3:30am, 3:45am, 4am, 4:15am, 4:30am, 4:45am, 5am, 5:15am, 5:30am, 5:45am, 6am, 6:15am, 6:30am, 6:45am, 7am, 7:15am, 7:30am, 7:45am, 8am, 8:15am, 8:30am, 8:45am, 9am, 9:15am, 9:30am, 9:45am, 10am, 10:15am, 10:30am, 10:45am, 11am, 11:15am, 11:30am, 11:45am, 12pm, 12:15pm, 12:30pm, 12:45pm, 1pm, 1:15pm, 1:30pm, 1:45pm, 2pm, 2:15pm, 2:30pm, 2:45pm, 3pm, 3:15pm, 3:30pm, 3:45pm, 4pm, 4:15pm, 4:30pm, 4:45pm, 5pm, 5:15pm, 5:30pm, 5:45pm, 6pm, 6:15pm, 6:30pm, 6:45pm, 7pm, 7:15pm, 7:30pm, 7:45pm, 8pm, 8:15pm, 8:30pm, 8:45pm, 9pm, 9:15pm, 9:30pm, 9:45pm, 10pm, 10:15pm, 10:30pm, 10:45pm, 11pm, 11:15pm, 11:30pm, 11:45pm"
requires:
  - name: browser
    description: OpenClaw browser for checking DoorDash order status
---

# Track DoorDash Delivery

## What It Does
Checks DoorDash for an active delivery. When the food arrives, notifies the user and disables itself.

## 1. Check Order Status

Open DoorDash orders page in the openclaw browser:

```
browser open https://www.doordash.com/orders profile=openclaw
```

Take a snapshot of the page. Look for the most recent order and its delivery status.

## 2. Evaluate Status

- **"Delivered"** → Go to step 3
- **Still active** (Preparing, On the way, Arriving, etc.) → Message the user with a brief status update if the status changed significantly (e.g., "Your food just got picked up!"). Close the browser tab. Done.
- **No active order / All orders completed** → Go to step 3 (food already arrived or order was cancelled)

## 3. Notify and Disable

1. Message the user on Telegram: "Your DoorDash order just arrived! 🍽️" (include restaurant name and items if visible)
2. Close the browser tab
3. Disable this workflow:

```bash
clawflows disable track-doordash-delivery
clawflows sync-agent
```

## Notes
- This workflow is meant to be ENABLED when you place a DoorDash order, then it DISABLES ITSELF once delivered
- To activate: `clawflows enable track-doordash-delivery && clawflows sync-agent`
- Always close browser tabs when done
