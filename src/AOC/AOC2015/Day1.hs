module AOC.AOC2015.Day1 where

part1 :: String -> Int
part1 = foldl
    (\floor direction -> case direction of
        '(' -> succ floor
        ')' -> pred floor
        _   -> floor
    )
    0

part2 :: String -> Int
part2 = snd . head . dropWhile (\(floor, number) -> floor /= -1) . scanl
    (\(floor, number) direction -> case direction of
        '(' -> (succ floor, succ number)
        ')' -> (pred floor, succ number)
        _   -> (floor, number)
    )
    (0, 0)
