module AOC.AOC2015.Day4 where

import           Crypto.Hash
import           Data.ByteString                ( ByteString
                                                , unpack
                                                )
import           Data.ByteString.Lazy           ( toStrict )
import           Data.ByteString.Builder        ( stringUtf8
                                                , toLazyByteString
                                                )
import           Data.List                      ( isPrefixOf )

part1 :: String -> Int
part1 =
    fst
        . head
        . filter (\(_, hash) -> findHash hash 5)
        . map (\(n, secret) -> (n, show $ hashWith MD5 secret))
        . secrets

part2 :: String -> Int
part2 =
    fst
        . head
        . filter (\(_, hash) -> findHash hash 6)
        . map (\(n, secret) -> (n, show $ hashWith MD5 secret))
        . secrets

secrets :: String -> [(Int, ByteString)]
secrets str = map
    (\n -> (n, toStrict $ toLazyByteString $ stringUtf8 (str ++ show n)))
    [0 ..]

findHash :: String -> Int -> Bool
findHash hash num = str `isPrefixOf` hash where str = replicate num '0'
