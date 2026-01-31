---
name: new-project
description: "Complete workflow for creating a new project from scratch"
---

# New Project Workflow

Full guide for creating a new project with proper structure, configuration, and setup.

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
