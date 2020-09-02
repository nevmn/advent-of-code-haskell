module AOC.AOC2015.Day5 where

import           Data.List                      ( group
                                                , isInfixOf
                                                )

part1 :: [String] -> Int
part1 = length . filter isNice

isNice :: String -> Bool
isNice str = all (== True) [noBad str, threeVowels str, twice str]

threeVowels :: String -> Bool
threeVowels = (> 2) . length . filter (`elem` "aeiou")

twice :: String -> Bool
twice = any ((> 1) . length) . group

noBad :: String -> Bool
noBad str = not $ any (`isInfixOf` str) ["ab", "cd", "pq", "xy"]
