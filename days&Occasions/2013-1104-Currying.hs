{-# LANGUAGE NoMonomorphismRestriction #-}
module NovFour where 
multThree x y z = x * y * z

multThree9 = multThree 9
{- 
 - Prelude> multThree 1 2

<interactive>:37:1:
    No instance for (Num a0) arising from a use of `multThree'
    The type variable `a0' is ambiguous 

NOTE! that where we are short on args their with be no compiling but if the following function includes the missing args then it will compile and return a result, and the parenthases are extra but I helps to forground the value for me. -} 

multThreeWithTen = (multThree 10)
-- *Main> multThreeWithTen 3 4
-- 120

-- compateWithOneHundred :: (Num a, Ord a) => a -> Ordering
compateWithOneHundred x = compare 100 x

-- compareWith100 99 :: Ordering
compareWith100 = compare 100

isUpperAlphanum = (`elem` ['A' .. 'Z']) 
{- 
*NovFour>  isUpperAlphanum '1'
False
*NovFour>  isUpperAlphanum "1"

<interactive>:76:17:
    Couldn't match expected type `Char' with actual type `[Char]'
    In the first argument of `isUpperAlphanum', namely `"1"'
    In the expression: isUpperAlphanum "1"
    In an equation for `it': it = isUpperAlphanum "1"

NOTE! that single quotes work but double quotes don't. 

Also fuctions themselves don't have a Show type associated with them it must be be otherwise accomodated to print to the screen. Char, and Num do which is why they display. 
-} 
applyTwice :: (a -> a) -> a -> a 
applyTwice f x = f (f x) 

{-
 - the inference with out definition yeilds 
 -
*NovFour> :t applyTwice
applyTwice :: (t -> t) -> t -> t 

but if the type is declared with  
applyTwice :: (a -> a) -> a -> a 

then no t only a. -} 
 
