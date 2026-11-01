---
name: code-review-checklist
description: Structured review of a diff, branch, or pull request for correctness, security, performance, and maintainability. Use when asked to review code or before merging changes.
license: MIT
---

# Code Review

## 1. Understand the change
- Read the PR description or ask what it's for. Run `git diff <base>...HEAD --stat`, then the full diff.
- Read surrounding code for every changed function, not only the diff lines.

## 2. Check, in priority order
1. **Correctness:** logic errors, off-by-one, null/empty handling, wrong conditions, race conditions, unhandled errors, broken callers of changed signatures.
2. **Security:** injection (SQL, shell, path), missing auth checks, secrets in code, unsafe deserialization, SSRF, XSS.
3. **Data:** migrations reversible? Backward compatible? Data loss possible?
4. **Performance:** N+1 queries, unbounded loops or memory, work inside hot loops, missing pagination.
5. **Tests:** does a test fail without this change? Are edge cases covered?
6. **Maintainability:** naming, duplication, dead code, misleading comments.

## 3. Verify before reporting
For each candidate issue, construct a concrete failing scenario (inputs → wrong result). If you can't, downgrade it or drop it.

## 4. Report
For each finding:
```
[severity: critical|major|minor|nit] path/to/file.py:42
What is wrong, in one sentence.
Scenario: concrete input/state → wrong outcome.
Suggested fix.
```
Order by severity. Say explicitly what you checked and found fine. No praise padding.
