---
name: update-timezone
emoji: 🌍
description: Check the user's location daily and update the system timezone to match.
author: davehappyminion @davehappyminion
schedule: "6am"
---

# Update Timezone

Check where the user is via Find My Friends and update the Mac system timezone if it's changed.

## 1. Get Location from Find My

Open the Find My app and check the user's current location:
- Use Peekaboo to read the Find My UI
- Look for the user's location (city/region)

## 2. Map Location to Timezone

Determine the correct IANA timezone for the location:
- New York / East Coast → `America/New_York`
- San Francisco / West Coast → `America/Los_Angeles`
- Chicago / Central → `America/Chicago`
- Denver / Mountain → `America/Denver`
- London → `Europe/London`
- For other locations, look up the correct IANA timezone

## 3. Check Current System Timezone

```bash
ls -la /etc/localtime
```
This shows the current system timezone symlink.

## 4. Update If Changed

If the detected timezone differs from the current system timezone:
1. Get the sudo password from 1Password:
   ```bash
   source ~/.openclaw/integrations/1password/1password.sh
   SUDO_PASS=$(op item get "Dave Mac Mini Login!!!" --vault "Dave The Minion" --fields password --reveal)
   ```
2. Disable auto-timezone and set the new one:
   ```bash
   echo "$SUDO_PASS" | sudo -S defaults write /Library/Preferences/com.apple.timezone.auto Active -bool false
   echo "$SUDO_PASS" | sudo -S systemsetup -settimezone <NEW_TIMEZONE>
   ```
3. Log the change to today's memory file
4. Notify the user: "Updated system timezone to [timezone] based on your location in [city]"

If the timezone hasn't changed, do nothing — no notification needed.

## 5. Update USER.md

If the timezone changed, also update the `Timezone` field in USER.md to keep it in sync.
