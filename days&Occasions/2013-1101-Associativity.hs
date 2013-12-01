module NovOne where 
blah (x,y)  | True  && True = True
            | otherwise = False 

--  		  | _ && _ = False
	
{-

let (+) =\x -> (\y (+)x y)
-- associativity 
let (+) x = \y-> (+)x y

let (+) y = \x-> (+)x y 

successor function 
(1+) :: Num t => t -> t1
(1/) :: Fractional a => a -> a
(/2) :: Fractional a => a -> a
(*2) :: Num a => a -> a

pred -- predisessor 
Prelude> pred 'b'
'a'

  -}
