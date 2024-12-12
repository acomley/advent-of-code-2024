# Day 03: Historian Hysteria

## Setup

```bash
stack build
cat src/03/input | stack exec day03
```

## Log

Regular expressions does the heavy lifting for part 1. List compression is a nice alternative and really makes the code more readable, but takes a moment to understand the ordering. Similar to Day 03, we refactor and use tuples! The key here is making the accumulator be a tuple that stores the active state.

**Haskel Learnings**

- List Comprehension

**Questions**

- Could my earlier solutions benifit from list
- The description of `foldl` say this is rarely what you want, so I wonder what else I should be using.
