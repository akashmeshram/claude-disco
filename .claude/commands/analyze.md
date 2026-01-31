---
name: analyze
description: "Run codebase analysis. Usage: /analyze [type] [target]"
---

# Analyze Command

Run analysis on the codebase or specific files.

## Usage

```
/analyze                    # Quick architecture overview
/analyze full               # Comprehensive multi-agent analysis
/analyze [type]             # Specific analysis type
/analyze [type] [path]      # Analyze specific file/directory
```

## Analysis Types

| Type | Agent | Description |
|------|-------|-------------|
| `arch` | repo-architecture-scanner | Structure, tech stack |
| `deps` | dependency-analyzer | Imports, cycles |
| `perf` | performance-analyzer | Bottlenecks |
| `dead` | dead-code-analyzer | Unused code |
| `errors` | error-flow-analyzer | Error handling |
| `state` | state-flow-analyzer | State mutations |
| `domain` | domain-logic-mapper | Business logic |
| `api` | interface-contract-analyzer | API contracts |
| `security` | cross-cutting-concern-analyzer | Auth, validation |
| `full` | All + synthesizer | Complete audit |

## Examples

```
/analyze                    # Quick overview
/analyze deps               # Dependency analysis
/analyze perf src/api/      # Performance check on api folder
/analyze full               # Full codebase audit
```

## Instructions

1. Parse the arguments to determine analysis type and target
2. Launch appropriate agent(s) using Task tool
3. If `full`, run multiple agents in parallel, then synthesize
4. Present findings in structured format with file references
