---
name: generate-report
description: "Generate comprehensive analysis report by running multiple agents. Use for full audits, onboarding docs, or architecture reviews."
---

# Generate Analysis Report

Orchestrate multiple agents and synthesize into unified report.

## Process

1. **Analyze** (parallel)
   - repo-architecture-scanner
   - dependency-analyzer
   - performance-analyzer
   - dead-code-analyzer
   - error-flow-analyzer

2. **Synthesize**
   - architecture-synthesizer

3. **Review**
   - report-critic

## Output Structure

```markdown
# Codebase Analysis Report

## Executive Summary
## Health Scorecard
| Aspect | Score | Finding |

## Architecture Overview
## Critical Findings
## Risk Matrix
## Prioritized Recommendations
## Appendix
```

## Customization

| Request | Agents |
|---------|--------|
| Quick audit | architecture + performance |
| Security focus | + cross-cutting-concern-analyzer |
| Refactor prep | dependencies + dead-code |
| Full review | All agents |

## Agents

- `architecture-synthesizer` - Combine reports
- `report-critic` - Quality review
