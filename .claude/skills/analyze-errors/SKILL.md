---
name: analyze-errors
description: "Trace error handling paths and find gaps. Use when debugging silent failures or auditing reliability."
---

# Analyze Errors

Trace error flows using the `error-flow-analyzer` agent.

## What It Finds

- Error propagation paths
- Silent failures (swallowed exceptions)
- Missing handlers
- Inconsistent patterns
- Lost context

## When to Use

- "Why did this fail silently?"
- "Are all exceptions caught?"
- "Audit error handling"
- "How do errors reach the user?"

## Output

```
### Error Flow Map
entry_point()
├── [try] operation()
│   ├── [catch] SpecificError → retry
│   └── [catch] Exception → re-raise
└── [uncaught] → propagates

### Silent Failures
| Location | Exception | Action | Risk |

### Missing Handlers
| Location | Potential Error | Impact |

### Recommendations
| Priority | Location | Issue | Fix |
```

## Agent

Use `subagent_type: error-flow-analyzer`
