---
name: check-security
emoji: "🔒"
description: Security hygiene check — verifies system updates, scans open ports, checks encryption and firewall status.
author: @davehappyminion
---

# Check Security

Security hygiene — updates, encryption, firewall, and open ports.

## 1. System Updates

Check for pending system updates:
- Operating system updates
- Security patches
- Application updates

Using your **package manager skill** (if available):
- Check for outdated packages
- Flag packages with known vulnerabilities

## 2. Disk Encryption

Verify full-disk encryption is enabled:
- FileVault (macOS)
- BitLocker (Windows)
- LUKS (Linux)

Flag if encryption is disabled — this is critical for laptops.

## 3. Firewall Status

Check firewall configuration:
- Is the firewall enabled?
- Stealth mode (don't respond to probes)?
- What apps have exceptions?

## 4. Open Ports

Scan for open listening ports:
- What services are listening?
- Are any unexpected?
- Which are accessible externally?

Flag any suspicious or unnecessary open ports.

## 5. SSH Configuration

If SSH is used, verify:
- Key-based authentication preferred
- No overly permissive key file permissions
- No passwords in configs

## 6. Browser Security

Using your **browser skill** (if available):
- Check for suspicious extensions
- Verify important security extensions are active
- Check for outdated browser

## 7. Present Findings

```
🔒 Security Audit

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 OVERALL STATUS: Good ✅
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔄 SYSTEM UPDATES
• OS: Up to date ✅
• Apps: 3 updates available ⚠️

🔐 ENCRYPTION
• Full-disk encryption: Enabled ✅

🛡️ FIREWALL
• Status: Enabled ✅
• Stealth mode: Enabled ✅

🌐 OPEN PORTS
• 22 (SSH) — Expected
• 3000 (Node dev server) — Expected
• 5432 (PostgreSQL) — Review if needed

🔑 SSH
• Key permissions: Correct ✅
• Config: Clean ✅

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ RECOMMENDATIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• Install 3 pending app updates
• Consider closing port 5432 if not needed
```

## Notes

- Don't change any settings automatically — report and recommend
- Some open ports are normal (development servers) — note which are expected
- Flag critical issues prominently (encryption off, firewall off)
- Run monthly or after installing new software
