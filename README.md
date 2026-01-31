# Claude Code Configuration Framework

Portable, reusable Claude Code configuration with specialized agents, skills, commands, workflows, templates, and automation hooks.

## What's Included

```
.claude/
├── settings.json     # Hook configurations (auto-executed)
├── rules.md          # Code quality & analysis standards
├── agents/           # 21 specialized agents with tool specs
├── skills/           # 14 invocable skills (SKILL.md format)
├── commands/         # 19 slash commands
├── workflows/        # 7 multi-step workflows
├── templates/        # 9 language/framework templates
├── hooks/            # Hook documentation
├── scripts/          # Executable hook scripts
└── prompts/          # 5 reusable prompt modes
```

## Quick Install

```bash
# Copy to your project
cp -r .claude /path/to/your/project/
cp CLAUDE.md /path/to/your/project/

# Or use the install script
./install.sh /path/to/your/project
```

## Agents

All agents include `tools:` and `model:` specifications for proper isolation.

### Analysis Agents
| Agent | Purpose | Model |
|-------|---------|-------|
| `repo-architecture-scanner` | Map structure, tech stack, entry points | sonnet |
| `codebase-analyzer` | Trace specific flows with precision | sonnet |
| `dependency-analyzer` | Find cycles, coupling, god modules | sonnet |
| `performance-analyzer` | Identify bottlenecks, N+1, complexity | sonnet |
| `dead-code-analyzer` | Find unused code, doc drift | sonnet |
| `error-flow-analyzer` | Trace error handling, find gaps | sonnet |
| `state-flow-analyzer` | Map state mutations, race conditions | sonnet |
| `domain-logic-mapper` | Map business logic, invariants | sonnet |
| `interface-contract-analyzer` | Audit API contracts, validation | sonnet |
| `cross-cutting-concern-analyzer` | Check auth, logging, resilience | sonnet |
| `architecture-synthesizer` | Combine multiple agent reports | opus |
| `report-critic` | Review reports for accuracy | opus |

### Specialized Agents
| Agent | Purpose | Model |
|-------|---------|-------|
| `security-scanner` | OWASP vulnerabilities, injection, secrets | opus |
| `test-analyzer` | Coverage gaps, flaky tests, missing cases | sonnet |
| `documentation-auditor` | Doc completeness, accuracy, staleness | sonnet |
| `migration-planner` | Plan framework/version migrations | opus |
| `refactor-advisor` | Identify refactoring opportunities | sonnet |
| `complexity-analyzer` | Cyclomatic/cognitive complexity metrics | sonnet |

### Generation Agents
| Agent | Purpose | Model |
|-------|---------|-------|
| `project-scaffolder` | Scaffold new project structures | sonnet |
| `feature-generator` | Generate features matching patterns | sonnet |
| `config-initializer` | Initialize project configurations | sonnet |

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
| `/scaffold` | `/scaffold [type] [name]` | Scaffold project |
| `/create` | `/create [type] [name]` | Generate feature |
| `/init` | `/init [config-type]` | Initialize configs |

## Skills

Skills use the proper `SKILL.md` directory format:

```
.claude/skills/
├── analyze-codebase/SKILL.md
├── analyze-architecture/SKILL.md
├── analyze-dependencies/SKILL.md
├── analyze-performance/SKILL.md
├── analyze-dead-code/SKILL.md
├── analyze-errors/SKILL.md
├── analyze-state/SKILL.md
├── analyze-domain/SKILL.md
├── analyze-api/SKILL.md
├── analyze-cross-cutting/SKILL.md
├── generate-report/SKILL.md
├── generate-feature/SKILL.md
├── scaffold-project/SKILL.md
└── init-config/SKILL.md
```

## Hooks

Hooks are configured in `.claude/settings.json` and use executable scripts:

### Configuration (settings.json)
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash(git commit*)",
        "command": [".claude/scripts/pre-commit.sh"]
      },
      {
        "matcher": "Bash(git push*)",
        "command": [".claude/scripts/pre-push.sh"]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "command": [".claude/scripts/post-edit.sh", "$FILE_PATH"]
      }
    ]
  }
}
```

### Available Scripts
| Script | Trigger | Checks |
|--------|---------|--------|
| `pre-commit.sh` | Before git commit | Secrets, debug code, lint |
| `pre-push.sh` | Before git push | Tests, WIP commits, large files |
| `post-edit.sh` | After file edit | Auto-format by file type |
| `on-error.sh` | On errors | Contextual suggestions |

## Workflows

Multi-step automated processes:

| Workflow | Purpose |
|----------|---------|
| `new-project` | Complete project creation workflow |
| `add-feature` | 9-phase feature development workflow |
| `onboarding` | New developer onboarding |
| `pr-review` | Comprehensive PR review process |
| `release-prep` | Pre-release checklist |
| `incident-response` | Debug production issues |
| `tech-debt-audit` | Quarterly tech debt review |

## Templates

Language/framework-specific patterns:

| Template | Languages/Frameworks |
|----------|---------------------|
| `python.md` | Python, pytest, Black, Ruff |
| `typescript.md` | TypeScript, ESLint, Prettier |
| `golang.md` | Go, gofmt, golint |
| `rust.md` | Rust, rustfmt, clippy |
| `react.md` | React, hooks, testing-library |
| `project-api.md` | REST API project structure |
| `project-cli.md` | CLI application structure |
| `project-webapp.md` | Web application structure |
| `project-library.md` | Reusable library structure |

## Prompts

Reusable prompt modes:

| Prompt | Purpose |
|--------|---------|
| `explain-like-5` | Simple explanations of complex topics |
| `rubber-duck` | Debugging companion |
| `devil-advocate` | Challenge assumptions |
| `senior-review` | Senior engineer perspective |
| `security-mindset` | Think like an attacker |

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

### Add Custom Skills

Create a directory in `.claude/skills/` with `SKILL.md`:

```markdown
---
name: my-skill
description: "What it does"
---

# My Skill

Instructions for Claude...
```

### Apply Language Template

```bash
cat .claude/templates/python.md >> .claude/rules.local.md
```

## Key Improvements (v2)

1. **Proper Hook Configuration** - Hooks are now in `settings.json` with executable scripts
2. **SKILL.md Format** - Skills use the correct directory structure
3. **Agent Tool Specs** - All agents have `tools:` and `model:` specifications
4. **CLAUDE.md Root File** - Primary configuration entry point
5. **Executable Scripts** - Real shell scripts for automation

## License

MIT - Use freely in any project.
