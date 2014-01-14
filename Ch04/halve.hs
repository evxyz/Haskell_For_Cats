module Halve where 
-- 4.8.1 -- 
halve :: [a] -> ([a], [a])
halve   x       = splitAt dee x 
                where 
                        dee             = (length x) `div` 2 
{- 
*Halve> halve [1,2,3,4,5,6,7,8] 
([1,2,3,4],[5,6,7,8])
-}
