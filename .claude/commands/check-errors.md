---
name: check-errors
description: "Audit error handling for gaps and silent failures. Usage: /check-errors [path]"
---

# Check Errors Command

Audit error handling paths for gaps and inconsistencies.

## Usage

```
/check-errors               # Scan entire codebase
/check-errors src/api/      # Check specific directory
/check-errors src/handler.py # Check specific file
```

## What It Finds

- Silent failures (swallowed exceptions)
- Missing error handlers
- Lost error context
- Inconsistent patterns
- Unhandled async errors

## Output Format

```
### Error Handling Summary
Silent failures: X | Missing handlers: Y | Inconsistent: Z

### Silent Failures (CRITICAL)
| Location | Exception | Action | Risk |

### Missing Handlers
| Location | Potential Error | Impact |

### Lost Context
| Location | Original | Becomes | Lost Info |

### Inconsistent Patterns
| Pattern A | Pattern B | Locations |

### Recommendations
| Priority | Location | Issue | Fix |
```

## Instructions

1. Use `error-flow-analyzer` agent
2. Trace error propagation from origin to handler
3. Flag silent swallows as CRITICAL
4. Note where error details are lost
5. Check async/promise error handling
