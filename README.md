# Claude Code Config

Portable, reusable Claude Code configuration with analysis agents, skills, commands, workflows, templates, hooks, and prompts.

## What's Included

```
.claude/
├── rules.md          # Code quality & analysis standards
├── agents/           # 17 specialized analysis agents
├── skills/           # 11 invocable skills
├── commands/         # 15 slash commands
├── workflows/        # 5 multi-step workflows
├── templates/        # 5 language/framework templates
├── hooks/            # 4 automation hooks
└── prompts/          # 5 reusable prompt modes
```

## Quick Install

```bash
# Copy to your project
cp -r .claude /path/to/your/project/

# Or use the install script
./install.sh /path/to/your/project
```

## Agents

### Analysis Agents
| Agent | Purpose |
|-------|---------|
| `repo-architecture-scanner` | Map structure, tech stack, entry points |
| `codebase-analyzer` | Trace specific flows with precision |
| `dependency-analyzer` | Find cycles, coupling, god modules |
| `performance-analyzer` | Identify bottlenecks, N+1, complexity |
| `dead-code-analyzer` | Find unused code, doc drift |
| `error-flow-analyzer` | Trace error handling, find gaps |
| `state-flow-analyzer` | Map state mutations, race conditions |
| `domain-logic-mapper` | Map business logic, invariants |
| `interface-contract-analyzer` | Audit API contracts, validation |
| `cross-cutting-concern-analyzer` | Check auth, logging, resilience |
| `architecture-synthesizer` | Combine multiple agent reports |
| `report-critic` | Review reports for accuracy |

### New Specialized Agents
| Agent | Purpose |
|-------|---------|
| `security-scanner` | OWASP vulnerabilities, injection, secrets |
| `test-analyzer` | Coverage gaps, flaky tests, missing cases |
| `documentation-auditor` | Doc completeness, accuracy, staleness |
| `migration-planner` | Plan framework/version migrations |
| `refactor-advisor` | Identify refactoring opportunities |
| `complexity-analyzer` | Cyclomatic/cognitive complexity metrics |

## Commands

### Analysis Commands
| Command | Usage | Description |
|---------|-------|-------------|
| `/analyze` | `/analyze [type] [path]` | Run analysis |
| `/trace` | `/trace [function\|path]` | Trace code flow |
| `/find-dead` | `/find-dead [path]` | Find unused code |
| `/check-perf` | `/check-perf [path]` | Check performance |
| `/check-errors` | `/check-errors [path]` | Audit error handling |
| `/map-deps` | `/map-deps [path]` | Map dependencies |
| `/audit-security` | `/audit-security [path]` | Security audit |
| `/explain` | `/explain [function]` | Explain code |
| `/report` | `/report [type]` | Generate report |

### Development Commands
| Command | Usage | Description |
|---------|-------|-------------|
| `/fix` | `/fix [type] [path]` | Auto-fix issues |
| `/test` | `/test [file]` | Generate tests |
| `/review` | `/review [file\|PR]` | Code review |
| `/document` | `/document [file]` | Generate docs |
| `/refactor` | `/refactor [file]` | Suggest refactoring |
| `/migrate` | `/migrate [from] [to]` | Plan migrations |
| `/debug` | `/debug [issue]` | Systematic debugging |

## Workflows

Multi-step automated processes:

| Workflow | Purpose |
|----------|---------|
| `onboarding` | New developer onboarding |
| `pr-review` | Comprehensive PR review process |
| `release-prep` | Pre-release checklist |
| `incident-response` | Debug production issues |
| `tech-debt-audit` | Quarterly tech debt review |

## Templates

Language/framework-specific rules:

| Template | Languages/Frameworks |
|----------|---------------------|
| `python.md` | Python, pytest, Black, Ruff |
| `typescript.md` | TypeScript, ESLint, Prettier |
| `golang.md` | Go, gofmt, golint |
| `rust.md` | Rust, rustfmt, clippy |
| `react.md` | React, hooks, testing-library |

## Hooks

Automation triggers:

| Hook | Trigger |
|------|---------|
| `pre-commit` | Before committing code |
| `post-edit` | After editing a file |
| `pre-push` | Before pushing to remote |
| `on-error` | When errors occur |

## Prompts

Reusable prompt modes:

| Prompt | Purpose |
|--------|---------|
| `explain-like-5` | Simple explanations of complex topics |
| `rubber-duck` | Debugging companion |
| `devil-advocate` | Challenge assumptions |
| `senior-review` | Senior engineer perspective |
| `security-mindset` | Think like an attacker |

## Skills

Skills are invoked with `/skill-name`:

- `/analyze-codebase` - Run analysis agents
- `/analyze-architecture` - Map repository structure
- `/analyze-dependencies` - Dependency analysis
- `/analyze-performance` - Performance audit
- `/analyze-dead-code` - Dead code detection
- `/analyze-errors` - Error handling audit
- `/analyze-state` - State flow analysis
- `/analyze-domain` - Domain logic mapping
- `/analyze-api` - API contract analysis
- `/analyze-cross-cutting` - Cross-cutting concerns
- `/generate-report` - Full analysis report

## Customization

### Add Project-Specific Rules

Create `.claude/rules.local.md` (won't be overwritten):

```markdown
# Project-Specific Rules

## Tech Stack
- Python 3.11+ with FastAPI
- PostgreSQL database

## Conventions
- Use Pydantic for validation
- Async handlers only
```

### Add Custom Commands

Create `.md` files in `.claude/commands/`:

```markdown
---
name: my-command
description: "What it does"
---

# My Command

Instructions for Claude...
```

### Add Language Template

Apply a template by copying to rules:

```bash
cat .claude/templates/python.md >> .claude/rules.local.md
```

## License

MIT - Use freely in any project.
