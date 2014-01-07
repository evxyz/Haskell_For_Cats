{-# LANGUAGE NPlusKPatterns #-}
module Ch6examp where
-- ghci -XNPlusKPatterns
-- order evaluation doesn't matter in Pure FP.
import Data.List 

-- where does factorial Int break? 
factorial n             = product(take n [1..n])
f2ctorial n             = product(genericTake n [1..n])

pr4duct :: [Integer] -> Integer
pr4duct [] 		= 1
pr4duct	(x:xs) 		= x * (pr4duct xs) 
 

