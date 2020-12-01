module AOC.AOC2020.Day1 where

import Data.List (find)
import Data.Maybe (mapMaybe)

part1 :: [Integer] -> Integer
part1 numbers = product $ mapMaybe findSum numbers
  where
    findSum number = find (\n -> n + number == 2020) numbers

part2 :: [Integer] -> Integer
part2 numbers = product $ head $ concatMap (\(sum, xs) -> foldl (\acc el -> if el + sum == 2020 then acc ++ [el : xs] else acc) [] numbers) (concatMap getTwoCandidats numbers)
  where
    getTwoCandidats :: Integer -> [(Integer, [Integer])]
    getTwoCandidats number = foldl (\acc el -> if el + number < 2020 then (el + number, [el, number]) : acc else acc) [] numbers
