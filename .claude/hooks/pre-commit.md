---
name: pre-commit
trigger: before_commit
description: "Checks to run before committing code"
---

# Pre-Commit Hook

Runs before Claude creates a commit.

## Checks

### 1. No Secrets
Scan for accidentally committed secrets:
- API keys
- Passwords
- Private keys
- Tokens
- Connection strings

### 2. No Debug Code
Remove before committing:
- console.log (JS)
- print() debugging (Python)
- debugger statements
- TODO: remove comments

### 3. Tests Pass
Run relevant tests:
```bash
# Python
pytest --tb=short

# JavaScript
npm test -- --bail

# Go
go test ./...
```

### 4. Lint Clean
No new lint errors:
```bash
# Python
ruff check .

# JavaScript
eslint .

# Go
golint ./...
```

### 5. Format Check
Code is properly formatted:
```bash
# Python
black --check .

# JavaScript
prettier --check .
```

## Output

```
Pre-commit checks:
✓ No secrets detected
✓ No debug code found
✓ Tests passed (23/23)
✓ Lint clean
✓ Format OK

Ready to commit.
```

Or if issues:
```
Pre-commit checks:
✓ No secrets detected
✗ Debug code found:
  - src/api.py:45: print("DEBUG")
  - src/utils.js:23: console.log

Fix issues before committing? (y/n)
```

## Configuration

In `.claude/settings.json`:
```json
{
  "hooks": {
    "pre-commit": {
      "secrets": true,
      "debug-code": true,
      "tests": true,
      "lint": true,
      "format": false
    }
  }
}
```

## Skip Hook

For emergency commits:
```
/commit --no-verify "emergency fix"
```
