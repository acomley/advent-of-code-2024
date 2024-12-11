# Advent of Code 2024

https://adventofcode.com

## Haskell

I have not used Haskell since writing a sudoku solver for a college project circa 2005. Early during my professional career, LINQ was released for C#, which was my primary server language during my time as a game programmer. I now primarily use Typescript/Javascript/Node, which has some functional mechanisms, but let's do a functional programming language challenge!

## Log

### Day 1: Historian Hysteria

```bash
stack build
cat data/01/input | stack exec day01
```

The first part of the challenge is two parse the inputs. We are given two lists, but in columnar format. `transpose` handles the transforming of the line inputs into the proper lists. After this it is easy to chain the various functions to get the sum of the distances. For similarity score, I use `foldl` with a Map as the accumulator to determine the frequency counts, then just sum the mapping of list1 multiplied with the frequency.

**Haskel Learnings**

- Composite functions (`read . T.unpack`)
- Nested maps
- transpose
- zip

**Questions**

- In other languages, I would use the sorted lists with two cursors for part 2. Is there a better way to handle this in Haskell without creating the Map.

### Day 2: Red-Nosed Reports

**Haskel Learnings**

For part 1, the intial challenge was figuring out how to iterate and look forward in Haskell. Creating pairs using `zip` with `tail` was convenient. For part 2, there was a significant refactor required. I was stuck for a long while trying to figure out how to detect and run the revalidation correctly. I intially tried to remove by value, but that caused failures when a value was repeated. I eventually decided the report type should be a list of pairs (index, value). The various tuple types are a bit overwhelming, so I would like to improve that eventually.

**Haskel Learnings**

- Using `zip` to create pairs
- Using `zip [0 ..]` to create `(index, value)` pairs
- Using `uncurry` in place of `all (\(x1, x2) -> x1 < x2) pairs`
- Getting more used to using `.` and `$`, but still very awkward

**Questions**

- Typing of all the `(Int, Int)` variants
