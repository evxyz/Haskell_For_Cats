

{-
module BadAdd where 
badAdd 			:: (Num a) => [a] -> a
badAdd (x:y:z:[]) 	= x + y + z 
-}
{-
module Tell where 
tell :: (Show a) => [a] -> String
tell [] = "empty" 
tell (x:[]) = "list is only " ++ show x 
tell (x:y:[]) = "list of  " ++ show x ++ " and " ++ show y 
tell (x:y:_) = "list is longer than just " ++ show x ++ " and " ++ show y  
-} 
{-
xs = [(1,3),(4,3),(2,4),(5,3),(5,6),(3,1)]
 [a+b | (a, b) <- xs] 
-}
{-
first :: (a,b,c) -> a 
first (x,_,_) = x 
second :: (a,b,c) -> b
second (_,y,_) = y
third :: (a,b,c) -> c 
third (_,_,z) = z 
-}
{-
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double) 
-- addVectors a b = (fst a + fst b, snd a + snd b) 
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2) 
-} 
{-
factorial :: Int -> Int 
factorial 0 = 1 
factorial n = n * factorial (n - 1) 
-} 

{- 
lucky :: Int -> String 
lucky 7 = "Lucky"
lucky x = "Sorry" -} 
