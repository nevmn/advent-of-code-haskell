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
part1 str = fst $ head $ filter (\(_, hash) -> "00000" `isPrefixOf` hash) $ map
    (\(n, secret) -> (n, show $ hashWith MD5 secret))
    secrets
  where
    secrets :: [(Int, ByteString)]
    secrets = map
        (\n -> (n, toStrict $ toLazyByteString $ stringUtf8 (str ++ show n)))
        [0 ..]
