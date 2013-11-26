module Nov22 where
factors         n     = [x| x  <- [1..n], n `mod` x == 0] 
-- *Nov22> factors 77
-- [1,7,11,77]
primes          n     = [x | x <- [2..n], prime x]
-- *Nov22> primes  77
-- [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73]
average         ns    = sum ns `div`  length ns
-- *Nov22> average [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73]
--  33
avPrime         n     = prime (average (primes n))
-- *Nov22> avPrime 77
--  False
prime_Tups      n     = zip [prime x | x <- primes n] (primes n) 
-- *Nov22> prime_Tups 11
-- [(True,2),(True,3),(True,5),(True,7),(True,11)]

primeTups       n     = zip [avPrime x | x <- primes n] (primes n)  
-- *Nov22> primeTups 11
-- [(True,2),(True,3),(True,5),(False,7),(True,11)]

find            k t     = [v | (k', v) <- t, k == k'] 
-- *Nov22> find True [(True,2),(True,3),(True,5),(False,7),(True,11),(False,13),(False,17)]
-- [2,3,5,11]
findPrimeTups   n = find True (prime_Tups n)
-- *Nov22> findPrimeTups 11
-- [2,3,5,7,11]
findAvTruPrimes n = find True (primeTups n)
-- [2,3,5,11,23,53,67,71]
prime           n = factors n == [1,n]
-- *Nov22> prime 11
-- True
primeSecAv      n = (prime (average (findAvTruPrimes n)))
-- *Nov22> primeSecAv 101
-- True 
odds            n = map (\x -> x * 2 + 1) [0..n -1]
-- *Nov22> odds  11
-- [1,3,5,7,9,11,13,15,17,19,21]


