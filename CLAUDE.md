# Claude Code Configuration Framework

A portable, reusable configuration system for Claude Code with specialized agents, skills, workflows, and automation.

## Quick Reference

- **Rules**: @.claude/rules.md
- **Available Commands**: Type `/` to see all commands
- **Available Skills**: Type `/` to see all skills

## Project Structure

```
.claude/
├── agents/      # Specialized analysis agents (use with Task tool)
├── skills/      # Invocable skills (/skill-name)
├── commands/    # Slash commands
├── workflows/   # Multi-step processes
├── templates/   # Language/framework patterns
├── hooks/       # Automation documentation
└── scripts/     # Executable hook scripts
```

## Key Commands

| Command | Purpose |
|---------|---------|
| `/analyze` | Run codebase analysis |
| `/review` | Code review |
| `/test` | Generate tests |
| `/fix` | Auto-fix issues |
| `/report` | Generate analysis report |

## Usage Patterns

### Codebase Analysis
```
/analyze arch           # Architecture overview
/analyze deps           # Dependency analysis
/analyze perf src/      # Performance check
/analyze full           # Complete audit
```

### Development
```
/create component Button    # Generate component
/test src/utils.ts          # Generate tests
/fix lint src/              # Fix lint issues
/review PR-123              # Review pull request
```

## Customization

Add project-specific rules in `.claude/rules.local.md` (gitignored).
