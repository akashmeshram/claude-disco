---
name: onboarding
description: "New developer onboarding workflow"
---

# Developer Onboarding Workflow

Help new developers get productive quickly—designed using cognitive psychology principles to reduce overwhelm and build confidence.

## Why Onboarding Matters

```
Time to productivity:
  Poor onboarding:  2-3 months
  Good onboarding:  2-4 weeks

Cost of poor onboarding:
  Frustration → Disengagement → Turnover
```

## Cognitive Load Management

New developers face massive cognitive overload. This workflow uses:
- **Chunking**: Information in digestible pieces
- **Progressive disclosure**: Learn what you need, when you need it
- **Scaffolding**: Support that fades as competence grows

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

## Human Factors

### Common Onboarding Failures

| Failure | Symptom | Prevention |
|---------|---------|------------|
| Information dump | Overwhelmed, nothing retained | Progressive disclosure |
| Sink or swim | Frustration, slow progress | Structured guidance |
| No feedback | Uncertainty, imposter syndrome | Regular check-ins |
| Tribal knowledge | Blocked on undocumented info | Document as you learn |

### Psychological Safety

New developers often fear:
- "Asking stupid questions"
- Breaking things
- Being slow

Counter with:
- Explicitly encourage questions
- Provide safe sandbox environments
- Set realistic expectations for ramp-up

### The "Document as You Go" Practice

New developers should document:
- Setup steps that weren't in README
- Confusion points in architecture
- Tribal knowledge they discover

This:
- Forces active learning (better retention)
- Improves onboarding for next person
- Validates their contribution early

## Decision Science

### First Task Selection

Good first tasks:
- Low risk (can't break production)
- Quick feedback (see results fast)
- Real value (not busy work)
- Requires exploring codebase

Bad first tasks:
- Critical path features
- Complex architectural changes
- Tasks requiring deep context

### Mentorship Allocation

| Task Type | Support Level |
|-----------|---------------|
| First PR | Pair programming |
| Week 1 tasks | Detailed code review |
| Month 1 tasks | Normal code review |
| After month 1 | Spot checks |
