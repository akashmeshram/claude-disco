---
name: new-project
description: "Complete workflow for creating a new project from scratch"
---

# New Project Workflow

Full guide for creating a new project with proper structure, configuration, and setup—designed using systems thinking to prevent early decisions from becoming long-term constraints.

## Why Proper Setup Matters

```
Technical debt starts at project creation:
  Poor structure → Refactoring later = expensive
  Missing config → Added later = inconsistent
  No tests → Added later = incomplete

Getting it right early is 10x cheaper than fixing later.
```

## Phase 1: Requirements Gathering

### Project Definition
```
Questions to answer:
- What is the project's purpose?
- What type? (API, CLI, webapp, library)
- What language/framework?
- What features are needed?
- What's the deployment target?
```

### Technical Choices
| Decision | Options |
|----------|---------|
| Language | TypeScript, Python, Go, Rust |
| Framework | Express, FastAPI, Gin, Actix |
| Database | PostgreSQL, MongoDB, SQLite |
| Testing | Vitest, Jest, Pytest |
| CI/CD | GitHub Actions, GitLab CI |

## Phase 2: Scaffold Project

### Create Base Structure
```
/scaffold [type] [name]

This will create:
├── src/           # Source code
├── tests/         # Test files
├── docs/          # Documentation
├── .gitignore     # Git ignore rules
├── README.md      # Project readme
└── [configs]      # Language-specific configs
```

### Verify Structure
```bash
# Check files were created
ls -la

# Verify it builds
npm run build  # or equivalent

# Run initial tests
npm test
```

## Phase 3: Initialize Configuration

### Set Up Tooling
```
/init all

Or selectively:
/init ci          # CI/CD pipeline
/init lint        # Code quality tools
/init test        # Testing framework
/init docker      # Containerization
```

### Configure Environment
```bash
# Create environment file
cp .env.example .env

# Edit with your settings
# DATABASE_URL=...
# API_KEY=...
```

## Phase 4: Version Control Setup

### Initialize Repository
```bash
# Initialize git
git init

# Create initial commit
git add .
git commit -m "feat: initial project scaffold"

# Add remote
git remote add origin <repo-url>
git push -u origin main
```

### Branch Protection (Optional)
- Require PR reviews
- Require CI to pass
- Protect main branch

## Phase 5: Initial Development

### First Feature
```
/create [type] [name]

Examples:
/create api health        # Health check endpoint
/create component App     # Root component
/create service config    # Config service
```

### Write First Test
```
/test [file]

Verify testing works:
npm test
```

## Phase 6: Documentation

### README Structure
```markdown
# Project Name

Brief description.

## Getting Started

### Prerequisites
- Node.js 20+
- npm or pnpm

### Installation
\`\`\`bash
npm install
\`\`\`

### Running
\`\`\`bash
npm run dev
\`\`\`

## Development

### Commands
- `npm run dev` - Start development
- `npm test` - Run tests
- `npm run build` - Build for production

## Architecture

Brief architecture overview.

## Contributing

How to contribute.
```

### API Documentation (if applicable)
- OpenAPI/Swagger spec
- Endpoint documentation
- Example requests

## Phase 7: Verification Checklist

### Development Environment
- [ ] Project builds without errors
- [ ] Tests run and pass
- [ ] Linting passes
- [ ] Dev server starts

### Configuration
- [ ] CI pipeline runs on push
- [ ] Environment variables documented
- [ ] Docker build works (if applicable)

### Documentation
- [ ] README is complete
- [ ] Contributing guide exists
- [ ] Architecture is documented

## Quick Start Commands

```bash
# Full project setup in one go:
/scaffold api my-api
cd my-api
/init all
git init && git add . && git commit -m "feat: initial setup"
/create api health
npm run dev
```

## Next Steps

After project creation:
1. `/create` to add features
2. `/test` to add more tests
3. `/analyze` to check quality
4. `/review` before merging PRs

## Decision Science

### Technology Selection

Avoid analysis paralysis with these criteria:

| Factor | Weight | Question |
|--------|--------|----------|
| Team familiarity | 30% | Does the team know this? |
| Community support | 25% | Can we find help/hiring? |
| Problem fit | 25% | Does it solve our problem well? |
| Long-term viability | 20% | Will it be maintained in 5 years? |

### New vs. Familiar Technology

| Situation | Preference |
|-----------|------------|
| Critical project, tight deadline | Familiar tech |
| Learning project, flexible timeline | Can try new tech |
| Team has experts | Their expertise |
| Team is new | Industry standard |

## Human Factors

### Common New Project Mistakes

| Mistake | Why It Happens | Prevention |
|---------|----------------|------------|
| Over-engineering | "We might need it" | YAGNI—add when needed |
| Under-documenting | "I'll remember" | Document as you go |
| Skipping tests | "It's just a prototype" | Prototype → Production happens fast |
| Copy-paste security | "We'll harden later" | Secure by default |

### Making Projects Approachable

New contributors should be able to:
- Understand purpose in 2 minutes (README)
- Run locally in 10 minutes (setup script)
- Make first change in 30 minutes (good first issue)

## Cognitive Load Management

### Progressive Complexity

Don't configure everything upfront:

| Phase | Configure | Skip |
|-------|-----------|------|
| Day 1 | Build, test, lint | Advanced CI, monitoring |
| Week 1 | CI/CD, deploy | Performance testing |
| Month 1 | Monitoring, alerts | Optimization |

Add complexity as you need it, not before.
