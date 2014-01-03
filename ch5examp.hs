module CH5Examp where 
{- 5.1 -- list comp, generators 
Prelude> [(x,y) | x <- [1..3], y <- [x..3]]
[(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]

Prelude> [x^2|x<-[1..5]]
[1,4,9,16,25]
-------------------------------}
conc1t xss = [x|xs<-xss,x<-xs]


firsts :: [(t, t1)] -> [t]
firsts ps = [x|(x,_)<- ps]

l2ngth :: Num a => [t] -> a 
l2ngth xs = sum[1|_<-xs] --  "_<-xs" simply serves as a ones generator, here.

{-- 5.2 -- Guards
 List comprehensions can also use logical expressions called guards to filter the values produced by earlier generators. If a guard is True, then the current values are retained, and, if it is False, then they are discarded.

Prelude> [x | x <- [1..10], even x ]
[2,4,6,8,10]
------------------------------------}
factors n = [x|x <- [1..n],n`mod`x==0]

prime n = factors n == [1,n]

-- a number such as 15 is not prime does not require the function prime to produce all of its factors, because under lazy evaluation the result False is returned as soon as any factor other than one or the number itself is produced, which for this example is given by the factor 3.

primes n = [x | x <- [2..n],prime x] -- “sieve of Eratosthenes” is more efficient 

find k t = [v|(k',v)←t,k==k']
