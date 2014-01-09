module Hugs5 where
import Language.Haskell.Extension
-- 5.7.1 -- 
sumTo100Sq = [sum[x^2] | x <- [1..100]]

-- 5.7.2 -- 
-- [True, True, True ] --
-- l2ngth :: Num a => [t] -> a 
-- l2ngth xs = sum[1|_<-xs]
--repLica x = [(x:[])|x <- repeat x ] 
repliKate n x = [x|_ <- [1..n]] 
 
{- 5.7.3 -- 
pyths 10
[(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10)]
-}
--- pYths a  = [x|x .......
pYths n           = [(x,y,z)|   x <- [1..n],
                               y <- [1..n],
                               z <- [1..n],
                               x ^ 2 + y^2 == z^2]
 
 {- 5.7.4 -- 
 A positive integer is perfect 

 For example:
 > perfects 500 [6, 28, 496]
 -} 

perfects n = [x|x <- [1..n], sum (init(factors x)) == x]
 {- 5.7.5 -- 
 Show how the single comprehension 
 [(x,y) | x -> [1,2,3],y -> [4,5,6]] 

 and nest one comprehension within the other.
 -}
 
--- 5.7.6. Redefine the function positions using the function find.

{- 5.7.7. The scalar product of two lists of integers xs and ys of length n is given by the sum of the products of corresponding integers:
-- concat [[(x,y) | y <- [4,5,6]]|x <- [1,2,3]]
-- [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)]
 
-n-1
-- 5.7.6. Redefine the function positions using the function find.-}
pos3tions x xs = find x (zip xs [0..n]) 
                   where n = length xs -1 
 
{- 5.7.7. The scalar product of two lists of integers xs and ys of length n is given by the sum of the products of corresponding integers:
 In a similar manner to the function chisqr , show how a list comprehension
 can be used to define a function scalarproduct :: [ Int ] ? [ Int ] ? Int that
 returns the scalar product of two lists. For example:

 > scalarproduct [1, 2, 3] [4, 5, 6]
 32
 -}
scalasrproduct xs ys = sum [x * y | (x,y) <- zip xs ys] 


 -- 5.7.8. Modify the Caesar cipher program to also handle upper-case letters
 
--- import GHC.Tuple
--- import GHC.Types
--- import Data.Text
--- import GHC.IP
--- import GHC.Exts
--- import GHC.Stack
--- import GHC.Stats
--- import GHC.TypeLits
--- import System.Random
shift                       :: Int -> Char -> Char 
shift  n c | isLower c     = int2low ((low2int c + n) `mod`26)
           | isUpper c     = int2upp ((upp2int c + n) `mod`26)
           | otherwise     = c 

freqs                       :: String -> [Float] 
freqs   xs                  = [percent (count x xs') n | x <- ['a'..'z']]
                               where 
                                   xs' = map toLower xs 
                                   n   = letters xs 
low2int                     :: Char -> Int 
low2int c                   =  ord c - ord 'a' 

int2low                     :: Int -> Char 
int2low                     = chr (ord 'a' + n)

upp2int                     :: Char -> Int 
upp2int c                   =  ord c - ord 'A'

int2upp                     :: Int -> Char
int2upp n                   = chr (ord 'A' + n) 
 
letters                     :: String -> Int 
letters xs                  = length [x|x <- xs, isAlpha x] 
