module AOC.AOC2015.Day1 where

import           Data.Maybe                     ( mapMaybe )

data Direction = Up | Down
type Floor = Int
type Step = Int

instance Enum Direction where
    fromEnum Up   = 1
    fromEnum Down = -1
    toEnum 1    = Up
    toEnum (-1) = Down

part1 :: String -> Floor
part1 = fst . last . floorWithStep . parseStr

part2 :: String -> Step
part2 =
    snd
        . head
        . dropWhile (\(floor, _) -> floor /= -1)
        . floorWithStep
        . parseStr

parseChar :: Char -> Maybe Direction
parseChar x | x == '('  = Just Up
            | x == ')'  = Just Down
            | otherwise = Nothing

parseStr :: String -> [Direction]
parseStr = mapMaybe parseChar

floorWithStep :: [Direction] -> [(Floor, Step)]
floorWithStep = scanl
    (\(floor, number) direction -> (fromEnum direction + floor, succ number))
    (0, 0)
