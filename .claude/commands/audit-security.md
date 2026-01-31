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

## Cognitive Debiasing

### Security Audit Biases to Counter

| Bias | Trap | How This Command Counters |
|------|------|---------------------------|
| **Optimism** | "Attackers won't find this" | Assume they will |
| **Availability** | Check for recent headline attacks | OWASP checklist covers the basics |
| **Familiarity** | Check vulns you know about | Systematic sweep catches unknown |
| **Confirmation** | Looking for problems you expect | Check every entry point, not just suspicious ones |

### Defense in Depth Mental Model

```
External request
    ↓
[Input validation] ← Check here
    ↓
[Authentication]   ← Check here
    ↓
[Authorization]    ← Check here
    ↓
[Business logic]   ← Check here
    ↓
[Data access]      ← Check here
```

Every layer should validate. Don't trust prior layers.

## Human Factors

### Why Security Gets Skipped

- **Time pressure**: "We'll add auth later"
- **Complexity**: Security is hard to get right
- **Invisible**: No one sees security working
- **Optimism**: "Who would attack us?"

### Making Security Visible

This audit produces evidence:
- How many entry points lack auth?
- How many inputs lack validation?
- What's the exploitability score?

Numbers create urgency.

## Decision Science

### Prioritizing Findings

| Factor | Weight | Question |
|--------|--------|----------|
| Exploitability | 40% | How easy to exploit? |
| Impact | 30% | What can attacker gain? |
| Exposure | 20% | Is it public-facing? |
| Fix effort | 10% | How hard to fix? |

High exploitability + high impact = fix immediately.
