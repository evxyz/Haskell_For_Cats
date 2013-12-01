module FindAvTruPrimes where 

{- taking a list of primes and then finding the average of that list that is itself a prime 
-} 

factors         n     = [x| x  <- [1..n], n `mod` x == 0]
prime           n     = factors n == [1,n]
primes          n     = [x | x <- [2..n], prime x]
average         ns    = sum ns `div`  length ns
avPrime         n     = prime (average (primes n))
find            k t   = [v | (k', v) <- t, k == k']
-- odds         n     = map (\x -> x * 2 + 1) [0..n -1]
prime_tups      n     = zip (primes n) [prime x | x <- primes n]
prime_Tups      n     = zip [prime x | x <- primes n] (primes n) 
findPrimeTups   n     = find True (prime_Tups n)
primeTups       n     = zip [avPrime x | x <- primes n] (primes n)  
findAvTruPrimes n     = find True (primeTups n)


{- 
 - *Nov20> find True (primeTups 25)
[2,3,5,11,23]
-- want to repalce odds with primes 
--          prime_tups  n     = zip (primes n) [prime x | x <- primes n]     
-- and swap the order of the tuples so then 
--          primeTups   n     = zip [prime x | x <- primes n] (primes n) 
-- avPrimes in place of . . . 
--          findAvTruPrimes n     = find True (primeTups n) 
 -} 
