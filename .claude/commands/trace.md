---
name: trace
description: "Trace code flow for a function or feature. Usage: /trace [function|path]"
---

# Trace Command

Trace execution flow through code with forensic precision.

## Usage

```
/trace function_name        # Trace a function
/trace path/to/file.py      # Trace from entry point
/trace "feature name"       # Trace a feature flow
```

## What It Produces

- Call graph from entry point
- Data flow with transformations
- State mutations
- External dependencies (DB, API, files)
- Error handling paths

## Output Format

```
### Entry Point
file.py:function_name

### Call Graph
function_a()
├── function_b()
│   └── function_c()
└── function_d()

### Data Flow
Input → validate() → transform() → persist() → Output

### State Mutations
| Location | What Changes | Trigger |

### External Calls
| Type | Location | Purpose |

### Uncertainties
- [UNCERTAIN: reason]
```

## Instructions

1. Use `codebase-analyzer` agent
2. Start at specified entry point
3. Trace forward through call chain
4. Document every transformation and side effect
5. Mark uncertainty explicitly
6. Cite file:line for all claims
