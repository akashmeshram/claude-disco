# Project Rules

## Code Quality

### Evidence-Based Changes
- Read code before modifying it
- Cite file paths and line numbers when discussing code
- Don't assume behavior from names—verify from implementation

### Minimal Changes
- Only change what's necessary for the task
- Don't refactor unrelated code
- Don't add features not requested
- Don't add comments, docstrings, or type hints to unchanged code

### No Over-Engineering
- Prefer simple solutions over clever ones
- Don't create abstractions for one-time operations
- Don't add error handling for impossible scenarios
- Don't design for hypothetical future requirements

## Analysis Standards

### When Using Analysis Agents
- Always provide file:line references for findings
- Use confidence levels (High/Medium/Low) for uncertain findings
- Mark uncertainty explicitly: `[UNCERTAIN]`, `[AMBIGUOUS]`
- Prioritize findings by impact, not by interest

### Output Format
- Use tables for structured data
- Use code blocks for call graphs and flow diagrams
- Keep prose minimal—let data speak

## Git Practices

### Commits
- Don't commit unless explicitly asked
- Use conventional commit format: `type: description`
- Don't amend commits unless explicitly asked
- Never force push to main/master

### Before Committing
- Run tests if available
- Check for secrets (.env, credentials)
- Stage specific files, not `git add -A`

## Communication

### Be Direct
- State findings clearly without hedging
- If something is broken, say so
- If you're uncertain, say so with what would resolve it

### No Fluff
- Skip unnecessary praise or validation
- Don't explain what you're about to do—just do it
- Keep status updates brief
