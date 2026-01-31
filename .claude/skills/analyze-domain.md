---
name: analyze-domain
description: "Map business logic, domain entities, and invariants. Use when onboarding or finding where business rules live."
---

# Analyze Domain

Map business logic using the `domain-logic-mapper` agent.

## What It Finds

- Domain entities
- Business rules
- Invariants
- Entity lifecycle
- Domain glossary

## When to Use

- "Where is X business logic?"
- "What are the domain entities?"
- "How is validation done?"
- "Map the domain model"

## Output

```
### Core Entities
| Entity | Location | Attributes | Relationships |

### Business Rules
| Rule | Location | Description |

### Invariants
| Invariant | Enforcement | Violation Handling |

### Domain Glossary
| Term | Meaning | Locations |

### Logic Distribution
| Layer | Contains | Should Contain |

### Recommendations
| Issue | Location | Suggestion |
```

## Agent

Use `subagent_type: domain-logic-mapper`
