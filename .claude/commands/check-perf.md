---
name: check-perf
description: "Check code for performance issues. Usage: /check-perf [path]"
---

# Check Performance Command

Identify performance bottlenecks through static analysis.

## Usage

```
/check-perf                 # Scan entire codebase
/check-perf src/api/        # Check specific directory
/check-perf src/handler.py  # Check specific file
```

## What It Finds

- O(n²) and worse algorithms
- N+1 query patterns
- Blocking I/O in async contexts
- Unbounded operations
- Memory issues
- Missing timeouts

## Output Format

```
### Performance Summary
Critical: X | High: Y | Medium: Z

### Critical Hotspots
| Location | Pattern | Complexity | Fix |

### N+1 Queries
| Location | Query in Loop | Impact |

### Blocking Operations
| Location | Operation | Context | Fix |

### Scale Assumptions
| Assumption | Breaks At | Risk |
```

## Instructions

1. Use `performance-analyzer` agent
2. Focus on hot paths (request handlers, loops, data processing)
3. Quantify impact where possible (e.g., "at 10K users = 100M ops")
4. Provide quick fix AND proper solution for each issue
5. Don't flag micro-optimizations or startup-only code
