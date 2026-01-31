---
name: fix
description: "Auto-fix code issues. Usage: /fix [type] [path]"
---

# /fix

Automatically fix common code issues.

## Examples

```bash
/fix lint                   # Fix all lint errors
/fix lint src/              # Fix lint errors in src/
/fix types                  # Fix TypeScript errors
/fix imports                # Organize and fix imports
/fix format                 # Apply code formatting
```

## What Can Be Fixed

| Type | What It Does |
|------|--------------|
| `lint` | ESLint, Ruff, golint issues |
| `types` | TypeScript/type annotation errors |
| `imports` | Unused imports, organization |
| `format` | Prettier, Black, gofmt |
| `deps` | Package.json/requirements.txt issues |

## Safety

- **Preview first**: Shows what will change before changing
- **Atomic commits**: Each fix type is a separate commit (if requested)
- **Reversible**: All changes can be undone via git

## When It Won't Help

- Logic errors - those need understanding, not automation
- Architectural issues - use `/refactor` instead
- Test failures - use `/debug` to understand why
