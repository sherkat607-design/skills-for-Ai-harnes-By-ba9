---
name: documentation-writer
description: Write or update READMEs, guides, API docs, and docstrings that are accurate and task-oriented. Use when asked to document a project, module, or feature, including in Persian (fa) or English.
license: MIT
---

# Documentation Writer

## Principles
- **Accurate first:** verify every command, path, flag, and env var against the code. Run the commands.
- Write for a reader with a goal; lead with what they can do and how.
- Match the user's language. For Persian, keep code, commands, and identifiers in LTR code blocks.

## README skeleton
```markdown
# Project name
One sentence: what it does and for whom.
## Features
## Quick start   (install → configure → run, copy-pasteable)
## Configuration (table: variable | required | default | description)
## Usage examples
## Project structure
## Development   (tests, lint)
## License
```

## Docstrings / API docs
- Purpose, parameters (type, meaning, units), return value, raised errors, one example.
- Document *why* for non-obvious code; don't restate the code.

## Checklist
- [ ] Every command was run and works
- [ ] No secrets or real credentials in examples (use placeholders)
- [ ] Links resolve
- [ ] Removed docs for features that no longer exist
