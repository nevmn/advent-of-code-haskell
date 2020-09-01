module Main where

import           AOC.AOC2015.Day1

main :: IO ()
main = do
    putStrLn "2015"
    input <- readFile "./inputs/2015/Day1.txt"
    let res1 = show $ part1 input
    let res2 = show $ part2 input
    putStrLn "Day1"
    putStrLn $ "part1: " ++ res1 ++ " part2: " ++ res2
