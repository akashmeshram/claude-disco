---
name: explain
description: "Understand how code works. Usage: /explain [function|file|concept]"
---

# /explain

Understand code without reading every line.

## Examples

```bash
/explain handleAuth          # How does this function work?
/explain src/auth/           # What does this module do?
/explain "the caching layer" # How does caching work here?
```

## Explanation Levels

| Request | What You Get |
|---------|--------------|
| Function | Inputs → Processing → Outputs |
| File | Purpose, key functions, dependencies |
| Directory | Architecture, responsibilities, how parts connect |
| Concept | How the system implements this idea |

## What's Included

- **The "why"** - not just what, but purpose
- **Data flow** - what goes in, what comes out
- **Dependencies** - what this relies on
- **Gotchas** - non-obvious behaviors, edge cases

## What's NOT Included

- Line-by-line narration (read the code for that)
- Historical context (use git blame)
- Speculation about intent (marked `[UNCERTAIN]` if guessing)

## Tips

- Be specific: "explain validateUser" > "explain auth"
- Ask follow-ups: understanding is iterative
- If explanation is confusing, the code might be too

## Cognitive Psychology Principles

### Why Explanations Work

Understanding code is hard because:
- **Working memory limits**: ~4 items at a time
- **Chunking needed**: Group related concepts
- **Mental models**: Need framework to hang details on

This command provides:
- **Chunked information**: Key concepts first
- **Mental model**: "What" before "how"
- **Progressive disclosure**: Ask for more detail if needed

### Explanation Structure

```
1. Purpose (why it exists)
2. Inputs (what it takes)
3. Outputs (what it produces)
4. Key logic (how it works)
5. Dependencies (what it relies on)
6. Gotchas (non-obvious behavior)
```

This order matches how people build mental models.

## Human Factors

### Signs of Unclear Code

If explanation is hard to write, the code may need:
- Better naming
- Smaller functions
- More comments
- Refactoring

"If you can't explain it simply, you don't understand it well enough."
— Often attributed to Einstein, applies to code too.

### Knowledge Transfer

Good explanations are reusable:
- Save for onboarding docs
- Add as code comments
- Share with team
