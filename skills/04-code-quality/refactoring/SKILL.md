---
name: refactoring
description: Safely restructure existing code without changing behavior, in small verified steps. Use when cleaning up, splitting large files or functions, removing duplication, or improving names.
license: MIT
---

# Safe Refactoring

## Preconditions
- Tests cover the code you'll touch. If not, first write **characterization tests** that pin current behavior (including odd behavior).
- Working tree is clean so every step can be diffed and reverted.

## Process
1. Pick one smell and one refactoring at a time.
2. Make the change. Run tests. Commit. Repeat.
3. Never mix refactoring and behavior changes in the same commit.

## Common moves
| Smell | Refactoring |
|---|---|
| Function > ~40 lines, several jobs | Extract function |
| Copy-pasted blocks | Extract shared helper (only after the 3rd copy) |
| Long parameter lists | Introduce parameter object / dataclass |
| Nested ifs | Guard clauses / early return |
| Magic numbers/strings | Named constants or enums |
| God file/class | Split by responsibility into modules |
| Unclear names | Rename (use IDE/LSP rename, then grep for strings and docs) |
| Dead code | Delete (git keeps history) |

## Don'ts
- Don't add abstraction for hypothetical future needs.
- Don't change public APIs without updating all callers and noting it.
- Don't reformat whole files in the same change; it buries the real diff.
