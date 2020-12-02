module Main where

import qualified AOC.AOC2015.Day1              as Day1
import qualified AOC.AOC2015.Day2              as Day2
import qualified AOC.AOC2015.Day3              as Day3
import qualified AOC.AOC2015.Day4              as Day4
import qualified AOC.AOC2015.Day5              as Day5
import qualified AOC.AOC2015.Day6              as Day6

import AOC.AOC2020.Day1
import AOC.AOC2020.Day2

main :: IO ()
main = do
--    putStrLn "2015"
--    input <- readFile "./inputs/2015/Day1.txt"
--    let res1 = show $ Day1.part1 input
--    let res2 = show $ Day1.part2 input
--    putStrLn "Day1"
--    putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
--    input <- readFile "./inputs/2015/Day2.txt"
--    let res1 = show $ Day2.part1 $ lines input
--    let res2 = show $ Day2.part2 $ lines input
--    putStrLn "Day2"
--    putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
--    input <- readFile "./inputs/2015/Day3.txt"
--    let res1 = show $ Day3.part1 input
--    let res2 = show $ Day3.part2 input
--    putStrLn "Day3"
--    putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
--    putStrLn "Day4"
--    let res1 = show $ Day4.part1 "iwrupvqb"
--    let res2 = show $ Day4.part2 "iwrupvqb"
--    putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
--    input <- readFile "./inputs/2015/Day5.txt"
--    let res1 = show $ Day5.part1 $ lines input
--    let res2 = show $ Day5.part2 $ lines input
--    putStrLn "Day5"
--    putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
--    putStrLn "Day6"
--    input <- readFile "./inputs/2015/Day6.txt"
--    let (lit, bright) = Day6.solve $ lines input
--    putStrLn $ "part1: " ++ show lit ++ " part2: " ++ show bright
      putStrLn "2020"
      putStrLn "Day1"
      input <- readFile "./inputs/2020/Day1.txt"
      let res1 = show $ AOC.AOC2020.Day1.part1 $ map read $ words input
      let res2 = show $ AOC.AOC2020.Day1.part2 $ map read $ words input
      putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
      putStrLn "Day2"
      input <- readFile "./inputs/2020/Day2.txt"
      let res1 = show $ AOC.AOC2020.Day2.part1 $ lines input
      let res2 = show $ AOC.AOC2020.Day2.part2 $ lines input
      putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
