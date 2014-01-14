module Ch5exe4 where 
import GHC.Base
import Data.Char 
import Data.List -- for generics
-- ---------------------------- 5.1 -- Generators --------
-- >[x^2|x<-[1..5]]
-- [1,4,9,16,25]
-- >[(x,y)|x<-[1,2,3], y <- [4,5]]
-- [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]
-- > [(x,y)|y<-[4,5], x <-[1,2,3]]
-- [(1,4),(2,4),(3,4),(1,5),(2,5),(3,5)]
-- >[(x,y) | x <- [1..3], y <- [x..3]]
-- [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)] 

firsts          :: [(a,b)] -> [a] -- pulls first value from each tuple
firsts  ps      = [x|(x,_) <- ps] --  and turns it into a list. 
-- firsts [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]
-- [1,1,1,2,2,3]

l2ngth          :: [a] -> Int 
l2ngth  xs      = sum [1|_<-xs] 
-- l2ngth [(x,y) | x <- [1..3], y <- [x..3]] ------ note were are asking the length 
-- ------------------------------------------------ of a function result!!!
-- 6 ---------------------------------------------- not the length of the function itself.
-- l2ngth [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]
-- 6 
------------------------------------------------5.2 -- Guards 
factors         :: Int -> [Int] 
factors n       = [x|x <- [1..n], n `mod`x==0]
-- factors 15
-- [1,3,5,15]
-- factors 1147  ---------------------------------- Erik Meijer's favorite number
-- [1,31,37,1147]
prime           :: Int -> Bool 
prime   n       = factors n == [1,n] 
-- prime 1147
-- False
primes          :: Int -> [Int] 
primes  n       = [x|x <-[2..n],prime x]
-- primes 23 
-- [2,3,5,7,11,13,17,19,23]

