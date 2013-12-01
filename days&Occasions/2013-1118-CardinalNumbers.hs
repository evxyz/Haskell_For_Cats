-- find the average of a set of primes who's average is itself a prime 
-- yup  [2,3,5,7,11] it's average is 5 also three but not again until 23 
-- 100003


-- what about the median being prime ?  
 
-- what about guard where input is tested for Prime before going on to check. 
--
sum (take 12 (primes 100))
-- 197
average ns = sum ns `div`  length ns
avPrime n = prime (average (primes n))


{- 
 - Cardinal Numbers 	= How many is it in a group 
 - Ordinal Numbers 	= what position is it in a group.
 -
 - Axioms 		= the formal rules of number behavior 
 -
 - Natural Numbers 	= the most basic and common kind of Numbers 
 -
 - Peano arithmatic 	= it's the collection of axioms that describe natural numbers 
 -
 - Initial Value Rule	= describes zero in the natural number pantheon 
 -
 - Successor Rule 	= every natural number has one successor. 
 -
 - Predissor  Rule 	= every natural number has one predissor.  
 - 
 - Uniqueness Rule	= no two natural numbers have the same successor. 
 -
 - Equality Rule 	 
 - 	refexivity	= every natural number is equal to itself 
 - 	tranitivity 	= if a = b and b = c then a = c 
 -
 - Induction Rule 	= P is true about 0 
 - 				P(0) is true 
 - 				P(n) is true
 - 				P is true for the successor. 
 - 
 - For addition: 					P(s(0)) 
 - Communitivity Rule	= n + m = m + n 
 - Identity 		= n + 0 = 0 + n = n
 - Recursion 		= m + s(n) = s(m + n) 
 - 			= m + n = 1 + (m + (n -1))  
 - 
 - We start with the BASE CASE. That is a case that can be proven all by itself. 
 - 	and becomes the basis of proving induction.
 - (0*(0+1))/2 is 0.
 - n=0.  
 - n+1
 - 	if the the rule is true for zero then it must be true for 1. And will thus be true for 2. 
 -
 - (0 + 1 + 2 + 3 + ... + n + n + 1) = (n+1)(n+2)/2 
 -
 - (0 + 1 + 2 + 3 + ... + n) = n(n+1)/2 
 -
 - n(n+1)/2 + n + 1 = (n+1)(n+2)/n 
 -
 - (n^2 + n) /2 + (n + 1) = (n2 + 3n + 2)/2
 -
 - Prelude> let n = 0 
 - Prelude> (0*(0+1))/2 == 0
 - True 
 -
 - Prelude> (n+1)*(n+2)`div`n 
 - 6
 - 
 - Prelude> n*(n + 1)`div`2 + n + 1
 - 3
 - 
 - Prelude> n*(n + 1)`div`2 + n + 1 == (n+1)*(n+2)`div`n 
      
