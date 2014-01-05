module Morphemes where

import Control.Monad
import qualified Data.Map as M
import Data.List (foldl', sortBy)
import Data.Ord (comparing)

suffixes :: [a] -> [[a]]
suffixes = scanr (:) []

prefixes :: [a] -> [[a]]
prefixes = map reverse . scanl (flip (:)) []

sublists :: [a] -> [[a]]
sublists = filter (not . null) . (suffixes >=> prefixes)

frequencies :: Ord k => [k] -> M.Map k Int
frequencies = foldl' (\m k -> M.insertWith (+) k 1 m) M.empty

weightFunc :: Int -> Int -> ([a], Int) -> Int
weightFunc wLen wFreq (xs, freq) = (wLen * length xs) + (wFreq * freq)

weightFrequencies :: Int -> Int -> [([a], Int)] -> [([a], Int)]
weightFrequencies wLen wFreq = sortBy (flip . comparing $ weightFunc wLen wFreq)
