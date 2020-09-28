{-# LANGUAGE TypeSynonymInstances #-}
module AOC.AOC2019.Day1 where

type Mass = Int
type Fuel = Int
newtype Module = Module {getMass::Mass}

class Fuelable a where
    getFuel :: a -> Int

instance Fuelable Module where
    getFuel Module { getMass = a } = (a `div` 3) - 2

instance Fuelable Fuel where
    getFuel f =
        let fuel = getFuel (Module f)
        in  if fuel > 0 then fuel + getFuel fuel else 0

part1 :: String -> Int
part1 = sum . map (getFuel . Module . read) . lines

part2 :: String -> Int
part2 = sum . map (getFuel . getFuel . Module . read) . lines

