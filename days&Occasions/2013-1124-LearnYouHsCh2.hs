module Nov24 where 
{---------------2e tuples -------------------------

-- tuples are defined by their length. They can and often do include 
heterogeneous types 
(1,'2')
 
(1,'a',3.0)

-- tuples can be put inside a list but all others must have same pattern/types.
Prelude> :t [(1,'a',3.0)]
  [(1,'a',3.0)] :: (Fractional t1, Num t) => [(t, Char, t1)]
Prelude> [(1,'a',3.0),(2,'b',1.5)]
  [(1,'a',3.0),(2,'b',1.5)]

-- lists are not constrained by length; 
-- the following are equivalent, despite having diff lengths. 
Prelude> sum[1,2,3] == sum[1,5]
  True


--------------------------------------------------}
{-- list comprehension 2.4 -----------------------

Prelude>  [2^n | n <- [1..11]]
  [2,4,8,16,32,64,128,256,512,1024,2048]

-- and with constraint 

Prelude>  [2^n | n <- [1..11], 2^n >=10, 2^n <100] 
  [16,32,64]

-- note that  [2^n | -- is the resulting list.
--            n <- [1..11], -- is the var values
--            2^n >=10, -- lower bound predicate -- filter
              2^n <100  -- upper bound predicate -- filter

-- on strings 

Prelude> [x | x <- "outrageous", not (elem x "aeiou")]
  "trgs"

Prelude> [[x | x <- word, not (x `elem` "aeiou")] | word <- ["bell", "book", "candle"]] 
  ["bll","bk","cndl"]

-- note that -- x | x <- word, -- is being fed by --   
                                                  | word <- ["bell", "book", "candle"]] 


Prelude> [[x * y | y <- [1..5]] | x <- [1..5]]      -- this component making is powerful 
   [[1,2,3,4,5],[2,4,6,8,10],[3,6,9,12,15],[4,8,12,16,20],[5,10,15,20,25]]



----------------------------------------------------}
{- Note that [(function1),(function2)...(functionN)] 
is susceptible to all the functions that all lists are.  
  *PrImEs> length [(3 `div` 4), (product fteen), (product thr3)]
    3
  *PrImEs> product [(sum fteen), (sum thr3)]
    530145

  *PrImEs> let thr3Func = [(3 `div` 4), (product fteen), (product thr3)] 



  *PrImEs>   thr3Func !! 2
    48271088561613960642858365853327381832862269440000000

 

  *PrImEs>   thr3Func !! 3
    *** Exception: Prelude.(!!): index too large
        -- note index starts with zero

  let ffTeens = tail [105,90..0]
   let fives = [100,95..0] 
    let thr3s = tail [101,99..0] ----  let thr3s = tail [101,99..0]++[0] -- missing 0 ? 
      let on1s = [100..0] 
  let numRack = [ffTeens,fives,thr3s,on1s]

  *PrImEs> sum [[1..11],[1..100]]
<interactive>:146:1:
---- but if we do this 
  *PrImEs> sum [sum[1..11], sum[1..100]]
    5116

  *PrImEs> product [negate (7)^ 7,sum [0..101],product [11..0]]
    -4242069993

(*) (negate(sum thr3Func)) 0 


-}
{-----------lean you a Hask 2.3 ------------------------------------ 
the most prev data structure in Haskel is the Linked List

texas range [1.. ]



*Main> 5:[]
[5] -- 5 was conj into the empty [] 

lists have two time costs, Constant and Linear.

Length and reverse have to walk the list so they take Linear time. 

last and head are constant time 

tail creates a new list so that takes time. 

elem walks the list to find the element. 
  *PrImEs> elem 109 myPrimes 
  True

init creates a new list of all but the last element  

sum and product have constant time. 

cycle? 
drop? 
repeat? 
replicate? 


----------------------------------------------------------------}


{- learn you Hask 2.2
hypot     a b   =   sqrt a^2 + b^2  

idCamHump humps =   if humps == 1
                    then "dromedrary"
                    else "Bactrian" 
 
*Main> let a = 3.0
*Main> let b = 4.0
*Main> hypot a b 
19.0

*Main> let a = 3
*Main> let b = 4
*Main> hypot a b 

<interactive>:20:1:
    No instance for (Floating Integer)
-} 

 
