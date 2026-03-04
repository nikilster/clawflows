---
name: check-aws-security
emoji: 🔐
description: Security audit for AWS infrastructure — EC2, security groups, IAM, Secrets Manager, CloudTrail, and Tailscale network access.
author: kevhelperbot
schedule: manual
---

# Check AWS Security

Comprehensive security audit for AWS infrastructure and network access. Run weekly or after infrastructure changes.

---

## Overview

This workflow audits:

- EC2 instances and their status
- Security group rules (looking for overly permissive access)
- IAM users and permissions
- Secrets Manager hygiene
- CloudTrail for suspicious activity
- Tailscale network ACLs (if used)
- API Gateway endpoints

## Prerequisites

- AWS CLI configured with appropriate permissions
- A security inventory file tracking known-good IPs, users, and resources
- Tailscale CLI (optional, for network audit)

---

## Steps

### 1. Prepare Security Inventory

Before first run, create a security inventory file to track:

- Expected EC2 instances and their IPs
- Approved IP addresses for security group rules
- Known IAM users and their intended permissions
- Expected secrets in Secrets Manager

Example location: `~/security-inventory.md`

### 2. Check EC2 Instance Health

```bash
# List all running instances
aws ec2 describe-instances \
  --filters "Name=instance-state-name,Values=running" \
  --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0],PublicIpAddress,State.Name]' \
  --output table
```

Verify:
- ✅ All expected instances are running
- ✅ Public IPs match inventory
- ❌ No unexpected instances

### 3. Audit Security Groups

```bash
# List all security group rules with details
aws ec2 describe-security-groups \
  --query 'SecurityGroups[*].[GroupId,GroupName,IpPermissions[*].[IpProtocol,FromPort,ToPort,IpRanges[*].[CidrIp,Description]]]' \
  --output json
```

Check for:
- ❌ Any `0.0.0.0/0` ingress rules (except planned exceptions like HTTPS)
- ❌ Unknown IP addresses with access
- ❌ Overly permissive port ranges (e.g., 0-65535)
- ❌ Ports opened for testing that should be closed (3000, 5173, 8080)
- ✅ All IPs match your security inventory

### 4. Review IAM Users & Permissions

```bash
# List IAM users
aws iam list-users --query 'Users[*].[UserName,CreateDate]' --output table

# For each user, check attached policies
aws iam list-attached-user-policies --user-name USERNAME
aws iam list-user-policies --user-name USERNAME
```

Check for:
- ❌ Users with admin/full access (should be minimal)
- ❌ Unused users (no recent activity)
- ❌ Service accounts with excessive permissions
- ✅ Principle of least privilege followed

### 5. Check Secrets Manager

```bash
# List secrets and last access
aws secretsmanager list-secrets \
  --query 'SecretList[*].[Name,LastAccessedDate,LastRotatedDate]' \
  --output table
```

Check for:
- ❌ Secrets not accessed in 90+ days (may be orphaned)
- ❌ Secrets never rotated
- ❌ Missing secrets that should exist
- ✅ All expected secrets present and recently accessed

### 6. Review CloudTrail

```bash
# Check for AccessDenied events in last 7 days
aws cloudtrail lookup-events \
  --start-time $(date -v-7d +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date -d '7 days ago' +%Y-%m-%dT%H:%M:%SZ) \
  --max-results 50 \
  --output json | jq '.Events[] | select(.CloudTrailEvent | fromjson | .errorCode == "AccessDenied")'

# Check for console logins
aws cloudtrail lookup-events \
  --lookup-attributes AttributeKey=EventName,AttributeValue=ConsoleLogin \
  --start-time $(date -v-7d +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date -d '7 days ago' +%Y-%m-%dT%H:%M:%SZ) \
  --query 'Events[*].[EventTime,Username,EventName]' \
  --output table
```

Check for:
- ❌ Unexpected console logins
- ❌ Repeated AccessDenied errors (potential attack)
- ❌ API calls from unknown IPs
- ✅ All activity matches expected patterns

### 7. Tailscale Security Audit (if applicable)

If using Tailscale for network access:

#### 7a. Check Connected Devices

```bash
tailscale status
```

#### 7b. Check Tailscale on Remote Servers

```bash
# SSH to each server and check Tailscale status
ssh user@your-server "tailscale status"
```

#### 7c. Review Tailscale ACLs

Visit https://login.tailscale.com/admin/acls and verify:
- ✅ Principle of least privilege (not everyone can access everything)
- ❌ No wildcard `"*"` to `"*"` rules allowing all-to-all access
- ❌ No unexpected devices on the tailnet
- ❌ No expired or unused devices still authorized

### 8. Check API Gateway

```bash
# List APIs
aws apigateway get-rest-apis --query 'items[*].[name,id]' --output table
```

Verify all APIs match your inventory.

---

## Compile Report

Generate a security report with:

```
🔐 AWS Security Audit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 OVERALL STATUS: [✅ All Clear / ⚠️ Issues Found / ❌ Critical]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🖥️ EC2 INSTANCES
• X instances running ✅
• All IPs match inventory ✅

🛡️ SECURITY GROUPS
• X groups audited
• Issues: [list any]

👤 IAM USERS
• X users found
• Issues: [list any]

🔑 SECRETS MANAGER
• X secrets tracked
• Issues: [list any]

📜 CLOUDTRAIL
• No suspicious activity ✅

🌐 TAILSCALE
• X devices on tailnet
• ACLs configured correctly ✅

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ ACTION ITEMS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• [List specific fixes needed]
```

---

## After Running

1. Send the report to the user
2. If legitimate changes were found, update the security inventory
3. Create tickets/tasks for any required fixes
4. Schedule follow-up for critical issues

---

## Hardening Recommendations

Common fixes to suggest:

### AWS
- Remove `0.0.0.0/0` rules — restrict to specific IPs
- Enable MFA for all IAM users
- Rotate API keys older than 90 days
- Remove unused security group rules
- Add descriptions to all security group rules
- Enable VPC Flow Logs for network monitoring
- Review and tighten IAM policies to least privilege

### Tailscale
- Enable MFA on Tailscale account
- Review and tighten ACLs (avoid wildcard rules)
- Remove expired/unused devices
- Use tags to group devices by access level
- Enable session recording for SSH if available

---

## Notes

- Run weekly or after any infrastructure changes
- Compare each report to the previous one to catch drift
- Keep your security inventory up to date
- This workflow reports findings — it doesn't make changes automatically