-- altered so as not to clash with find in Data.List
f3nd            :: Eq a => a -> [(a,b)] -> [b] 
f3nd    k t     = [v|(k',v) <-t,k==k']
-- zip ['a'..'z'] (primes 23)
-- [('a',2),('b',3),('c',5),('d',7),('e',11),('f',13),('g',17),('h',19),('i',23)]

-- f3nd 'e' (zip ['a'..'z'] (primes 23))
-- [11]

-------------------------------------------------- 5.3 -- zip
pairs           :: [a] -> [(a,a)]
pairs   xs      = zip xs (tail xs) 
-- pairs (primes 23)
-- [(2,3),(3,5),(5,7),(7,11),(11,13),(13,17),(17,19),(19,23)]
sorted          :: Ord a => [a] -> Bool
sorted  xs      = and[x<=y|(x,y) <- pairs xs] 
-- sorted (pairs(primes 23))
-- True
positions       :: Eq a => a -> [a] -> [Int] 
positions x xs  = [i|(x',i) <-zip xs [0..n], x==x']
                    where n = length xs - 1 
-- positions (17,19) [(2,3),(3,5),(5,7),(7,11),(11,13),(13,17),(17,19),(19,23)]
-- [6]
-- 5.4 -- String comprehensions --  

-- > ['a'..'z']!!13
-- 'n'

-- take 5 ['a'..'z']
-- "abcde"

-- length ['a'..'z']
-- 26

-- zip  [1..12] "Call me Ishmael"
-- [(1,'C'),(2,'a'),(3,'l'),(4,'l'),(5,' '),(6,'m'),(7,'e'),(8,' '),(9,'I'),(10,'s'),(11,'h'),(12,'m')]

lowers          :: String -> Integer 
lowers xs       = genericLength [x|x<-xs,isLower x]
-- lowers  "Call me Ishmael"
-- 11

-- count           :: Char -> String -> Int 
-- count x xs      = length [x'|x'<-xs,x==x']

count x xs      = genericLength [x'|x' <- xs, x == x'] 
-- count 'a'  "Call me Ishmael"
-- 2
-------------------------------------------5.5 -- Caesar cipher ----  

-- unicode conversions 

let2int         :: Char -> Int 
let2int c       = ord c - ord 'a' -- since unicode have number values 
------------------------------------ you can add and subtract them  
int2let         :: Int -> Char 
int2let n       = chr (ord 'a'+ n)

-- let2int 'a'
-- 0

-- int2let 0
-- 'a' 

shift           :: Int -> Char -> Char -------------------- almost a functor?
shift n c   | isLower c   = int2let((let2int c + n) `mod` 26)  
            | otherwise   = c ------------------------------ without this line
------------------------------------------------------------ non-exhaustive 
------------------------------------------------------------ warning!
-- shift 11 'e'
-- 'p'

-- shift 11 'w'
-- 'h'

-- shift (-11) 'e'
-- 't'

encode          :: Int -> String -> String 
encode n xs     = [shift n x | x <- xs] 
-- encode (-1) "Call me Ishmael"
-- "Czkk ld Irglzdk"

table :: [ Float ] 
table = [ 8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4,6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.1, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1 ]

-- percent         :: Int -> Int -> Float 
-- percent n m     = (fromInt n / fromInt m) * 100  
percent :: Fractional a => Integer -> Integer -> a
percent n m         = (fromInteger n / fromInteger m) * 100 

{-freqs xs          = [percent (count x xs) n | x <- ['a'..'z']] 
                    where n = lowers xs ----------------------------}

freqs xs            =  [percent (count x xs) n | x <- ['a'..'z']]
                                  where n = lowers xs

-- [6.666666666666667,13.333333333333334,20.0,26.666666666666668,33.33333333333333,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
--------------  ------------------------------------------
chisqr os es = sum[((o - e)^2)/e | (o,e) <- zip os es] 
rotate n xs  = drop n xs ++ take n xs
-- rotate 3 [1,2,3,4,5]
-- [4,5,1,2,3]

-- [chisqr (rotate n table') table | n <- [0..25]]

crack xs = encode (-factor) xs
      where
        factor = head (positions (minimum chitab) chitab)
        chitab = [chisqr (rotate n table') table | n <- [0..25]]
        table' = freqs xs
{-
> crack "kdvnhoo lv ixq"
"haskell is fun"
>  crack "vscd mywzboroxcsyxc kbo ecopev"
"list comprehensions are useful"
> crack (encode 3 "haskell")
"piasmtt"
> crack (encode 3 "boxing wizards jump quickly")
"wjsdib rduvmyn ephk lpdxfgt"
-}
----------------------------------------------------------------
----------           EXERCISES 
----------------------------------------------------------5.7.1-- 


-- 5.7.1 -- list comprehension an expression that calculates the sum 1^2+2^2+...100^2 of the first one hundred integer squares.

-- >sum of first hundred squares
-- Prelude> sum [y^2|y<-[1..100]]
-- 338350

-- 5.7.2 -- In a similar way to the function length, show how the library function -- replicate :: Int -> a -> [a] 
-- that produces a list 
-- of identical elements can be defined 
-- using a list comprehension. 
-- For example: > replicate 3 True  -- 
-- [True, True, True ] --
-- l2ngth :: Num a => [t] -> a 
-- l2ngth xs = sum[1|_<-xs]
repliKate n x = [x|_ <- [1..n]] 
-- >repliKate 25 5
-- [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]

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
pYths n           = [(x,y,z)|   x <- [1..n],
                                y <- [1..n],
                                z <- [1..n],
                                x ^ 2 + y^2 == z^2]
-- pYths 11
-- [(3,4,5),(4,3,5),(6,8,10),(8,6,10)]
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
perfects n = [x|x <- [1..n], sum (init(factors x)) == x]
{-
[6,28,496]
(2.77 secs, 210867272 bytes)
-} 
{- 5.7.5 -- --------------------------------------------------
Show how the single comprehension 
[(x,y) | x -> [1,2,3],y -> [4,5,6]] 
with two generators can be re-expressed 
using two comprehensions with single generators. 
Hint: make use of the library function concat 
and nest one comprehension within the other.

-- >concat [[(x,y) | y <- [4,5,6]]|x <- [1,2,3]]
-- [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)]
--------------------------------------------------------------}

-- 5.7.6. Redefine the function positions using the function find.
-- positions       :: Eq a => a -> [a] -> [Int] 
-- positions x xs  = [i|(x',i) <-zip xs [0..n], x==x']
--                    where n = length xs - 1 
-- positions (17,19) [(2,3),(3,5),(5,7),(7,11),(11,13),(13,17),(17,19),(19,23)]
-- [6]
-- pos3tions :: ((a, Int) -> Bool) -> [a] -> Maybe (a, Int)
pos3tions x xs     = f3nd x (zip xs [0..n]) -- f3nd in def local
                     where n = length xs -1 -- find comes from Data.List

-- *Ch5exe4>  pos3tions 'm' ['a'..'z'] 
-- [12]

{- 5.7.7. The scalar product of two lists of integers xs and ys of length n is given by the sum of the products of corresponding integers:
In a similar manner to the function chisqr , show how a list comprehension
can be used to define a function scalarproduct :: [ Int ] ? [ Int ] ? Int that
returns the scalar product of two lists. For example:

Algebraically, it is the sum of the products of the corresponding entries of the two sequences of numbers. 

> scalarproduct [1, 2, 3] [4, 5, 6]
32
-}
scalarproduct xs ys = sum [x * y | (x,y) <- zip xs ys] 


-- 5.7.8. Modify the Caesar cipher program to also handle upper-case letters 
-- count                       :: Char -> String -> Integer
-- count   x xs                = genericLength [x'|x' <- xs, x == x']

{- toLower                    :: Char -> Char 
-- toLower   c| isUpper c     = chr (ord c - ord 'A'+ ord 'a')
              | otherwise     = c ---------------------------}

sHift                       :: Int -> Char -> Char 
sHift   n c | isLower c     = int2low ((low2int c + n) `mod`26)
            | isUpper c     = int2upp ((upp2int c + n) `mod`26)
            | otherwise     = c 

{-
*Ch5exe4> sHift 4 'a'
'e'
*Ch5exe4> sHift 4 'A'
'E'
*Ch5exe4> 
-}

fReqs                       :: String -> [Float] 
fReqs   xs                  = [percent (count x xs') n | x <- ['a'..'z']]
                                where 
                                    xs' = map toLower xs 
                                    n   = letters xs
{-
*Ch5exe4> fReqs "Hello I must be going" 
[0.0,5.882353,0.0,0.0,11.764706,0.0,11.764706,5.882353,11.764706,0.0,0.0,11.764706,5.882353,5.882353,11.764706,0.0,0.0,0.0,5.882353,5.882353,5.882353,0.0,0.0,0.0,0.0,0.0]
-}

low2int                     :: Char -> Int 
low2int c                   =  ord c - ord 'a' 

int2low                     :: Int -> Char 
int2low n                   = chr (ord 'a' + n)

upp2int                     :: Char -> Int 
upp2int c                   =  ord c - ord 'A'

int2upp                     :: Int -> Char
int2upp n                   = chr (ord 'A' + n) 

-- letters                     :: String -> Int 
letters                     :: Num i => [Char] -> i
letters xs                  = genericLength [x|x <- xs, isAlpha x] 

-- *Ch5exe4> letters "What is and What should never Be"
-- 26

-------------------------------------------------------------------
--                  ETCETERA 
--------------------------------------------------------------------

dada2 n a = concat [take n (repeat a)] 

d2 :: Integer -> Integer -> Integer -> Integer
d2 n m p =(div(product(concat(dada2(10101+1)[x^2|x<-[1..n]])))(product[m+11^11-1]))^p
-- (5.73 secs, 3833070184 bytes)
-- (1.34 secs, 259655336 bytes) 

