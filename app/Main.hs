module Main where

import qualified AOC.AOC2015.Day1              as Day1
import qualified AOC.AOC2015.Day2              as Day2
import qualified AOC.AOC2015.Day3              as Day3

main :: IO ()
main = do
    putStrLn "2015"
    input <- readFile "./inputs/2015/Day1.txt"
    let res1 = show $ Day1.part1 input
    let res2 = show $ Day1.part2 input
    putStrLn "Day1"
    putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
    input <- readFile "./inputs/2015/Day2.txt"
    let res1 = show $ Day2.part1 $ lines input
    let res2 = show $ Day2.part2 $ lines input
    putStrLn "Day2"
    putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
    input <- readFile "./inputs/2015/Day3.txt"
    let res1 = show $ Day3.part1 input
    let res1 = show $ Day3.part2 input
    putStrLn "Day3"
    putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
