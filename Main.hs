module Main where

import Morphemes
import System.Environment (getArgs)
import Control.Applicative
import Control.Monad
import Data.List (intersperse)
import qualified Data.Map as M

main :: IO ()
main = do
  wLen : wFreq : filenames <- getArgs
  wordlist <- words <$> readInput filenames
  mapM_ print $ morph (read wLen) (read wFreq) wordlist

readInput :: [FilePath] -> IO String
readInput filenames = case filenames of
  [] -> getContents
  _  -> mapM readFile filenames >>= return . intersperse " " >>= return . join

morph :: Int -> Int -> [String] -> [(String, Int)]
morph wLen wFreq wordlist = weightFrequencies wLen wFreq . M.toList
                          $ frequencies (wordlist >>= suffixes >>= prefixes)
