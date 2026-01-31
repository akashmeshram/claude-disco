---
name: explain
description: "Explain how code works. Usage: /explain [function|file|feature]"
---

# Explain Command

Explain how specific code works with evidence-based analysis.

## Usage

```
/explain function_name      # Explain a function
/explain path/to/file.py    # Explain a file's purpose
/explain "authentication"   # Explain a feature/concept
```

## What It Produces

- Purpose and responsibility
- How it works (step by step)
- Dependencies and relationships
- Side effects
- Edge cases and limitations

## Output Format

```
### Overview
[2-3 sentence summary]

### Purpose
What this code does and why it exists.

### How It Works
1. [Step with file:line reference]
2. [Step with file:line reference]
...

### Dependencies
| Dependency | Purpose | Location |

### Side Effects
| Effect | When | Location |

### Edge Cases
| Case | Handling | Location |

### Key Insights
- [Important observation]
```

## Instructions

1. Use `codebase-analyzer` agent
2. Read the actual code—don't guess from names
3. Trace the logic step by step
4. Document all side effects
5. Note any surprising or non-obvious behavior
6. Cite file:line for every claim
