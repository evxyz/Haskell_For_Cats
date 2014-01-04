module Ch4ex2 where
-- import PrImEs 
-- 4.1 -- renaming functions ---- 
iSDigit c               = c >= '0' && c <= '9' 

-- 4.2 -- Conditionals --- 00:58 ----- 

aBs n                   = if n >= 0 then n else - n 

--------------------------- 04:01 ----no dangling else!

sigNum n                = if n <0 then -1 else 
                           if n == 0 then 0 else 1   

-- 4.3 -- Guards ----- 05:01 --- boxing 

aBS n       | n >= 0                = n 
            | otherwise             = -n 
----------------------------- better than nested conditionals

sIgnum n    | n < 0                 = -1 
            | n == 0                = 0
            | otherwise             = 1  

-- 4.4 -- Pattern-Matches -- dynamic dispatch in other languages
-- not is nOt so it doesn't conflict 
-- with existing lib function
nOt 	                        :: Bool -> Bool 
nOt False                       = True 
nOt True                        = False

-- Haskell is "too" public says EM -- 18:05 ---------	
-- sectioning is putting () around an operator

-- patterns get eval top to bottom left to right
-- c0nj and conJ are standing in for (&&) 
c0nj                            :: Bool -> Bool -> Bool 
c0nj True       True            = True 
c0nj True       False           = False
c0nj False      True            = False
c0nj False      False           = False

conJ                            :: Bool -> Bool -> Bool 
conJ True True                  = True
conJ _ _                        = False 
           
-- double dispatch -- 22:00 ---  

-- note that laziness means that 
-- nothing gets evaluated until it has to.

c4nj                            :: Bool -> Bool -> Bool 
c4nj    True    b               = b          
c4nj    False   _               = False
-- despite having "b" as an arg c4nj must get and return a Bool.
-- 26:00 -- "undefined" as an additional value for Bool <-- E.M.
-- 29:00 -- pattern matching and addition 
-- can both introduce eagerness.
-- lazy evaluation is more functional because 
-- arg order is abstracted away. 
{-
c4Nj _ _        = False 
c4Nj True True  = True       
-- we will never get to true 

-- can't reuse  
c0Nj b b = b
c0Nj _ _ = False 
-- ch4ex2.hs:61:6:
--   Conflicting definitions for `b'-}

-- tuples 
fSt :: (t1,t2) -> t1 
fSt (t1,t2)     = t1 
sNd :: (t1,t2) -> t2 
sNd (t1,t2)     = t2 

-- List Patterns 
test :: [Char] -> Bool
test ['a',_,_]  = True
test _          = False 
-- *Ch4ex2>  test ['a','a','c']
-- True
-- *Ch4ex2>  test []
-- False
 
-- cons operator 
{-
*Ch4Pat> :i :
data [] a = ... | a : [a]       -- Defined in `GHC.Types'
infixr 5 :

*Ch4ex2> 3:2:1:[]
[3,2,1]

-}
-- pattern matching over lists 

-- can't do "head" over an empty list
-- "think of error as a non-terminating function" -- E.M. 39:20 

f x             = 4711 
-- *Ch4ex2> f (head[]) -- this should otherwise return an error 
-- 4711 
-- *Ch4ex2> head []
-- *** Exception: Prelude.head: empty list

-- types telling us a lot about a function -- 45:42 
ta3l            :: [t] -> [t]
ta3l  (a:as)    = as 

-- http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf
-- x:xs patterns can't be done over empty lists and they need parens
-- around them because function application binds stronger than ":" .

-- 50:00
{- using only prefix notation and n+k-patterns (no longer allowed in Haskell 2010)
factorial 0             = 1
factorial (n + 1)       = (*) (n + 1) (factorial n)
-}

-- lambda expressions a.k.a. a nameless function "\x -> "
-- treating a function like a regular value

--- ch4Problems -------------------------------------

-- 4.8.1 -- 
halve :: [a] -> ([a], [a])
halve   x       = splitAt dee x 
                where 
                        dee  = (length x) `div` 2 


-- 4.8.2.a -- 
safetail1 xs = if null xs then [] else tail xs   


-- 4.8.2.b -- 
safetail2 xs | null xs       = [] 
             | otherwise     = tail xs 


-- 4.8.2.c -- 
-- safetail3 as pattern matching 
safetail3 :: [a] -> [a]
safetail3    []          = [] 
safetail3    (_:xs)      = xs

-- note that the type signature borrowed from last which I first used was too restrictive because it prevented the [] set from being an acceptable value. 
-- solution had to do with x in the second def changed to [x]  
-- what if we just wanted the value and not the value in cased in a list. 

-- 4.8.3 -- 
disjunk   False   False  = False 
disjunk   False   True  = True  
disjunk   True    False = True 
disjunk   True    True  = True
-- 4.8.4 -- 
disJunk False  False    = False 
disJunk  _      _       = True
-- 4.8.5 -- 
d3sjunk   True  b       = b
d3sjunk   False _       = False 
-- note that b should be either a True or False   
-- 4.8.6
-- using an earlier example as a guide
dada4          = \x -> \y -> x + y  
 
dada6          = \x -> \y -> \z -> x * y * z 
        
