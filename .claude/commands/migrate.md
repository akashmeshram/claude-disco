---
name: migrate
description: "Plan and execute migrations. Usage: /migrate [from] [to]"
---

# Migrate Command

Plan and execute code migrations.

## Usage

```
/migrate                    # Analyze migration needs
/migrate react@17 react@18  # Plan version upgrade
/migrate js ts              # Plan language migration
/migrate --check            # Check migration status
/migrate --apply            # Apply migration changes
```

## Migration Types

| Type | Examples |
|------|----------|
| Version | React 17→18, Node 16→20 |
| Language | JS→TS, Python 2→3 |
| Framework | Express→Fastify |
| Pattern | Class→Hooks, Callbacks→Async |

## Output

```
### Migration Plan: React 17 → 18

#### Impact Analysis
| Metric | Value |
|--------|-------|
| Files affected | 45 |
| Breaking changes | 3 |
| Deprecations | 7 |
| Estimated effort | Medium |

#### Breaking Changes

##### 1. Automatic Batching
**Affected:** 12 files
**Change:** State updates now batch by default
**Action:** Review setState calls in setTimeout/promises

##### 2. Strict Mode Changes
**Affected:** 8 files
**Change:** Double-invocation in development
**Action:** Ensure effects are idempotent

#### Migration Steps

- [ ] Update package.json
- [ ] Fix breaking change #1
- [ ] Fix breaking change #2
- [ ] Update deprecated APIs
- [ ] Run full test suite
- [ ] Update documentation

#### Rollback Plan
1. Revert package.json changes
2. git checkout to pre-migration commit
```

## Process

1. Analyze current state
2. Identify breaking changes
3. Create migration plan
4. Execute incrementally
5. Verify at each step
6. Document changes
