---
name: security-audit
description: Defensive security review of a codebase or change set covering OWASP Top 10, secrets, dependencies, and configuration. Use when asked for a security review or before releasing.
license: MIT
---

# Security Audit (defensive)

## 1. Map the attack surface
- Entry points: HTTP routes, CLI args, file uploads, message queues, webhooks, env vars.
- Trust boundaries: where does untrusted input enter, and where does it reach a sink?

## 2. Check sinks for untrusted input
| Sink | Look for | Fix |
|---|---|---|
| SQL | string-built queries | parameterized queries / ORM |
| Shell | `os.system`, `subprocess(shell=True)`, backticks | argument lists, no shell |
| Filesystem | user-controlled paths | resolve and confine to a base dir |
| HTML | unescaped output, `innerHTML`, `|safe` | auto-escaping templates |
| HTTP fetch | user-controlled URLs | allowlist hosts (SSRF) |
| Deserialization | `pickle`, `yaml.load`, `eval` | safe loaders, schemas |

## 3. Authn / authz
- Every state-changing route checks auth **and** ownership of the object (IDOR).
- Passwords hashed with bcrypt/argon2; sessions expire; CSRF protection on cookies.

## 4. Secrets and config
- `git grep -nE "(api[_-]?key|secret|password|token)\s*[:=]"` and check history for leaked keys.
- `.env` must be in `.gitignore`. Any leaked key must be **rotated**, not just deleted.
- Debug mode off, CORS not `*` with credentials, security headers set.

## 5. Dependencies
Run `pip-audit`, `npm audit`, or `osv-scanner` and report vulnerable versions with fixed versions.

## Report
Each finding: severity (critical/high/medium/low), location, exploit scenario, fix. Only report issues with a plausible path from attacker input to impact.
