---
name: add-feature
description: "Workflow for adding a new feature to an existing codebase"
---

# Add Feature Workflow

Complete guide for adding new features that integrate cleanly with existing code.

## Phase 1: Understand Requirements

### Feature Definition
```
Questions to answer:
- What should this feature do?
- Who will use it?
- What are the inputs/outputs?
- What are the edge cases?
- What are the success criteria?
```

### Acceptance Criteria
```
Example for "Add user search":
- [ ] Users can search by name or email
- [ ] Search is case-insensitive
- [ ] Results are paginated (20 per page)
- [ ] Empty search returns error
- [ ] No results shows appropriate message
```

## Phase 2: Analyze Existing Code

### Find Related Code
```
/analyze arch           # Understand structure
/trace [related-feature]  # See how similar features work
```

### Identify Patterns
| Pattern | Example |
|---------|---------|
| File naming | `user.service.ts`, `UserService.ts` |
| Folder structure | `src/services/`, `src/modules/` |
| Testing | `*.test.ts`, `*.spec.ts` |
| Exports | Named exports, barrel files |

### Identify Integration Points
- Which files need updates?
- What routes/navigation changes?
- What state management updates?
- What API changes?

## Phase 3: Design the Feature

### Component Breakdown
```
Example for "User Search" feature:

Components:
- SearchInput: Text input with debounce
- SearchResults: Display list of users
- SearchPagination: Page navigation

Services:
- SearchService: API calls for search

Types:
- SearchParams: Query parameters
- SearchResult: Response type
```

### Data Flow
```
User Input → SearchInput → debounce → SearchService → API
                                            ↓
UI Update ← SearchResults ← state update ← Response
```

## Phase 4: Generate Scaffolding

### Create Components
```
/create component SearchInput
/create component SearchResults
/create service SearchService
/create model SearchParams
```

### Generated Files
| File | Purpose |
|------|---------|
| `SearchInput.tsx` | Input component |
| `SearchInput.test.tsx` | Component tests |
| `SearchService.ts` | API service |
| `SearchService.test.ts` | Service tests |

## Phase 5: Implement Feature

### Development Order
1. **Types/Models first** - Define data structures
2. **Service layer** - API calls and business logic
3. **UI components** - User interface
4. **Integration** - Wire everything together
5. **Edge cases** - Handle errors and edge cases

### Implementation Tips
- Start with happy path
- Add error handling after basic flow works
- Keep functions small and focused
- Follow existing patterns exactly

## Phase 6: Write Tests

### Test Coverage
```
/test [feature-files]

Test types:
- Unit tests: Individual functions
- Integration tests: Components with services
- E2E tests: Full user flows
```

### Test Structure
```typescript
describe('SearchService', () => {
  describe('search', () => {
    it('returns users matching query', async () => {});
    it('handles empty query', async () => {});
    it('handles no results', async () => {});
    it('handles API errors', async () => {});
  });
});
```

### Run Tests
```bash
npm test -- --watch [feature-files]
```

## Phase 7: Update Related Files

### Common Updates Needed
| File | Update |
|------|--------|
| `index.ts` | Export new modules |
| `routes.ts` | Add new routes |
| `navigation.ts` | Add menu items |
| `types/index.ts` | Export new types |

### Documentation Updates
- API documentation
- README if user-facing
- Architecture docs if significant

## Phase 8: Code Review Prep

### Self-Review Checklist
- [ ] Code follows existing patterns
- [ ] All tests pass
- [ ] Linting passes
- [ ] No console.logs or debug code
- [ ] Error handling is complete
- [ ] Types are properly defined

### Run Quality Checks
```
/analyze [feature-path]   # Check quality
/review [feature-files]   # Self-review
npm run lint              # Linting
npm test                  # All tests
```

## Phase 9: Integration Testing

### Test in Development
```bash
npm run dev
# Manually test the feature
# Check browser console for errors
# Verify all flows work
```

### Verify Integration
- [ ] Feature works end-to-end
- [ ] Existing features still work
- [ ] No regressions
- [ ] Performance is acceptable

## Quick Reference

### Commands for Adding a Feature
```
# Understand codebase
/analyze arch
/trace similar-feature

# Generate code
/create component FeatureName
/create service FeatureService
/create model FeatureModel

# Add tests
/test src/features/feature-name/

# Review
/review src/features/feature-name/
```

### Common Pitfalls
- Not matching existing patterns
- Forgetting to update exports
- Missing error handling
- Incomplete test coverage
- Not updating documentation
