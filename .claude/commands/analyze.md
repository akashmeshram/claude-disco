---
name: analyze
description: "Understand a codebase. Usage: /analyze [what] [where]"
---

# /analyze

Understand any codebase through focused analysis.

## Examples (start here)

```bash
/analyze                    # Quick architecture overview
/analyze deps               # Where are the dependencies tangled?
/analyze perf src/api/      # What's slow in the API?
/analyze full               # Complete health check
```

## What You Can Analyze

| What | Question It Answers |
|------|---------------------|
| `arch` | How is this organized? |
| `deps` | What depends on what? Any cycles? |
| `perf` | What will be slow at scale? |
| `dead` | What code is never used? |
| `errors` | Where do errors get swallowed? |
| `state` | Where does state mutate? |
| `security` | What's vulnerable? |
| `full` | All of the above |

## How It Works

1. Parses your request to pick the right analysis type
2. Launches specialized agent(s) via Task tool
3. Returns findings with file:line references

## Tips

- Start with `/analyze` (no args) for orientation
- Add a path to focus: `/analyze perf src/api/`
- Use `full` sparingly - it's thorough but slow

## Cognitive Debiasing in Analysis

Analysis is vulnerable to bias. This tool counters:

| Bias | How It Counters |
|------|-----------------|
| **Confirmation** | Systematic checks, not just what you expect |
| **Availability** | Checklist-driven, not memory-driven |
| **Anchoring** | Comprehensive scan before prioritizing |
| **Optimism** | Assumes problems exist until proven otherwise |

## Output Structure (Organizational Behavior)

Analysis results are structured for different audiences:

| Section | Audience | Time |
|---------|----------|------|
| Summary | Everyone | 30 sec |
| Key Findings | Tech leads | 5 min |
| Full Details | Engineers | 30 min |

## Decision Support

Each finding includes:
- **Evidence** - What indicates this is a problem
- **Impact** - What happens if not addressed
- **Priority** - Relative importance
- **Next step** - What to do about it

This enables decision-making, not just information gathering.
