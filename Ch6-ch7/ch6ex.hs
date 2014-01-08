{-# LANGUAGE NPlusKPatterns #-}
module Ch6examp where
-- ghci -XNPlusKPatterns
import Data.List 
import GHC.Base
import GHC.Char
-- order evaluation doesn't matter in Pure FP.
-- 6.1 -- 
factorial n             = product(take n [1..n])
f2ctorial n             = product(genericTake n [1..n])

fact4rial 0		= 1
fact4rial (n + 1)       = (n + 1) * factorial n              

pr4duct :: [Integer] -> Integer
pr4duct [] 		= 1
pr4duct	(x:xs) 		= x * (pr4duct xs) 
 

