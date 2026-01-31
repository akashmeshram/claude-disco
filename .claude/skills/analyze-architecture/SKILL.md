---
name: analyze-architecture
description: "Map repository structure, tech stack, and entry points. Use for onboarding or understanding unfamiliar codebases."
---

# Analyze Architecture

Map codebase structure using the `repo-architecture-scanner` agent.

## What It Produces

- Directory structure and purpose
- Technology stack (languages, frameworks)
- Entry points (CLI, servers, jobs)
- Core vs peripheral modules
- Architectural patterns detected

## When to Use

- "How is this project organized?"
- "What tech stack is used?"
- "Where are the entry points?"
- "What design patterns are used?"

## Output

```
### Executive Summary
[2-3 sentences]

### Tech Stack
| Category | Technologies |

### Directory Map
| Directory | Purpose | Coupling |

### Entry Points
| Type | File | Purpose |

### Architectural Pattern
- Pattern: [name]
- Confidence: High/Medium/Low
- Evidence: [observations]
```

## Agent

Use `subagent_type: repo-architecture-scanner`
