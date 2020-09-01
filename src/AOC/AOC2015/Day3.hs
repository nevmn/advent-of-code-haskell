module AOC.AOC2015.Day3 where

import           Prelude                 hiding ( Either(..) )
import           Data.Maybe                     ( mapMaybe )
import qualified Data.Map.Lazy                 as Map
                                                ( Map
                                                , singleton
                                                , insertWith
                                                , union
                                                )

data Direction = Up | Down | Left | Right deriving Show
type Cell = (Int, Int)
type Path = Map.Map Cell Int

path :: Path
path = Map.singleton (0, 0) 1

part1 :: String -> Int
part1 = length . runDirections . mapMaybe toDirection

part2 :: String -> Int
part2 str = length unionPath
  where
    dirs      = mapMaybe toDirection str
    unionPath = Map.union (runDirections $ santaDirections dirs)
                          (runDirections $ robotDirections dirs)

toDirection :: Char -> Maybe Direction
toDirection x | x == '^'  = Just Up
              | x == 'v'  = Just Down
              | x == '<'  = Just Left
              | x == '>'  = Just Right
              | otherwise = Nothing

runDirections :: [Direction] -> Path
runDirections = snd . foldl
    (\((x, y), p) direction -> case direction of
        Up    -> insert (x, succ y) p
        Down  -> insert (x, pred y) p
        Left  -> insert (pred x, y) p
        Right -> insert (succ x, y) p
    )
    ((0, 0), path)
  where
    insert :: Cell -> Path -> (Cell, Path)
    insert cell path = (cell, Map.insertWith (+) cell 1 path)

santaDirections :: [Direction] -> [Direction]
santaDirections []           = []
santaDirections [x]          = [x]
santaDirections [x, y]       = [x]
santaDirections (x : y : xs) = x : santaDirections xs

robotDirections :: [Direction] -> [Direction]
robotDirections []           = []
robotDirections [x]          = []
robotDirections [x, y]       = [y]
robotDirections (x : y : xs) = y : robotDirections xs
