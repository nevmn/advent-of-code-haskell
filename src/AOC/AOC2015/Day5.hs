module AOC.AOC2015.Day5 where

import           Data.List                      ( group
                                                , isInfixOf
                                                , isPrefixOf
                                                )

part1 :: [String] -> Int
part1 = length . filter isNice

part2 :: [String] -> Int
part2 = length . filter isNice2

isNice :: String -> Bool
isNice str = all (== True) [noBad str, threeVowels str, doubles str]

isNice2 :: String -> Bool
isNice2 str = all (== True) [twice str, middle str]

threeVowels :: String -> Bool
threeVowels = (> 2) . length . filter (`elem` "aeiou")

doubles :: String -> Bool
doubles = any ((> 1) . length) . group

noBad :: String -> Bool
noBad str = not $ any (`isInfixOf` str) ["ab", "cd", "pq", "xy"]

groupByTwo :: String -> [String]
groupByTwo []           = []
groupByTwo [x]          = []
groupByTwo [x, y]       = [[x, y]]
groupByTwo (x : y : xs) = [x, y] : groupByTwo (y : xs)

groupByThree :: String -> [String]
groupByThree []               = []
groupByThree [x]              = []
groupByThree [x, y]           = []
groupByThree s@[x, y, z]      = [s]
groupByThree (x : y : z : xs) = [x, y, z] : groupByThree (y : z : xs)

twice :: String -> Bool
twice input = (> 0) $ snd $ foldr checkTwo ([], 0) $ groupByTwo input
  where
    triples = filter ((> 2) . length) $ group input

    noOverlaps :: String -> Bool
    noOverlaps x = not $ any (x `isPrefixOf`) triples

    checkTwo :: String -> ([String], Int) -> ([String], Int)
    checkTwo x (xs, count) | x `elem` xs && noOverlaps x = (xs, count + 1)
                           | otherwise                   = (x : xs, count)

middle :: String -> Bool
middle = any (\[x, y, z] -> x == z) . groupByThree
