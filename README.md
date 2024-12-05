# Advent of Code 2024

https://adventofcode.com

## Haskell

I have not used Haskell since writing a sudoku solver for a college project circa 2005. Early during my professional career, LINQ was released for C#, which was my primary server language during my time as a game programmer. I now primarily use Typescript/Javascript/Node, which has some functional mechanisms, but let's do a functional programming language challenge!

## Log

### Day 1: Historian Hysteria

The first part of the challenge is two parse the inputs. We are given two lists, but in columnar format. `transpose` handles the transforming of the line inputs into the proper lists. After this it is easy to chain the various functions to get the sum of the distances. For similarity score, I use `foldl` with a Map as the accumulator to determine the frequency counts, then just sum the mapping of list1 multiplied with the frequency.

**Haskel Learnings**

- Composite functions (`read . T.unpack`)
- Nested maps
- transpose
- zip

**Questions**

- In other languages, I would use the sorted lists with two cursors for part 2. Is there a better way to handle this in Haskell without creating the Map.
