---
name: python-best-practices
description: Conventions for writing and reviewing modern Python (3.10+) code, including typing, project layout, error handling, testing, and tooling. Use when writing, fixing, or reviewing Python code.
license: MIT
---

# Python Best Practices

## Tooling
- Dependencies in `pyproject.toml` (or a pinned `requirements.txt`); use a virtualenv (`uv` or `python -m venv`).
- Format and lint with `ruff format` and `ruff check`; type-check with `mypy` or `pyright`; test with `pytest`.

## Code
- Type hints on all public functions; `dataclass` or `pydantic` for structured data.
- `pathlib.Path` instead of string paths; f-strings; `logging` instead of `print` in libraries and services.
- Config from environment variables (validated once at startup); never hard-code secrets.
- Context managers (`with`) for files, DB sessions, locks.
- Catch specific exceptions; never bare `except:`; re-raise with context (`raise X from e`).
- Small, pure functions; side effects at the edges (I/O, network, DB).
- `if __name__ == "__main__":` guard for scripts.

## Performance and I/O
- Set timeouts on every network call (`requests.get(url, timeout=10)`).
- Batch DB writes; avoid N+1 queries; stream large files instead of reading them whole.

## Testing
- `pytest` with fixtures; `tmp_path` for files; `monkeypatch` or `responses` for env and HTTP.
- Tests must not hit real external APIs.

## Review checklist
- [ ] Types and docstrings on public API
- [ ] No mutable default arguments (`def f(x=[])`)
- [ ] Timeouts and error handling on I/O
- [ ] Secrets only from env
- [ ] `ruff`, type checker, and tests pass
