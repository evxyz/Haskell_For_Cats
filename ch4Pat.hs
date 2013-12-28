module Ch4Pat where 
-- 4.1 -- renaming fuctions ---- 
iSDigit c               = c >= '0' && c <= '9' 

-- 4.2 -- Conditionals ---------
aBs n                   = if n >= 0 then n else - n 

sigNum n                = if n <0 then -1 else 
                           if n == 0 then 0 else 1   
-- 4.3 -- Guards ---------------
aBS n       | n >= 0                = n 
            | otherwise             = -n 

sIgnum n    | n < 0                 = -1 
            | n == 0                = 0
            | otherwise             = 1  
-- another guard example -- 

-- nList ::  (Num a, Integral a) => [a] -> [Char]

nList x  | x `mod` 15   == 0        = "fbz" 
         | x `mod` 5    == 0        = "bz" 
         | x `mod` 3    == 0        = "fz" 
         | otherwise                = "o"  
-- 4.4 -- Pattern-Matches --
nOt 	                        :: Bool -> Bool 
nOt False                       = True 
nOt True                        = False	
conjunk :: Bool -> Bool -> Bool 
conjunk x y |True  && True      = True  
            |otherwise          = False 


-- note that laziness means that nothing gets evaluated until it has to.
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
