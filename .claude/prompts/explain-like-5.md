---
name: explain-like-5
description: "Explain complex concepts simply"
---

# Explain Like I'm 5

Use this prompt mode to get simple explanations of complex topics.

## How to Use

```
/prompt explain-like-5

Then ask about any concept:
"What is dependency injection?"
"How does async/await work?"
"What is a race condition?"
```

## Guidelines

When explaining:

### Use Analogies
```
"Dependency injection is like a restaurant.
Instead of the chef going to the store (creating dependencies),
the ingredients are delivered to the kitchen (injected).
The chef just cooks (does its job)."
```

### Avoid Jargon
```
// Instead of:
"It's an abstraction over async I/O using coroutines"

// Say:
"It's a way to do multiple things at once, like
cooking dinner while the laundry runs"
```

### Use Concrete Examples
```
// Instead of:
"State management handles application state"

// Say:
"Imagine a whiteboard everyone can see.
When someone changes it, everyone sees the change.
That's what state management does for your app."
```

### Build Up Gradually
```
Level 1: "A database stores information"
Level 2: "...organized in tables like spreadsheets"
Level 3: "...that you can search and filter quickly"
Level 4: "...even with millions of rows"
```

## Response Format

```
## Simple Explanation
[2-3 sentences a child could understand]

## Analogy
[Real-world comparison]

## Why It Matters
[One sentence on why developers use this]

## Want to Go Deeper?
[Offer to explain more technical details]
```

## Example

**Question**: "What is caching?"

**Response**:
## Simple Explanation
Caching is like keeping your favorite snacks on your desk
instead of walking to the kitchen every time you're hungry.
It's faster to grab what's nearby!

## Analogy
Your desk = the cache (fast, close, limited space)
Kitchen = the database (has everything, but takes time to get there)

## Why It Matters
Websites use caching so pages load instantly instead of
waiting for the server every time.

## Want to Go Deeper?
I can explain cache invalidation, cache strategies (LRU, TTL),
or when NOT to use caching.

## Cognitive Psychology Behind This Approach

### Why Simple Explanations Work

Learning research shows:
- **Dual coding**: Words + mental images = better retention
- **Elaborative interrogation**: "Why?" questions deepen understanding
- **Prior knowledge activation**: Analogies connect new to known

### The Curse of Knowledge

Experts often explain badly because they:
- Forget what it's like not to know
- Use jargon automatically
- Skip "obvious" steps

This prompt counters by:
- Forcing analogies (connects to prior knowledge)
- Banning jargon (forces clear thinking)
- Building up gradually (no skipped steps)

### Feynman Technique

Named after physicist Richard Feynman:
1. Choose concept
2. Explain to a child
3. Identify gaps in your explanation
4. Simplify and use analogies

If you can't explain it simply, you don't understand it deeply.

## When Simple Isn't Enough

After the simple explanation, offer:
- **Level 2**: More technical details
- **Level 3**: Edge cases and gotchas
- **Level 4**: Implementation details

Let the learner control the depth.
