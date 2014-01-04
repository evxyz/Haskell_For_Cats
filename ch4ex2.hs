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
 
-- cons operator 
{-
*Ch4Pat> :i :
data [] a = ... | a : [a]       -- Defined in `GHC.Types'
infixr 5 :
-} 
