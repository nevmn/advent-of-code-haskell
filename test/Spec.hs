import           Test.Hspec
import qualified AOC.AOC2015.Day1              as Day1
import qualified AOC.AOC2015.Day2              as Day2
import qualified AOC.AOC2015.Day3              as Day3
import qualified AOC.AOC2015.Day4              as Day4
import qualified AOC.AOC2015.Day5              as Day5

main :: IO ()
main = hspec $ do
    describe "AOC.AOC2015.Day1" $ do
        it "count last floor" $ do
            input <- readFile "./inputs/2015/Day1.txt"
            Day1.part1 input `shouldBe` 280
        it "number of first basement" $ do
            input <- readFile "./inputs/2015/Day1.txt"
            Day1.part2 input `shouldBe` 1797
    describe "AOC.AOC2015.Day2" $ do
        it "square feet of wrapping paper" $ do
            input <- readFile "./inputs/2015/Day2.txt"
            Day2.part1 (lines input) `shouldBe` 1588178
        it "feet of ribbon" $ do
            input <- readFile "./inputs/2015/Day2.txt"
            Day2.part2 (lines input) `shouldBe` 3783758
    describe "AOC.AOC2015.Day3" $ do
        it "houses with presents" $ do
            input <- readFile "./inputs/2015/Day3.txt"
            Day3.part1 input `shouldBe` 2592
        it "houses with presents with robot" $ do
            input <- readFile "./inputs/2015/Day3.txt"
            Day3.part2 input `shouldBe` 2360
    describe "AOC.AOC2015.Day4" $ do
        it "hash with 5 leading zeroes" $ do
            Day4.part1 "iwrupvqb" `shouldBe` 346386
        it "hash with 6 leading zeroes" $ do
            Day4.part2 "iwrupvqb" `shouldBe` 9958218
    describe "AOC.AOC2015.Day5" $ do
        it "how strings is nice" $ do
            input <- readFile "./inputs/2015/Day5.txt"
            Day5.part1 (lines input) `shouldBe` 258
