module QuickSort where 

f []            = []

f (x:xs)        = f ys ++ [x] ++ f zs 
                  where 
                        ys = [a | a <- xs, a <= x ] 
                        zs = [b | b <- xs, b > x ]

{- !!   note:     [] is an empty list, 
                  = [] what happens when we encount an empty list
                  f  means a function named "f" 
                  xs means a list  
                  ys means another list 
                  zs means yet another list
                  x: is the act of conjoining onto an existing list.
                  "<- xs" is associating in the oposite direction 
                                    functions associate left and args associate to the right.
                  "<=" less than and equal to
                                    not to be confused with "=>" which is for TypeClass
                  | "guard"
                  "where" is a place to put temperary work and scopes a and b 
                  "module QuickSort where" this is info to assist with :loading a module into the GHCI. 
                  
-}   
                 
