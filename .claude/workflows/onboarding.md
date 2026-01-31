---
name: onboarding
description: "New developer onboarding workflow"
---

# Developer Onboarding Workflow

Help new developers get productive quickly.

## Phase 1: Environment Setup

### Prerequisites Check
```
/analyze environment

[ ] Git installed and configured
[ ] Required language runtimes (Node, Python, etc.)
[ ] Package managers (npm, pip, etc.)
[ ] IDE/editor setup
[ ] Required CLI tools
```

### Repository Setup
```bash
# Clone repository
git clone <repo-url>
cd <project>

# Install dependencies
npm install  # or pip install -r requirements.txt

# Setup environment
cp .env.example .env
# Configure local settings

# Verify setup
npm run build
npm test
```

## Phase 2: Codebase Overview

### Architecture Understanding
```
/report architecture

Key questions to answer:
- What is the high-level architecture?
- What are the main components?
- How do they interact?
- Where is the entry point?
```

### Key Files Tour
| File | Purpose |
|------|---------|
| README.md | Project overview |
| package.json / pyproject.toml | Dependencies |
| src/index.* | Entry point |
| src/config/* | Configuration |
| docs/ | Documentation |

### Domain Overview
```
/analyze domain

Understand:
- Core business entities
- Main workflows
- Key terminology
```

## Phase 3: First Tasks

### Starter Tasks
Good first issues for new developers:
- [ ] Fix a typo in documentation
- [ ] Add a simple test
- [ ] Small bug fix with clear scope
- [ ] Minor UI improvement

### Development Workflow
```
1. Create branch: git checkout -b feature/my-change
2. Make changes
3. Run tests: npm test
4. Commit: git commit -m "feat: add feature"
5. Push: git push -u origin feature/my-change
6. Create PR
```

## Phase 4: Deep Dives

### Code Areas to Explore
| Area | Command | Priority |
|------|---------|----------|
| Authentication | /trace auth | High |
| API structure | /explain api | High |
| Database layer | /trace database | Medium |
| Testing patterns | /explain tests | Medium |

### Common Patterns
```
/analyze patterns

Learn the project's:
- Error handling conventions
- Logging practices
- Testing patterns
- Code organization
```

## Phase 5: Resources

### Documentation
- [ ] README.md
- [ ] CONTRIBUTING.md
- [ ] API documentation
- [ ] Architecture docs

### Contacts
- Technical questions: @tech-lead
- Process questions: @team-lead
- Access issues: @devops

### Tools & Access
- [ ] GitHub/GitLab access
- [ ] CI/CD access
- [ ] Staging environment
- [ ] Monitoring dashboards
- [ ] Communication channels

## Checklist

### Day 1
- [ ] Environment setup complete
- [ ] Can build project
- [ ] Can run tests
- [ ] Access to all tools

### Week 1
- [ ] Understand architecture
- [ ] Completed first task
- [ ] Familiar with workflow

### Month 1
- [ ] Comfortable with codebase
- [ ] Completed several tasks
- [ ] Can review others' code
