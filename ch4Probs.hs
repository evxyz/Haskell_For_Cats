module Ch4prob where 

{---------------------------------------------------
-- 4.8.1 -- 
halve :: [a] -> ([a], [a])
halve   x       = splitAt dee x 
                where 
                        dee  = (length x) `div` 2 
-----------------------------------------------------}
{----------------------------------------------------------------------
-- 4.8.2.a -- 
safetail xs = if null xs then [] else tail xs   




-- 4.8.2.c -- 
-- safetail as pattern matching 
safetail :: [a] -> [a]
safetail    []          = [] 
safetail    [x]         = [x]
safetail    (_:xs)      = safetail xs

-- note that the type signature borrowed from last which I first used was too restrictive because it prevented the [] set from being an acceptable value. 
-- solution had to do with x in the second def changed to [x]  
-- what if we just wanted the value and not the value incased in a list. 




--------------------------------------------------------------------------}