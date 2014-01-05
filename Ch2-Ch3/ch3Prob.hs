module Ch3Prob where 
{--------------1----------------}

['a','b','c']				-- :: [Char]
('a','b','c')				-- :: (Char, Char, Char)
-- [(False,`O`),(True,'1')]	-- :: [(Bool, Char)]
([False,True],['0','1']) 	-- :: ([Bool],[Char])
[tail,init,reverse] 		-- :: [[a] -> [a]]
-- !! note line 8 is a list, 
--where each function takes a list, 
--and returns a list 
{---------------2---------------}

second xs 		= head(tail xs) 	-- :: [a] -> a 
swap 			:: (a,b) -> (b,a)
swap  (x,y)		= (y,x)				-- :: (a,b) -> (b,a)  
pair 			:: a -> b -> (a,b)
pair x y 		= (x,y) 			-- :: a -> b -> (a,b)
double 			:: Num a => a -> a  
double x 		= x * 2 
palindrome		:: Eq a => [a] -> Bool
palindrome xs 	= reverse xs == xs  
-- twice 			:: (a -> a) -> a -> a
twice f x 		= f (f x) 

-- note class constraints 

{----------------4----------------
-- Functions equivalence and the equality type class 


let blah b = 2.0 * b
let lah a  = 8 / a  
blah 2 == lah 2 


-- [[5,4,3,2,1,0]!!x|x <-[(length [5,4,3,2,1,0])-1]]


----------------------------------} 
 
