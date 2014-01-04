module CH2Types where 
{- Chapter 2 VideoNotes: 
Haskell as calculator                               2:24
    PCL? Base class 
    
C# example                                          8:53 
F# example                      

OOP receiver                                        11:19
    dynamic dispatch == pattern matching? 
    multi-methods 
    In Haskell no arg 
        is more important than any other 
            dispatch is over all args 
List Primacy                                        14:19
    everything with lists 
    syntactic-sugar for lists
Operator we use most                                
    takes up the least amount of space 
dot operator                                        16:50
    drop down menue prompt			    
    the smallest operator in Haskell is function 
        application and that is marked by spaces         
    f a b                                           18:00
            aplication binds strongest aswell 
                                                    21:20
        $ operator is a right associative trick     22:00
-}
--    let                                           23:00
    double x = x + x                            
--    let 
    quadruple = double . double
--  take (double 2) [1,2,3,4,5,6,7]

--  the essences with no extra blather              28:28

--  why testing is harder in oop                    30:00
--      "quickcheck"

--    factorial                                     31:30
--      "laziness" 
--      "strict / eager" 
--  take 4 [1..]
--      let 
    deeda n = take n [1..n]
                            --  deeda 5
    blah0 n = product (take n [1..])
                            {- didn't take any longer 
 - 
    :?
