module AOC.AOC2015.Day6 where

import           Data.Maybe                     ( isJust
                                                , mapMaybe
                                                )
import           Data.List                      ( find
                                                , isPrefixOf
                                                )
import           Text.Read                      ( readMaybe )
import qualified Data.Map.Strict               as M
                                                ( Map
                                                , fromList
                                                , toList
                                                , update
                                                , filter
                                                , map
                                                , size
                                                , foldl
                                                )

type Coord = (Int, Int)
type State = (Bool, Int)
type Light = (Coord, State)
type Lights = M.Map Coord State
data Action = TurnOn | TurnOff | Toggle

inits :: Lights
inits = M.fromList $ zip (toCoords "0,0 999,999") (repeat (False, 0))

solve :: [String] -> (Int, Int)
solve inputs =
    M.foldl
            (\(lit, bright) state ->
                (if fst state then lit + 1 else lit, bright + snd state)
            )
            (0, 0)
        $ foldl
              (\i (action, coords) ->
                  foldl (\ls coord -> runAction action coord ls) i coords
              )
              inits
              actions
    where actions = zip (mapMaybe toAction inputs) (map toCoords inputs)

runAction :: Action -> Coord -> Lights -> Lights
runAction TurnOn (x, y) =
    M.update (\(_, bright) -> Just (True, bright + 1)) (x, y)
runAction TurnOff (x, y) =
    M.update (\(_, bright) -> Just (False, if bright == 0 then 0 else bright - 1)) (x, y)
runAction Toggle (x, y) =
    M.update (\(lit, bright) -> Just (not lit, bright + 2)) (x, y)

toAction :: String -> Maybe Action
toAction str | "turn on " `isPrefixOf` str  = Just TurnOn
             | "turn off " `isPrefixOf` str = Just TurnOff
             | "toggle " `isPrefixOf` str   = Just Toggle
             | otherwise                    = Nothing

toCoords :: String -> [Coord]
toCoords str =
    let [x, y, x', y'] = mapMaybe readMaybe $ words $ map commaToSpace str
    in  [ (a, b) | a <- [x .. x'], b <- [y .. y'] ]
  where
    commaToSpace :: Char -> Char
    commaToSpace c = if c == ',' then ' ' else c
