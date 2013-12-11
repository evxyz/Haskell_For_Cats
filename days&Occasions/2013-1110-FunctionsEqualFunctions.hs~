{-# LANGUAGE NoMonomorphismRestriction #-} 
{- 
*NovTen> let a=4
*NovTen> let b=4
*NovTen> a==b
True
*NovTen> a-b ==b
False
*NovTen> a-b ==b-a
True
*NovTen> let c = 5
*NovTen> c-b == c-a
True
*NovTen> c-b == a- c
False
-}

module NovTen where
-- Three things to be pleased with Haskell about . . . 
--  abs'     :: Double -> Double 
    abs' n   =  if n >= 0 then n else - n 
    
   -- signum'   ::  Int -> Int 
    signum' n  =   if n < 0 then - 1 else 
                    if n == 0 then 0 else 1 


