# Day 02: Red-Nosed Reports

## Setup

```bash
stack build
cat src/02/input | stack exec day02
```

## Log

**Haskel Learnings**

For part 1, the intial challenge was figuring out how to iterate and look forward in Haskell. Creating pairs using `zip` with `tail` was convenient. For part 2, there was a significant refactor required. I was stuck for a long while trying to figure out how to detect and run the revalidation correctly. I intially tried to remove by value, but that caused failures when a value was repeated. I eventually decided the report type should be a list of pairs (index, value). The various tuple types are a bit overwhelming, so I would like to improve that eventually.

**Haskel Learnings**

- Using `zip` to create pairs
- Using `zip [0 ..]` to create `(index, value)` pairs
- Using `uncurry` in place of `all (\(x1, x2) -> x1 < x2) pairs`
- Getting more used to using `.` and `$`, but still very awkward

**Questions**

- Typing of all the `(Int, Int)` variants
