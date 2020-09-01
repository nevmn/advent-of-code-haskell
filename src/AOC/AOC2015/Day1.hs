module AOC.AOC2015.Day1 where

import           Data.Maybe                     ( mapMaybe )

part1 :: String -> Int
part1 = fst . last . floorWithStep . parseStr

part2 :: String -> Int
part2 =
    snd
        . head
        . dropWhile (\(floor, number) -> floor /= -1)
        . floorWithStep
        . parseStr

parseChar :: Char -> Maybe (Int -> Int)
parseChar x | x == '('  = Just (\n -> n + 1)
            | x == ')'  = Just (\n -> n - 1)
            | otherwise = Nothing

parseStr :: String -> [Int -> Int]
parseStr = mapMaybe parseChar

floorWithStep :: [Int -> Int] -> [(Int, Int)]
floorWithStep =
    scanl (\(floor, number) direction -> (direction floor, succ number)) (0, 0)

