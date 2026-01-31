---
name: analyze-dependencies
description: "Map module dependencies, find cycles, and identify coupling hotspots. Use before refactoring or when changes cascade unexpectedly."
---

# Analyze Dependencies

Map dependencies using the `dependency-analyzer` agent.

## What It Finds

- Import graphs
- Circular dependencies
- God modules (high fan-in)
- Coupling hotspots
- Layering violations

## When to Use

- "Why does changing X break Y?"
- "Find circular imports"
- "What depends on this module?"
- "Which modules are most coupled?"

## Output

```
### Import Graph
module_a
├── module_b
└── module_c

### Cycles Found
| Cycle | Impact | Fix |

### High Fan-In
| Module | Dependents | Risk |

### Recommendations
1. [Priority action]
```

## Agent

Use `subagent_type: dependency-analyzer`
