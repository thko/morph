module Main where

import Morphemes
import System.Environment (getArgs)
import System.Exit
import Control.Applicative
import Control.Monad
import Data.List (intersperse)

main :: IO ()
main = do
  wLen : wFreq : filenames <- getArgs
  wordlist <- words <$> readInput filenames
  mapM_ putStrLn wordlist

readInput :: [FilePath] -> IO String
readInput filenames = case filenames of
  [] -> getContents
  _  -> mapM readFile filenames >>= return . intersperse " " >>= return . join
