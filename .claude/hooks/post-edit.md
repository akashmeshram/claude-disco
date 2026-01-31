---
name: post-edit
trigger: after_file_edit
description: "Actions to run after Claude edits a file"
---

# Post-Edit Hook

Runs after Claude edits any file.

## Actions

### 1. Format Code
Auto-format the edited file using project formatter:
- Python: `black`, `ruff format`
- JavaScript/TypeScript: `prettier`
- Go: `gofmt`
- Rust: `rustfmt`

### 2. Organize Imports
Sort and organize imports:
- Python: `isort`
- JavaScript/TypeScript: ESLint import plugin
- Go: `goimports`

### 3. Lint Check
Run linter on edited file:
- Python: `ruff`, `flake8`
- JavaScript: `eslint`
- Go: `golint`

### 4. Type Check (if enabled)
Run type checker on edited file:
- Python: `mypy`
- TypeScript: `tsc`

## Output

```
Post-edit: file.py
✓ Formatted with black
✓ Imports organized
✓ Lint passed
✓ Types passed
```

## Configuration

In `.claude/settings.json`:
```json
{
  "hooks": {
    "post-edit": {
      "format": true,
      "organize-imports": true,
      "lint": true,
      "type-check": false
    }
  }
}
```

## Disable for File

Add comment at top of file:
```python
# claude: no-post-edit
```
