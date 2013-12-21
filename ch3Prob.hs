module Ch3Prob where 
{--------------1----------------

['a','b','c']
('a','b','c')
[(False,`O`),(True,'1')]	-- :: [(Bool, Char)]
([False,True],['0','1']) 	-- :: ([Bool],[Char])
[tail,init,reverse] 		-- :: [[a] -> [a]]

---------------2---------------}

second xs 		= head(tail xs)
swap  (x,y)		= (y,x)
pair x y 		= (x,y)
double x 		= x * 2 
palindrome xs 	= reverse xs == xs 
twice f x 		= f (f x) 

-- note class constraints 

