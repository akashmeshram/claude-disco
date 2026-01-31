---
name: report
description: "Generate analysis report. Usage: /report [quick|full|security|refactor]"
---

# Report Command

Generate comprehensive analysis report.

## Usage

```
/report                     # Quick report (architecture + key issues)
/report quick               # Same as above
/report full                # Complete multi-agent analysis
/report security            # Security-focused report
/report refactor            # Refactoring preparation report
```

## Report Types

### Quick (default)
- Architecture overview
- Top 5 critical issues
- Immediate recommendations

### Full
Runs all agents:
- Architecture
- Dependencies
- Performance
- Dead code
- Error handling
- Synthesized findings

### Security
Focus on:
- Authorization gaps
- Input validation
- Secret handling
- Injection risks

### Refactor
Focus on:
- Dependency cycles
- Dead code
- Coupling hotspots
- Technical debt

## Output Format

```markdown
# Codebase Analysis Report
Generated: [date]

## Executive Summary
## Health Scorecard
| Aspect | Score | Finding |

## Critical Issues
## Risk Matrix
## Recommendations
## Detailed Findings
## Appendix
```

## Instructions

1. Determine report type from argument
2. Launch appropriate agents (parallel when possible)
3. Use `architecture-synthesizer` to combine
4. Use `report-critic` to review
5. Output as structured markdown
