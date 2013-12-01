module Nov29 where 
-- preplexed as to why I can't import "findavprimes" because primes.hs does load fine. 

-- idempotency—applying a function twice has the same result as applying it only once.

-- we've loaded Primes to later check/test. 
-- have to get the System.Random.mkStdGen to load.  

    import PrImEs 
    import Test.QuickCheck
    import Data.List 


    qsort :: Ord a => [a] -> [a]
    qsort []        = []
    qsort (x:xs)    = qsort lhs ++ [x] ++ qsort rhs
        where   lhs = filter (< x) xs 
                rhs = filter (>=x) xs 

    prop_idempotent xs = qsort (qsort xs) == qsort xs 

-- generate 10 (System.Random.mkStdGen 2) arbitrary :: [Bool]
