---
name: find-dead
description: "Find unused code in the codebase. Usage: /find-dead [path]"
---

# Find Dead Code Command

Identify unused code, deprecated paths, and documentation drift.

## Usage

```
/find-dead                  # Scan entire codebase
/find-dead src/             # Scan specific directory
/find-dead src/utils.py     # Check if file/functions are used
```

## What It Finds

- Unused functions/methods
- Unused classes
- Unused imports
- Orphaned files
- Dead branches
- Stale comments/docs

## Output Format

```
### Dead Code Summary
- Unused functions: X
- Orphaned files: Y
- Safe to remove: Z items

### Unused Functions
| Location | Function | Confidence | Notes |

### Orphaned Files
| File | Reason | Safe to Delete |

### Documentation Drift
| Doc Location | Says | Reality |

### Safe Deletion List
[Files/functions with HIGH confidence]
```

## Instructions

1. Use `dead-code-analyzer` agent
2. If path specified, focus on that area
3. Check for dynamic usage patterns before flagging
4. Assign confidence levels
5. Separate "safe to delete" from "needs verification"
