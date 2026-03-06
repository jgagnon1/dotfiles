# AI Agent Instructions

**Purpose:** Global instructions for AI coding agents across all projects.

---

## Project Planning with Jujutsu

**Tool:** Jujutsu (`jj`)

**Philosophy:** Plan projects by creating empty commits that describe each task. Work through the commit stack sequentially, implementing each feature as you go.

### Planning Workflow

**Start a New Project Plan:**
```bash
jj new main                    # Create first planning commit
jj describe                    # Describe the first task in detail
jj commit                      # Finalize the empty commit

jj new                         # Create next planning commit
jj describe                    # Describe the second task
jj commit                      # Continue building the plan
```

**View Your Plan:**
```bash
jj log                         # View all planned tasks as a commit stack
jj log -r 'mine()'            # View only your commits
jj show <change-id>           # View detailed description of a specific task
```

**Start Working:**
```bash
jj edit <change-id>           # Check out the commit you want to implement
# Make your changes to implement the feature
jj describe                    # Update description if needed
jj log                         # Find the next commit to work on
```

**Reorganise Plans:**
```bash
jj rebase -s <source> -d <dest>    # Reorder tasks in your plan
jj squash                           # Combine related tasks
jj split                            # Split a task into smaller pieces
```

### Planning Best Practices

**Create Descriptive Empty Commits:**
- Each commit description should be a concise one-liner (not a paragraph)
- Use clear, actionable language describing what needs to be done
- Keep descriptions under ~80 characters when possible
- Additional details (acceptance criteria, dependencies) can go in commit body if needed

**Example Planning Session:**
```bash
# Plan a new authentication feature
jj new main
jj describe -m "Create POST /api/register endpoint with email/password validation"
jj new
jj describe -m "Add POST /api/login endpoint with JWT token generation"
jj new
jj describe -m "Implement JWT authentication middleware for protected routes"
jj new
jj describe -m "Add unit tests for registration and login endpoints"
jj new
jj describe -m "Add integration tests for authentication flow"

# View the plan
jj log
```

**Work Through Your Plan:**
```bash
jj log                        # Review the plan
jj edit <first-task>         # Start with first task
# Implement the feature
jj new                        # Move to next task
jj edit <second-task>        # Work on second task
# Continue through the stack

---

## Interaction Protocols

### Complexity Detection

**When to Ask for Confirmation:**
- Solution requires fighting framework conventions
- Meta-programming becomes necessary
- Writing code without corresponding issues
- Multiple approaches exist with unclear best choice

**Required Action:**
- Stop work
- Summarize current progress
- Present options with trade-offs
- Wait for user decision

### Escalation Triggers

**Indicators of Overly Complex Solution:**
- Working against framework patterns
- Creating abstraction layers to avoid fixing root cause
- Generating significant code without issue tracking
- Rewriting instead of modifying existing code

**Response:** Request confirmation before proceeding.

---

## Code Modification Rules

### Change Scope

**CRITICAL RULE:** Only make changes directly related to assigned task.

**For Unrelated Issues:**
1. Do NOT fix immediately
2. Create new planning commit with `jj new && jj describe`
3. Continue with assigned task

### Rewrite Prohibition

**FORBIDDEN:** Throwing away existing implementation and rewriting from scratch.

**Required Process:**
1. STOP before rewriting
2. Request explicit permission from user
3. Explain why rewrite is necessary
4. Wait for approval

**Exception:** User explicitly requests rewrite.

### Comment Management

**NEVER:**
- Remove comments unless provably false
- Comment out code (delete instead)
- Leave commented code in place
- Add temporal context ("after refactor", "new version")
- Reference recent changes in comments

**ALWAYS:**
- Preserve existing comments
- Make comments evergreen (describe current state)
- Keep comments relevant to file context

### Code Style

**Primary Concern:** Consistency within existing file.

**Rule:** Match surrounding code style even if it differs from standard guides.

**Priority Order:**
1. Consistency with existing file
2. Readability and maintainability
3. Performance
4. Conciseness

---

### Quality Mindset

**When encountering tool failures:**
- Treat as learning opportunity
- Research specific error
- Explain what was learned
- Build tool competence

**Remember:** Quality tools are guardrails (helpful), not barriers (blocking).

---

## Testing Requirements

### Test Coverage Policy

**MANDATORY:** All projects require all test types.

**Required Test Types:**
1. Unit tests
2. Integration tests
3. End-to-end tests

**No Exceptions:** Project size and complexity are NOT valid reasons to skip tests.

### Test Exemption Process

**Only Valid Authorization:**

User states exactly: "I AUTHORIZE YOU TO SKIP WRITING TESTS THIS TIME"

**No other phrasing grants permission to skip tests.**

### Test Implementation Rules

**Requirements:**
- Tests MUST cover implemented functionality
- Test output MUST be pristine to pass
- NEVER ignore test output or logs
- NEVER disable tests (ie; add @Disabled annotations)
- Capture and test expected errors

**Critical:** Logs and test messages contain essential information. Read them.

### Kotlin-specific

- Tests MUST Use Junit5 Runner
- Tests MUST Use Kotest assertions

---

## Quick Reference

### Before Starting Work
```bash
jj log                        # Review planned work
jj log -r 'mine()'           # View only your commits
jj edit <change-id>          # Start working on a specific task
```

### Planning New Work
```bash
jj new main                   # Create planning commit
jj describe -m "Concise one-line description of the task"
jj new                        # Create next planning commit (no need for jj commit)
```

### During Work
- Only modify code related to current task
- Create new planning commits for discovered problems
- Never bypass pre-commit hooks
- Match existing code style
- Use `jj st` to see current changes
- Use `jj describe` to update commit messages

### Moving Between Tasks
```bash
jj new                        # Move to next task
jj edit <change-id>          # Work on specific commit
jj log                        # View commit stack
```

### Managing Your Stack
```bash
jj rebase -s <commit> -d <new-parent>    # Reorder commits
jj squash                                 # Combine with parent
jj split                                  # Split into smaller commits
```

- When rebasing onto remote, use `jj git fetch && jj rebase -d master --remote origin` (not `-d master`)

### Creating Pull Requests
```bash
# Single PR
jj bookmark create feature-name
jj git push --bookmark feature-name

# PR Stack
jj bookmark create part-1 -r <change-id-1>
jj bookmark create part-2 -r <change-id-2>
jj git push --bookmark part-1
jj git push --bookmark part-2
```

### When Uncertain
- Ask user for clarification
- Summarise work so far
- Present options with trade-offs
- Wait for decision

### Pull Request Guidelines
- When making a pull request, do not mark any to-dos as complete. These to-dos could be left to the PR creator.
- Pull request title should follow the angular commit convention (feat, fix, style, build, refactor, ci, test, perf, chore, revert, docs) and include the ticket number (ie: feat(calc-XXXX): description)
- Always open pull requests in the draft page. Do not open pull requests as ready for review.
- When writing markdown ordered lists use 1 for every entry so that it is easier to edit the order of the items
- Use PR stacks to break large features into reviewable pieces
- Each commit in a stack should be independently reviewable
- When creating pull request with `gh pr` command always include `--head` and `--base` argument since we are working with `jj`

