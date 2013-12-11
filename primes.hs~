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

-- find k t = [v | (k', v) <- t, k == k'] 

-- aZ_alt = (zip ['a'..'z'] (reverse ['A'..'Z']))


-- sorted xs = and[x<=y | (x,y) <- pairs xs]
{-     
let     aToZ  = ['A'..'Z'] 
let     zToA  = (reverse ['A'..'Z'])
let     one01 = primes 101
     zip zToA one01 
let swap (x,y) = (y,x)
let  two40primes = (primes 240)

let sndHalf240primes = (swap (splitAt 26 two40primes))

let unpair (x,y) = x y 
let zTOa = reverse ['a'..'z']
let  prime_az = reverse (zip zTOa (primes 101))

[('a',101),('b',97),('c',89),('d',83),('e',79),('f',73),('g',71),('h',67),('i',61),('j',59),('k',53),('l',47),('m',43),('n',41),('o',37),('p',31),('q',29),('r',23),('s',19),('t',17),('u',13),('v',11),('w',7),('x',5),('y',3),('z',2)]

('a',101), ('e',79),('i',61),('o',37),('u',13)

-}




