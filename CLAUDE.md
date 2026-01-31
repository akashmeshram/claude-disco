# Claude Code Configuration

A human-centered framework designed to reduce errors, lower cognitive load, and help teams build shared understanding.

## Design Principles

### Cognitive Economy
Minimize mental effort. You have ~4 items of working memory—we design for that.

### Error Prevention
Make the right thing easy and the wrong thing hard. Fail-safe defaults.

### Shared Understanding
Configuration that creates common mental models across your team.

### Decision Support
Tools that counteract cognitive biases, not amplify them.

## Quick Start

```bash
/analyze              # Orient yourself in any codebase
/review file.ts       # Get feedback before it's too late
/debug "description"  # Systematic problem-solving
```

## Command Patterns

Commands follow predictable **verb-noun** structure:

| Pattern | Examples |
|---------|----------|
| `/analyze [what]` | `/analyze`, `/analyze deps`, `/analyze perf` |
| `/check-[aspect]` | `/check-perf`, `/check-errors` |
| `/[action] [target]` | `/fix lint`, `/test utils.ts` |

When in doubt: type `/` and scan the list.

## Mental Model

```
Commands → invoke actions (you call them)
Skills   → provide knowledge (auto-activated)
Agents   → deep analysis (via Task tool)
Hooks    → safety rails (run automatically)
```

## Error Prevention

These run automatically to catch mistakes:
- **pre-commit**: Secrets, debug code, lint errors
- **pre-push**: Tests, WIP commits, large files
- **post-edit**: Auto-formatting

## Structure

```
.claude/
├── rules.md      # Team conventions
├── agents/       # Deep analysis specialists
├── skills/       # Auto-invoked knowledge
├── commands/     # Explicit actions
└── scripts/      # Safety automation
```

## Customization

Create `.claude/rules.local.md` for project-specific rules.
Team rules go in `.claude/rules.md` (version controlled).
