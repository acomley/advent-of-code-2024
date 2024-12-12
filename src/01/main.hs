-- Day 01: Historian Hysteria

module Main (main) where

import Data.List (sort, transpose)
import qualified Data.Map as Map
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

parseInput :: T.Text -> ([Int], [Int])
parseInput input =
  let linesOfText = map T.words (T.lines input)
      numbers = map (map (read . T.unpack)) linesOfText
   in case transpose numbers of
        [array1, array2] -> (array1, array2)
        _ -> error "rows must have exactly two numbers"

main :: IO ()
main = do
  input <- TIO.getContents
  let (list1, list2) = parseInput input

  -- Part 1: Distance Score
  let distanceScore = sum (zipWith (\x y -> abs (x - y)) (sort list1) (sort list2))
  putStrLn $ "Distances Score: " ++ show distanceScore

  -- Part 2: Similarity Score
  let freq :: Map.Map Int Int
      freq = foldl (\acc x -> Map.insertWith (+) x 1 acc) Map.empty list2
  let similarityScore = sum (map (\x -> x * Map.findWithDefault 0 x freq) list1)
  putStrLn $ "Similarity score: " ++ show similarityScore
