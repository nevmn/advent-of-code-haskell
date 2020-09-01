module AOC.AOC2015.Day2 where

import           Data.List.Split                ( splitOn )
import           Data.List                      ( sort )

data Box = Box Int Int Int deriving (Show)

part1 :: [String] -> Int
part1 = sum . map (boxPaper . parse)

part2 :: [String] -> Int
part2 = sum . map (boxRibbon . parse)

parse :: String -> Box
parse str = let (x : y : z : _) = map read $ splitOn "x" str in Box x y z

boxPaper :: Box -> Int
boxPaper (Box l w h) = sum (map (* 2) lwh) + minimum lwh
    where lwh = [l * w, l * h, w * h]

boxRibbon :: Box -> Int
boxRibbon (Box l w h) = (l * w * h) + sum (map (* 2) mins)
    where mins = take 2 $ sort [l, w, h]
