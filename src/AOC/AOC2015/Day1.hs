module AOC.AOC2015.Day1 where

part1 :: String -> Int
part1 = fst . last . floorWithStep

part2 :: String -> Int
part2 =
    snd . head . dropWhile (\(floor, number) -> floor /= -1) . floorWithStep

floorWithStep :: String -> [(Int, Int)]
floorWithStep = scanl
    (\(floor, number) direction -> case direction of
        '(' -> (succ floor, succ number)
        ')' -> (pred floor, succ number)
        _   -> (floor, number)
    )
    (0, 0)

