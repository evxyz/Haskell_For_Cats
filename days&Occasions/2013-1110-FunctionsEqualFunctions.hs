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


