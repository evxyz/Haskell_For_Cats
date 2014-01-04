module Ch4prob where 


-- 4.8.1 -- 
halve :: [a] -> ([a], [a])
halve   x       = splitAt dee x 
                where 
                        dee  = (length x) `div` 2 


-- 4.8.2.a -- 
safetail1 xs = if null xs then [] else tail xs   


-- 4.8.2.b -- 
safetail2 xs | null xs       = [] 
             | otherwise     = tail xs 


-- 4.8.2.c -- 
-- safetail3 as pattern matching 
safetail3 :: [a] -> [a]
safetail3    []          = [] 
safetail3    (_:xs)      = xs

-- note that the type signature borrowed from last which I first used was too restrictive because it prevented the [] set from being an acceptable value. 
-- solution had to do with x in the second def changed to [x]  
-- what if we just wanted the value and not the value in cased in a list. 

{- 4.8.3 -- 
*Ch4prob> False || False
False
*Ch4prob> False || True
True
*Ch4prob> True || True
True
*Ch4prob> True || False
True
*Ch4prob> True || True
True
dada1 x = False || False 
dada1 x =     _ || _ = True
---------------------------}

-- 4.8.6
-- using an earlier example as a guide
dada4          = \x -> \y -> x + y  
 
dada6          = \x -> \y -> \z -> x * y * z 

