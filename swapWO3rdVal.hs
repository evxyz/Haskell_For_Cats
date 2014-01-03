module SwapWOut3rdVal where
 
import Data.List

(-:) ::(Eq a) => [a] -> [a] -> [a]
a -: b = filter (\x -> x `notElem` b) a

swap :: (Eq a) => ([a],[a]) -> ([a],[a])
swap (a,b) = ((a ++ b) -: a, (a ++ b) -: b)

*Main> swap ([4,1],[2,5])
([2,5],[4,1])

-- and another
-- (\(a,b) -> (b,a))
