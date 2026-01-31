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

## Cognitive Debiasing

### Performance Analysis Biases

| Bias | Trap | How /check-perf Counters |
|------|------|--------------------------|
| **Premature optimization** | "This might be slow" | Only flags actual hotspots |
| **Availability** | Focus on known patterns | Systematic algorithmic analysis |
| **Overconfidence** | "This is definitely the bottleneck" | Quantifies impact, uses confidence levels |
| **Complexity worship** | Optimizing before understanding | Maps hot paths first |

### When NOT to Optimize

This command deliberately ignores:
- Startup-only code (runs once)
- Rarely-executed paths (low impact)
- Already-fast operations (diminishing returns)
- Micro-optimizations (complexity cost > benefit)

## Human Factors

### Why Performance Matters

Performance problems are invisible until they're critical:
- Users experience slowness but don't complain (they leave)
- Gradual degradation normalizes slowness
- Scale reveals problems too late

Static analysis catches issues before scale.

### Performance Communication

| Audience | What They Need |
|----------|---------------|
| **Executives** | "This will fail at 10K users" |
| **Tech leads** | Hotspot locations and severity |
| **Engineers** | Exact patterns and fix options |

## Decision Science

### Performance Priority Formula

```
Priority = (Impact × Frequency × Growth) / Fix Effort

Where:
- Impact: How slow (1-5)
- Frequency: How often executed (1-5)
- Growth: How fast is N growing (1-5)
- Fix Effort: How hard to fix (1-5)
```

High priority = optimize now.
Low priority = monitor, maybe optimize later.
