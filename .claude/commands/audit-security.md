---
name: audit-security
description: "Audit security patterns: auth, validation, secrets. Usage: /audit-security [path]"
---

# Audit Security Command

Audit authorization, input validation, and security patterns.

## Usage

```
/audit-security             # Audit entire codebase
/audit-security src/api/    # Audit specific directory
```

## What It Checks

- Authorization enforcement gaps
- Input validation coverage
- Secret handling
- SQL/command injection risks
- Authentication patterns

## Output Format

```
### Security Summary
Auth gaps: X | Validation gaps: Y | Critical: Z

### Authorization Gaps
| Operation | Expected Auth | Actual | Risk |

### Input Validation
| Entry Point | Parameter | Validation | Gap |

### Injection Risks
| Location | Type | Input Source | Risk |

### Secret Handling
| Location | Secret Type | Issue |

### Recommendations
| Priority | Location | Issue | Fix |
```

## Instructions

1. Use `cross-cutting-concern-analyzer` agent
2. Focus on security concerns
3. Check all entry points for auth
4. Verify all user inputs are validated
5. Flag any hardcoded secrets or credentials
6. Prioritize by exploitability
