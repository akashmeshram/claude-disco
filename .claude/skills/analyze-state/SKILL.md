---
name: analyze-state
description: "Analyze state management and mutation patterns. Use when debugging state bugs or investigating race conditions."
---

# Analyze State

Map state flows using the `state-flow-analyzer` agent.

## What It Finds

- State locations (DB, cache, globals)
- Mutation points
- Transaction boundaries
- Race condition risks
- Cache invalidation gaps

## When to Use

- "Why is data inconsistent?"
- "Find race conditions"
- "Where is X modified?"
- "Audit cache usage"

## Output

```
### State Locations
| Type | Location | Scope | Mutators |

### Mutation Points
| State | Written By | Read By | Sync |

### Transaction Boundaries
| Operation | Has Transaction | Consistency |

### Race Condition Risks
| Location | Pattern | Impact | Fix |

### Recommendations
| Priority | Issue | Location | Fix |
```

## Agent

Use `subagent_type: state-flow-analyzer`
