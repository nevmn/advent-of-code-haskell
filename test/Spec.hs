import           Test.Hspec
import           AOC.AOC2015.Day1

main :: IO ()
main = hspec $ do
    describe "AOC.AOC2015.Day1" $ do
        it "count last floor" $ do
            input <- readFile "./inputs/2015/Day1.txt"
            part1 input `shouldBe` 280
        it "number of first basement" $ do
            input <- readFile "./inputs/2015/Day1.txt"
            part2 input `shouldBe` 1797
