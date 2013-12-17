{- :set expandtab 
 - :set ts=2 -} 

module PrImEs where 

factorial n     = product [1 .. n ]
factors n       = [x| x <- [1..n], n `mod` x == 0]
prime   n       = factors n == [1,n] 
primes  n       = [x | x <- [2..n], prime x] 
average ns      = sum ns `div`  length ns
avPrime n       = prime (average (primes n)) 
swap (x,y)      = (y,x)
pair x y        = (x,y)
palindrome xs   = reverse xs == xs
pairs xs        = zip xs (tail xs)
sorted xs       = and[x<=y | (x,y) <- pairs xs]
find k t        = [v | (k', v) <- t, k == k']
odds n          = map (\x -> x * 2 + 1) [0..n -1] 
-- primeTest    :: Integral t => t -> [(t, Bool)]
primeTest n     = zip (odds n) [prime x | x <- odds n]





