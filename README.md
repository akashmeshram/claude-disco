# Claude Code Configuration Framework

A human-centered configuration framework designed through the lens of seven disciplines: **systems design**, **software craftsmanship**, **cognitive psychology**, **human-computer interaction**, **organizational behavior**, **decision science**, and **human factors engineering**.

## Design Philosophy

### From Cognitive Psychology
**Reduce mental load.** Working memory holds ~4 items. We chunk information, use progressive disclosure, and favor recognition over recall.

### From Decision Science
**Counter cognitive biases.** Checklists prevent omission errors. The STOP protocol counters action bias. Multiple hypotheses counter confirmation bias.

### From Human Factors Engineering
**Design for error prevention.** Make the right thing easy and the wrong thing hard. Fail-safe defaults. Defense in depth.

### From Organizational Behavior
**Build shared understanding.** Documentation creates common mental models. Output is structured for different audiences (executives, leads, engineers).

### From Systems Design
**Separation of concerns.** Agents analyze. Commands invoke. Skills extend. Hooks automate. Each has clear boundaries.

### From Software Craftsmanship
**Empathy for the reader.** Code and configuration are written for the developer at 2am. Boring beats clever.

### From HCI
**Human-first interaction.** Examples before theory. Guessable patterns. Helpful errors with suggestions.

## Quick Start

```bash
/analyze              # Orient yourself in unfamiliar code
/debug "description"  # Systematic problem-solving
/review file.ts       # Feedback before problems compound
```

## What's Included

```
.claude/
├── rules.md          # Team conventions (cognitive load optimized)
├── settings.json     # Hook configurations
├── agents/           # 21 specialized analysts
├── skills/           # 14 auto-invoked capabilities
├── commands/         # 19 explicit actions
├── workflows/        # 7 multi-step processes
├── templates/        # 9 language patterns
├── scripts/          # 4 safety automation hooks
└── prompts/          # 5 conversation modes
```

## Commands by Intent

### Understanding (reduce uncertainty)
| Command | When to Use |
|---------|-------------|
| `/analyze` | Get oriented in unfamiliar code |
| `/explain` | Understand how something works |
| `/trace` | Follow a specific code path |

### Improving (reduce defects)
| Command | When to Use |
|---------|-------------|
| `/review` | Get feedback before problems compound |
| `/fix` | Auto-fix lint/type/format issues |
| `/refactor` | Restructure without changing behavior |

### Creating (reduce inconsistency)
| Command | When to Use |
|---------|-------------|
| `/test` | Generate tests that catch real bugs |
| `/create` | Generate components matching existing patterns |
| `/scaffold` | Create entire project structures |

### Investigating (reduce debugging time)
| Command | When to Use |
|---------|-------------|
| `/debug` | Systematic, debiased problem-solving |
| `/check-perf` | Find what will be slow at scale |
| `/check-errors` | Find where errors get swallowed |
| `/audit-security` | Find vulnerabilities before attackers |

## Error Prevention (Human Factors)

Hooks run automatically to catch mistakes before they compound:

| Hook | Trigger | What It Catches |
|------|---------|-----------------|
| `pre-commit` | Before git commit | Secrets, debug code, lint errors |
| `pre-push` | Before git push | Failing tests, WIP commits |
| `post-edit` | After file edit | Formatting issues (auto-fixed) |
| `on-error` | On any error | Suggests debugging steps |

## Cognitive Debiasing

### In Analysis
- **Checklists** prevent omission errors
- **Uncertainty markers** counter overconfidence
- **Evidence hierarchy** counters naming bias
- **Multiple hypotheses** counter confirmation bias

### In Decision-Making
- **Impact prioritization** counters recency bias
- **STOP protocol** counters action bias
- **Prioritization matrix** structures trade-offs
- **Verification criteria** define "done"

## Knowledge Sharing (Organizational Behavior)

### Output Structured for Different Audiences

| Audience | Time | What They Need |
|----------|------|----------------|
| Executives | 30 sec | Health status, top risk, decision needed |
| Tech Leads | 5 min | Scorecard, priorities, owners |
| Engineers | 30 min | Full details, exact locations, fix steps |

### Shared Mental Models

- Visual diagrams for spatial thinkers
- Tables for structured data
- Code blocks for flows
- Consistent terminology

## Customization

### Project-specific rules
```bash
# Create .claude/rules.local.md
```

### Custom commands
```bash
# Add .md files to .claude/commands/
```

### Custom skills
```bash
# Add directories to .claude/skills/<name>/SKILL.md
```

## Sources & Further Reading

### Decision Science & Cognitive Biases
- [Cognitive Biases in Software Development](https://dl.acm.org/doi/10.1145/3517217) - Communications of the ACM
- [Atlassian: How Cognitive Biases Influence Software Development](https://www.atlassian.com/blog/add-ons/how-cognitive-biases-influence-software-development)

### Human Factors Engineering
- [Human Error Analysis in Software Engineering](https://www.intechopen.com/chapters/54996) - IntechOpen
- [Human Factors in Safety-Critical Systems](https://link.springer.com/chapter/10.1007/978-1-4471-0937-2_27) - Springer

### Cognitive Load & Developer Experience
- [Cognitive Load in Software Development](https://github.com/zakirullin/cognitive-load) - GitHub
- [Cognitive Load Theory](https://thevaluable.dev/cognitive-load-theory-software-developer/) - The Valuable Dev

### CLI Design & HCI
- [Command Line Interface Guidelines](https://clig.dev/) - clig.dev
- [UX Patterns for CLI Tools](https://www.lucasfcosta.com/blog/ux-patterns-cli-tools) - Lucas Costa

### Organizational Behavior
- [Knowledge Sharing in Organizations](https://www.tandfonline.com/doi/full/10.1080/23311975.2023.2195027) - Cogent Business
- [Atlassian: Knowledge Sharing Culture](https://www.atlassian.com/work-management/knowledge-sharing/culture)

### Software Craftsmanship
- Clean Code (Robert C. Martin)
- The Pragmatic Programmer (Hunt & Thomas)

## License

MIT - Use freely in any project.
