---
name: git-commit-and-pr
description: Create clean commits and well-described pull requests. Use when committing work, writing commit messages, splitting changes, or opening a PR.
license: MIT
---

# Git Commits and Pull Requests

## Before committing
1. `git status` and `git diff`: review every line you are about to commit.
2. Never commit secrets (`.env`, keys, tokens), build output, or large binaries. Check `.gitignore`.
3. Run the project's lint and test commands.

## Commits
- One logical change per commit. Use `git add -p` to split unrelated edits.
- Message format (Conventional Commits):
  ```
  type(scope): imperative summary under 72 chars

  Why the change was needed and what it does, wrapped at 72.
  Refs #123
  ```
  Types: feat, fix, docs, refactor, test, perf, build, ci, chore.
- Match the repo's existing style if it differs (`git log --oneline -20`).

## Branches
- Never work directly on `main`. Branch: `feat/short-topic`, `fix/issue-123`.
- Rebase on the latest base before opening a PR. Never force-push shared branches.

## Pull request description
Use the repo's PR template if one exists. Otherwise:
```markdown
## Summary
What and why, in 2-4 sentences.
## Changes
- bullet per notable change
## Testing
Commands run and results; screenshots for UI.
## Risks / follow-ups
```
Keep PRs small (under ~400 changed lines when possible).
