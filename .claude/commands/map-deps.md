---
name: map-deps
description: "Map module dependencies and find cycles. Usage: /map-deps [path]"
---

# Map Dependencies Command

Analyze module dependencies, find cycles, and identify coupling issues.

## Usage

```
/map-deps                   # Map entire codebase
/map-deps src/              # Map specific directory
/map-deps src/utils.py      # Show what depends on this file
```

## What It Finds

- Import graph
- Circular dependencies
- God modules (high fan-in)
- Coupling hotspots
- Layering violations

## Output Format

```
### Dependency Overview
Modules: X | Cycles: Y | God Modules: Z

### Import Graph
module_a
├── module_b
│   └── module_c
└── module_d

### Cycles Found
| Cycle | Impact | Break Point |

### God Modules
| Module | Dependents | Risk |

### Coupling Hotspots
| Modules | Type | Concern |

### Recommendations
1. [Priority action]
```

## Instructions

1. Use `dependency-analyzer` agent
2. Build import graph from entry points
3. Detect cycles with suggested break points
4. Calculate fan-in/fan-out metrics
5. Suggest specific refactoring actions
