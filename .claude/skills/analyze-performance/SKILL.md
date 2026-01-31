---
name: analyze-performance
description: "Identify performance bottlenecks through static analysis. Use when reviewing code for scalability, investigating slowness, or preparing for production."
---

# Analyze Performance

Identify bottlenecks using the `performance-analyzer` agent—no benchmarks required.

## What It Finds

1. **Algorithmic Complexity** - O(n²) loops, inefficient searches
2. **Blocking I/O** - N+1 queries, sync calls in async contexts
3. **Serialization Overhead** - Repeated parsing, unnecessary cloning
4. **Scale-Breaking Assumptions** - Code that won't survive increased load

## When to Use

- "Why is this slow?"
- "Will this scale to 10K users?"
- "Review this code before production"
- "Find N+1 queries"

## Common Patterns Detected

```python
# N+1 Query
for item in items:
    fetch_related(item.id)  # Query per iteration

# Nested Loop O(n²)
for a in list_a:
    for b in list_b:
        compare(a, b)

# Blocking in Async
async def handler():
    requests.get(url)  # Blocks event loop
```

## Output

```
### Critical Hotspots
| Location | Pattern | Complexity | Impact | Fix |

### Load-Sensitive Paths
| Path | Scaling Factor | Breaking Point | Symptoms |

### Scale-Breaking Assumptions
| Assumption | Current Safety | Failure Scenario | Risk |
```

## Agent

Use `subagent_type: performance-analyzer`
