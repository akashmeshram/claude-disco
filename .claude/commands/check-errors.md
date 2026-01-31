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

## Cognitive Debiasing

### Error Analysis Biases

| Bias | Trap | How /check-errors Counters |
|------|------|---------------------------|
| **Happy path focus** | Only reviewing success paths | Explicitly traces error paths |
| **Optimism** | "That exception won't happen" | Assumes all exceptions happen |
| **Complexity avoidance** | Skipping tangled try/catch | Tangled = higher priority |
| **Confirmation** | Checking expected error patterns | Systematic scan of all paths |

## Human Factors

### Why Error Handling Gets Missed

- **Invisible work**: Good error handling isn't visible until things fail
- **Time pressure**: "Handle errors later" (later never comes)
- **Complexity**: Error handling often harder than happy path
- **Testing difficulty**: Errors are hard to reproduce in tests

### The 3 AM Test

For each error path, ask:
- Can the oncall engineer understand what failed?
- Is there enough context to debug?
- Is the error actionable?

## Decision Science

### Error Handling Priority

| Pattern | Severity | Why |
|---------|----------|-----|
| Silent catch | CRITICAL | Data corruption, mystery bugs |
| Lost context | HIGH | Hours of debugging wasted |
| Missing handler | MEDIUM | Uncaught exception crashes |
| Inconsistent returns | LOW | Confusion, not failure |

### When to Suppress Errors

Almost never, but exceptions exist:
- Truly optional operations (analytics, logging)
- Expected conditions (cache miss)
- Documented intentional ignoring

Even then, log that you're ignoring.
