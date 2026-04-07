---
name: check-dependencies
emoji: "📦"
description: Weekly supply chain hygiene — scans projects for outdated dependencies, known CVEs, and available updates across npm, pip, cargo, and brew.
author: @davehappyminion
schedule: "monday 8am"
---

# Check Dependencies

Scan local projects for outdated packages, known vulnerabilities, and available updates.

## 1. Discover Projects

Search the user's workspace and common project directories (`~/Projects`, `~/src`, `~/.openclaw/workspace`) for dependency manifests: `package.json`, `requirements.txt`, `Pipfile`, `pyproject.toml`, `Cargo.toml`, `go.mod`.

Group by project root. Skip `node_modules`, `.venv`, `target`, and build artifact directories.

## 2. Check for Outdated Packages

For each project, check for outdated dependencies using the appropriate package manager. Record: package name, current version, latest version, and whether the update is major, minor, or patch.

Also check Homebrew globally for outdated formulae.

## 3. Scan for Vulnerabilities

Run security audit tools where available (npm audit, pip-audit, cargo audit, etc.). For each vulnerability found, record: package name, severity, CVE ID if available, and whether a fix version exists.

If the audit tool is not installed for a given ecosystem, skip and note it.

## 4. Classify Results

Group findings by priority:
- **Critical** — Known CVEs (high/critical severity), especially with available fixes
- **Stale** — Major version behind. Likely needs migration effort.
- **Updatable** — Minor or patch updates, no known vulnerabilities. Low risk.
- **Clean** — Fully up to date, no issues.

## 5. Present Report

Summarize:
- Vulnerabilities with severity, CVE, and fix version
- Major updates available
- Minor/patch updates available
- Clean projects
- Skipped projects (missing tools, no lockfile, etc.)

End with: "Scanned X projects. Y vulnerabilities (Z critical). W packages have updates."

## Notes

- This workflow is read-only. It does NOT install or update any packages.
- If dependencies are not installed (no `node_modules` or `.venv`), audit results may be incomplete. Note this.
- For monorepos with multiple manifests, check each workspace root individually.
- Homebrew is checked once globally, not per-project.
