---
name: check-network
emoji: "🌐"
description: Home network scan — discovers connected devices, checks internet speed, verifies DNS and VPN status, and flags unknown or new devices.
author: @davehappyminion
schedule: "8am"
---

# Check Network

Scan the home network for connected devices, test internet speed, verify DNS and VPN status, and flag unknown devices.

## 1. Identify Local Network

Determine the active network interface, local IP, subnet, and gateway. Note whether connected via Wi-Fi or Ethernet, and the SSID if on Wi-Fi.

## 2. Discover Connected Devices

Scan the local subnet for active hosts. For each device found, record:
- IP address, MAC address, hostname (if resolvable)
- Manufacturer (from MAC prefix if possible)

## 3. Flag Unknown Devices

Compare discovered devices against any known device list the user has documented. Classify each as Known, New (not seen before), or Unknown. Highlight unknown devices prominently.

## 4. Test Connectivity and Speed

- Ping a few external targets (e.g., 1.1.1.1, google.com) and report latency and packet loss
- Run a speed test using `networkQuality` (built into macOS 12+) or `speedtest-cli` if available
- Report download speed, upload speed, and latency
- If previous results exist, flag significant degradation

## 5. Check DNS and VPN

- Test DNS resolution and report configured DNS servers
- Detect whether a VPN is active and report which one
- Ping the gateway and report latency

## 6. Present Findings

Summarize in a clean report:
- Connection info (interface, IP, gateway, SSID, DNS, VPN status)
- Speed results
- Device list with known/new/unknown status
- Alerts for any issues (new devices, DNS problems, VPN down, high latency)

Example: "12 devices on network (10 known, 2 new). Internet: 250/25 Mbps. DNS: healthy. VPN: not connected."

## Notes

- This workflow is read-only. It does not modify network settings or firewall rules.
- `nmap` gives the best device scan but may not be installed; fall back to `arp -a`.
- On macOS, `networkQuality` is built in and works without third-party tools.
- If more than 30 devices are found, note the network may be shared.
