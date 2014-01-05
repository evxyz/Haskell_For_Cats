module Ch5examp2 where 
import GHC.Base
import GHC.Char

-- found the above imports to be somewhat necessary to get examples to work


{- 5.1 -- list comp, generators 
Prelude> [(x,y) | x <- [1..3], y <- [x..3]]
[(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]

Prelude> [x^2|x<-[1..5]]
[1,4,9,16,25]
-------------------------------}
conc1t xss = [x|xs<-xss,x<-xs]


firsts :: [(t, t1)] -> [t]
firsts ps = [x|(x,_)<- ps]

l2ngth :: Num a => [t] -> a 
l2ngth xs = sum[1|_<-xs] --  "_<-xs" simply serves as a ones generator, here.

{-- 5.2 -- Guards
 List comprehensions can also use logical expressions called guards to filter the values produced by earlier generators. If a guard is True, then the current values are retained, and, if it is False, then they are discarded.

Prelude> [x | x <- [1..10], even x ]
[2,4,6,8,10]
------------------------------------}
factors n = [x|x <- [1..n],n`mod`x==0]

prime n = factors n == [1,n]

-- a number such as 15 is not prime does not require the function prime to produce all of its factors, because under lazy evaluation the result False is returned as soon as any factor other than one or the number itself is produced, which for this example is given by the factor 3.

primes :: Integral t => t -> [t]
primes n = [x | x <- [2..n],prime x] -- “sieve of Eratosthenes” is more efficient
 
find :: Eq a => a -> [(a, t)] -> [t]
find k t = [v|(k',v)<- t,k==k'] 
pairs xs = zip xs (tail xs)
sorted xs = and [x<=y|(x,y)<-pairs xs]

positions x xs = [i|(x',i)<- zip xs[0..n],x==x']
                    where n = l2ngth xs + (-1)

-- *CH5Examp> positions False [True,False,True,False]
-- [1,3]

dada0 = "`1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./~!@#$%^&*()_+QWERTYUIOP{}|ASDFGHJKL:ZXCVBNM<>?"
-- zip [1..] dada0

-- *CH5Examp> l2ngth dada0
-- 92
isAlphaNum c= isAlpha c || isDigit c
isDigit c= c >= '0'&& c <= '9'
isLower c = c >= 'a'&& c <= 'z' 
isAlpha c = isLower c || isUpper c
isUpper c= c >= 'A'||c<='Z'
isSpace c= elem c "\t\n"


lowers xs =l2ngth[x | x <- xs, isLower x] 

c4unt x xs = l2ngth[x'|x'<-xs,x==x']

-- 5.5 Caesar cipher -- 
let2int c = ord c - ord 'a'
int2let n = chr (ord 'a' + n)

shift n c   | isLower c = int2let((let2int c + n) `mod`26) 
            | otherwise = c

encode n xs = [shift n x | x <- xs]


-- *Ch5examp2> encode 3 "haskell is fun"
-- "kdvnhoo lv ixq"
-- *Ch5examp2> encode (-3) "kdvnhoo lv ixq"
-- "haskell is fun"

table :: [ Float ] 

table = [ 8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4,6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.1, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1 ]
-- percent :: Fractional a => Integer -> Integer -> a
percent n m =(fromInteger n / fromInteger m) * 100


freqs xs = [percent (c4unt x xs) n | x <- ['a'..'z']] 
             where n = lowers xs
-- *Ch5examp2> freqs"abbcccddddeeeee"
-- [6.666666666666667,13.333333333333334,20.0,26.666666666666668,33.33333333333333,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]

chisqr os es = sum[((o - e)^2)/e | (o,e) <- zip os es] 



rotate n xs  = drop n xs ++ take n xs
-- *Ch5examp2> rotate 3 [1,2,3,4,5]
-- [4,5,1,2,3]

-- [chisqr (rotate n table') table | n <- [0..25]]

crack xs = encode (-factor) xs
      where
        factor = head (positions (minimum chitab) chitab)
        chitab = [chisqr (rotate n table') table | n <- [0..25]]
        table' = freqs xs
{-
*Ch5examp2> crack "kdvnhoo lv ixq"
"haskell is fun"
*Ch5examp2>  crack "vscd mywzboroxcsyxc kbo ecopev"
"list comprehensions are useful"
*Ch5examp2> crack (encode 3 "haskell")
"piasmtt"
*Ch5examp2> crack (encode 3 "boxing wizards jump quickly")
"wjsdib rduvmyn ephk lpdxfgt"
-}

{----------------------------------------------------------}
-- 5.7.1 -- list comprehension an expression that calculates the sum 1^2+2^2+...100^2 of the first one hundred integer squares.

sumTo100Sq = [sum[x^2] | x <- [1..100]]

-- 5.7.2 -- In a similar way to the function length, show how the library function -- replicate :: Int -> a -> [a] 
-- that produces a list 
-- of identical elements can be defined 
-- using a list comprehension. 
-- For example: |> replicate 3 True  -- 
-- [True, True, True ] --
-- l2ngth :: Num a => [t] -> a 
-- l2ngth xs = sum[1|_<-xs]
repLica x = [(x:[])|x <- repeat x ] 

{- 5.7.3 -- 

A triple (x, y, z) of positive integers is pythagorean if x2 + y2 = z2. 
Using a list comprehension, 
define a function pyths :: Int -> [ (Int , Int , Int ) ] 
that returns 
the list of all pythagorean triples 
whose components are at most a given limit. 
For example:
> pyths 10
[(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10)]
-}
-- pYths a  = [x|x .......

{- 5.7.4 -- 
A positive integer is perfect 
if it equals the sum of its factors, 
excluding the number itself. 
Using a list comprehension and the function factors, 
define a function perfects :: Int -> [ Int ] 
that returns the list of all perfect numbers up to a given limit. 
For example:
> perfects 500 [6, 28, 496]
-} 

{- 5.7.5 -- 
Show how the single comprehension 
[(x,y) | x -> [1,2,3],y -> [4,5,6]] 
with two generators can be re-expressed 
using two comprehensions with single generators. 
Hint: make use of the library function concat 
and nest one comprehension within the other.
-}

-- 5.7.6. Redefine the function positions using the function find.
--
{- 5.7.7. The scalar product of two lists of integers xs and ys of length n is given by the sum of the products of corresponding integers:

n-1

In a similar manner to the function chisqr , show how a list comprehension
can be used to define a function scalarproduct :: [ Int ] ? [ Int ] ? Int that
returns the scalar product of two lists. For example:

> scalarproduct [1, 2, 3] [4, 5, 6]
32
-}
-- 5.7.8. Modify the Caesar cipher program to also handle upper-case letters

-- import GHC.Tuple
-- import GHC.Types
-- import Data.Text
-- import GHC.IP
-- import GHC.Exts
-- import GHC.Stack
-- import GHC.Stats
-- import GHC.TypeLits
-- import System.Random

