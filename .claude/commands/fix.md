---
name: fix
description: "Auto-fix issues in code. Usage: /fix [issue-type] [path]"
---

# Fix Command

Automatically fix issues identified by analysis.

## Usage

```
/fix                        # Fix all auto-fixable issues
/fix lint                   # Fix linting issues
/fix types                  # Fix type errors
/fix imports                # Fix/organize imports
/fix style                  # Fix code style
/fix [path]                 # Fix issues in specific file
```

## What It Fixes

| Type | Examples |
|------|----------|
| `lint` | Unused variables, missing semicolons |
| `types` | Type annotations, null checks |
| `imports` | Unused imports, sort order |
| `style` | Formatting, naming conventions |
| `security` | Simple security issues |

## Process

1. Run appropriate analysis agent
2. Identify auto-fixable issues
3. Apply fixes with minimal changes
4. Show diff of changes
5. Ask for confirmation before saving

## Output

```
### Issues Found
| Type | Count | Auto-fixable |
|------|-------|--------------|

### Proposed Fixes
[file.py]
- Line 5: Remove unused import 'os'
- Line 23: Add type annotation

### Diff Preview
[Show unified diff]

Apply fixes? (y/n)
```

## Safety

- Never fix logic issues automatically
- Always show diff before applying
- Keep original behavior intact
- Skip ambiguous fixes
