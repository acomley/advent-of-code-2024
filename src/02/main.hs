-- Day 02: Red-Nosed Reports

module Main (main) where

import Data.List (find, nub)
import Data.Maybe (catMaybes, isNothing)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

parseInput :: T.Text -> [[Int]]
parseInput = map (map (read . T.unpack) . T.words) . T.lines

combineFailures :: [Maybe ((Int, Int), (Int, Int))] -> [Int]
combineFailures pairs = nub $ concatMap (\((x1, _), (x2, _)) -> [x1, x2]) (catMaybes pairs)

runReport :: [(Int, Int)] -> ([(Int, Int)], [Int])
runReport report =
  let pairs = zip report (tail report)
      ascFailure = find (\((_, x1), (_, x2)) -> x1 > x2) pairs
      descFailure = find (\((_, x1), (_, x2)) -> x1 < x2) pairs
      rangeFailure = find (\((_, x1), (_, x2)) -> abs (x1 - x2) < 1 || abs (x1 - x2) > 3) pairs
      potentialRemovals =
        if (isNothing ascFailure || isNothing descFailure) && isNothing rangeFailure
          then []
          else combineFailures [ascFailure, descFailure, rangeFailure]
   in (report, potentialRemovals)

revalidateReport :: [(Int, Int)] -> [Int] -> Bool
revalidateReport report =
  any
    ( \index ->
        let filteredReport = filter (\(i, _) -> i /= index) report
         in null $ snd $ runReport filteredReport
    )

main :: IO ()
main = do
  input <- TIO.getContents
  let parsedInputs = parseInput input

  let reports = map (zip [0 ..]) parsedInputs

  let runs = map runReport reports

  -- Part 1: Valid Reports
  let strictSafeReports = length $ filter (null . snd) runs
  putStrLn $ "Strict Safe Reports: " ++ show strictSafeReports

  -- Part 2: Reprocess reports
  let revalidatedReports = filter (not . null . snd) runs
  let safeDampenerReports = length $ filter id $ map (uncurry revalidateReport) revalidatedReports

  putStrLn $ "Safe Reports: " ++ show (strictSafeReports + safeDampenerReports)
