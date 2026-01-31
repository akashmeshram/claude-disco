---
name: analyze-api
description: "Analyze public interfaces and API contracts. Use when reviewing API design or checking validation."
---

# Analyze API

Audit interfaces using the `interface-contract-analyzer` agent.

## What It Analyzes

- HTTP/REST APIs
- CLI interfaces
- Library exports
- Message contracts
- Config schemas

## When to Use

- "Review API design"
- "Check input validation"
- "Find breaking changes"
- "Document the API"

## Output

```
### Interface Inventory
| Type | Name | Location |

### Input Validation Audit
| Interface | Parameter | Validation | Gap |

### Output Consistency
| Interface | Success | Error | Consistent |

### Breaking Change Risks
| Interface | Current | Risk | Migration |

### Recommendations
| Priority | Interface | Issue | Fix |
```

## Agent

Use `subagent_type: interface-contract-analyzer`
