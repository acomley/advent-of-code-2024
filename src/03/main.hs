-- Day 03: Historian Hysteria

module Main (main) where

import Data.Maybe (fromJust, isJust)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Text.Regex.TDFA ((=~))

parseMaybe :: T.Text -> Maybe Int
parseMaybe text
  | T.null text = Nothing
  | otherwise = Just (read $ T.unpack text :: Int)

main :: IO ()
main = do
  input <- TIO.getContents

  let pattern = "(mul|do|don't)\\((([0-9]+)?,?([0-9]+)?)\\)"

  let instructions =
        [ (instr, parseMaybe param1, parseMaybe param2)
          | [_, instr, _, param1, param2] <- input =~ pattern :: [[T.Text]]
        ]

  -- Part 1: Uncorrupted Instructions Sum
  let uncorrupted = sum [x1 * x2 | (instr, Just x1, Just x2) <- instructions, instr == T.pack "mul"]
  putStrLn $ "Uncorrupted Instructions Sum: " ++ show uncorrupted

  -- Part 2: Active Instructions Sum
  let activeSum =
        fst $
          foldl
            ( \(sumAcc, isActive) (instr, x1, x2) ->
                case T.unpack instr of
                  "don't" -> (sumAcc, False)
                  "do" -> (sumAcc, True)
                  "mul"
                    | isActive && isJust x1 && isJust x2 -> (sumAcc + fromJust x1 * fromJust x2, isActive)
                  _ -> (sumAcc, isActive)
            )
            (0, True)
            instructions
  putStrLn $ "Active Instructions Sum: " ++ show activeSum
