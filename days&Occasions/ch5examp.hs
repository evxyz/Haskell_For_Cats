module CH5Examp where 
import GHC.Base
import GHC.Char
import GHC.Tuple
import GHC.Types
-- import GHC.IP
-- import GHC.Exts
-- import GHC.Stack
-- import GHC.Stats
-- import GHC.TypeLits
-- import System.Random

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

count x xs = length[x'|x'<-xs,x==x']

-- 5.5 Caesar cipher -- 
let2int c = ord c - ord 'a'
int2let n = chr (ord 'a' + n)

shift n c   | isLower c = int2let((let2int c + n) `mod`26) 
            | otherwise = c
--

-- table :: [ Float ] 

table = [ 8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4,6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.1, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1 ]
percent :: Fractional a => Integer -> Integer -> a
percent n m =(fromInteger n / fromInteger m) * 100


freqs xs = [percent (count x xs) n | x <- ['a'..'z']] 
             where n = lowers xs






