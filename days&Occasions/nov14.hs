{-# LANGUAGE NoMonomorphismRestriction #-}

module Nov14 where  

[(x,y)|x <- primes 100, y <- factors 100]

let pairs xs = zip xs (tail xs)
let sorted xs = and [x<=y|(x,y)<-pairs xs]


-- :set prompt ghci> 
-- :set guifont=Consolas 16
-- :set gfn=Consolas\ 16
-- :set expandtab 
-- :set ts=3  
-- Show sum [x] = x for any number
-- Give another result for (double(double 2)) 
-- 7 `div` 2 -- note `div` rounds down to nearest proper fraction 

{-

ghci>:t div
div :: Integral a => a -> a -> a

ghci>:i div
class (Real a, Enum a) => Integral a where
  ...
  div :: a -> a -> a
  ...
        -- Defined in `GHC.Real'
infixl 7 `div`

a conditional expression like: 
                                if True then 1 False
               the will fail on type grounds. 
-} 


