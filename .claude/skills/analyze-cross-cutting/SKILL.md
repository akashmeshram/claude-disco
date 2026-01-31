---
name: analyze-cross-cutting
description: "Identify cross-cutting concerns: auth, logging, validation, resilience. Use for security audits or consistency checks."
---

# Analyze Cross-Cutting Concerns

Find cross-cutting patterns using the `cross-cutting-concern-analyzer` agent.

## What It Finds

- **Security**: Auth checks, input sanitization
- **Operational**: Logging, metrics, health checks
- **Resilience**: Retry, timeout, circuit breakers
- **Data**: Validation, caching, transactions

## When to Use

- "Audit authorization"
- "Check logging coverage"
- "Find validation gaps"
- "Review resilience patterns"

## Output

```
### Authorization
| Operation | Auth Check | Location | Gap |

### Logging Coverage
| Module | Level | Coverage | Gaps |

### Validation Matrix
| Entry Point | Input | Output |

### Resilience Patterns
| Operation | Retry | Timeout | Breaker |

### Consistency Issues
| Concern | Pattern A | Pattern B |

### Recommendations
| Priority | Concern | Issue | Fix |
```

## Agent

Use `subagent_type: cross-cutting-concern-analyzer`
