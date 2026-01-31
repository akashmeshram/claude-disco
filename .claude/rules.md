# Project Rules

## Core Principle

**Design for the tired, stressed developer at 2am.** Every rule should make their job easier, not harder.

## Before You Change Code

### STOP - THINK - OBSERVE - PLAN

1. **Stop**: Don't jump to solutions. Understand first.
2. **Think**: What problem are we actually solving?
3. **Observe**: Read the code. Check the tests. Look at history.
4. **Plan**: Small changes. One thing at a time.

This counters the *action bias*—the tendency to do something rather than nothing.

### Evidence Over Intuition

- Read code before modifying—names lie, implementations don't
- Cite `file:line` when discussing code
- If you can't point to evidence, you're guessing

## While Changing Code

### Minimize Cognitive Load

- **One concept per function** - If it needs "and" to describe, split it
- **Familiar words over jargon** - "login" not "authentication"
- **Boring over clever** - The next reader might be you, exhausted

### Error Prevention by Design

- Make invalid states unrepresentable
- Fail fast, fail clearly
- Default to safe (deny by default, explicit opt-in)

### Match Existing Patterns

Consistency reduces mental overhead. A codebase with one style (even imperfect) beats a codebase with five "better" styles.

## Analysis & Communication

### Structure for Skimming

- Tables for structured data
- Code blocks for flows
- Bold for emphasis (sparingly)
- Findings ordered by impact, not discovery order

### Acknowledge Uncertainty

| Marker | Meaning |
|--------|---------|
| `[UNCERTAIN]` | Can't verify from code alone |
| `[HIGH/MEDIUM/LOW]` | Confidence level |
| `[ASSUMPTION]` | Requires validation |

This counters *overconfidence bias*.

### Prioritize by Impact

Not everything matters equally. Order by:
1. What could cause data loss or security breach
2. What blocks other work
3. What causes daily friction
4. What would be nice

## Git Practices

### Commits

- Only commit when explicitly asked
- Format: `type: description` (feat, fix, refactor, docs, test)
- Never amend unless asked (prevents losing work)
- Never force push to main/master

### Pre-Commit Checklist

Before every commit, verify:
- [ ] No secrets (.env, API keys)
- [ ] No debug code (console.log, debugger)
- [ ] Tests pass (if they exist)
- [ ] Changes are staged intentionally (not `git add -A`)

Checklists prevent *omission errors*—the mistakes we make by forgetting steps.

## Team Knowledge Sharing

### Write for Your Replacement

Code should be understandable without you explaining it. Comments explain *why*, not *what*.

### Document Decisions, Not Just Code

When you make a non-obvious choice, leave a trail:
```
// We use polling instead of websockets here because
// the infrastructure doesn't support persistent connections.
// See: ARCH-123
```

This creates *shared mental models* across the team.
