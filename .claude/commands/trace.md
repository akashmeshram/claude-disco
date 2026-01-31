---
name: trace
description: "Trace code flow for a function or feature. Usage: /trace [function|path]"
---

# Trace Command

Trace execution flow through code with forensic precision.

## Usage

```
/trace function_name        # Trace a function
/trace path/to/file.py      # Trace from entry point
/trace "feature name"       # Trace a feature flow
```

## What It Produces

- Call graph from entry point
- Data flow with transformations
- State mutations
- External dependencies (DB, API, files)
- Error handling paths

## Output Format

```
### Entry Point
file.py:function_name

### Call Graph
function_a()
├── function_b()
│   └── function_c()
└── function_d()

### Data Flow
Input → validate() → transform() → persist() → Output

### State Mutations
| Location | What Changes | Trigger |

### External Calls
| Type | Location | Purpose |

### Uncertainties
- [UNCERTAIN: reason]
```

## Instructions

1. Use `codebase-analyzer` agent
2. Start at specified entry point
3. Trace forward through call chain
4. Document every transformation and side effect
5. Mark uncertainty explicitly
6. Cite file:line for all claims

## Cognitive Debiasing

### Tracing Biases

| Bias | Trap | How /trace Counters |
|------|------|---------------------|
| **Assumption** | "I know what this does" | Forces explicit verification |
| **Naming trust** | Believing function names | Verifies behavior against name |
| **Familiarity** | Skipping "obvious" code | Traces everything systematically |
| **Happy path** | Only tracing success | Includes error branches |

### Evidence Hierarchy

1. **Actual behavior** - What the code does (most reliable)
2. **Test assertions** - What tests verify (trustworthy)
3. **Type signatures** - What's declared (usually reliable)
4. **Comments/docs** - What's claimed (verify against code)
5. **Names** - What's implied (often misleading)

## Human Factors

### Why Code Tracing Matters

- **Understanding**: Can't fix what you don't understand
- **Bug location**: Traces narrow down where issues occur
- **Impact analysis**: Know what changes affect
- **Onboarding**: New devs need to trace to learn

### Mental Model Building

Tracing helps build mental models:
```
Entry → [What happens?] → Exit
         ↓
     Side effects?
         ↓
     Error cases?
```

## Decision Science

### When to Trace

| Situation | Trace Depth |
|-----------|------------|
| Quick bug fix | Just affected code |
| Feature change | Feature + dependencies |
| Architecture understanding | Full paths |
| Incident investigation | Deep, including failures |

### Uncertainty Acknowledgment

If analysis can't determine behavior with confidence:
- Mark `[UNCERTAIN]` with reason
- Suggest how to verify
- Don't guess without evidence
