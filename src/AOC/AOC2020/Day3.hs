module AOC.AOC2020.Day3 where

import qualified Data.Map.Lazy as Map

type Coords = (Int, Int)

type Forest = Map.Map Coords Bool

part1 :: [String] -> Int
part1 = traverseForest . snd . foldl (\(line, f) str -> (line + 1, parseLine str (line + 1) f)) (0, Map.empty)

parseLine :: String -> Int -> Forest -> Forest
parseLine str lineNumber forest =
  snd $
    foldl
      ( \(column, f) el ->
          insertIntoForest
            (column + 1)
            ( case el of
                '.' -> False
                '#' -> True
            )
            f
      )
      (0, forest)
      str
  where
    insertIntoForest :: Int -> Bool -> Forest -> (Int, Forest)
    insertIntoForest colNumber v f = (colNumber, Map.insert (lineNumber, colNumber) v f)

traverseForest :: Forest -> Int
traverseForest forest =
  snd $
    foldl
      ( \(colNumber, treeCount) rowNumber -> do
          let isTree = forest Map.! (rowNumber, colNumber)
          let nextColNumber = getNextColNumber colNumber
          if isTree
            then (nextColNumber, treeCount + 1)
            else (nextColNumber, treeCount)
      )
      (4, 0)
      [2 .. maxRowNumber]
  where
    maxColNumber = snd $ last $ Map.keys forest
    maxRowNumber = fst $ last $ Map.keys forest
    getNextColNumber current = if current + 3 > maxColNumber then (current + 3) - maxColNumber else current + 3
