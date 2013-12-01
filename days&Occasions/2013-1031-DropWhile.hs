module WhileDrop where 
whileDrop x 	= [1,2,3,4,5,1,2,3]
whileDrop y  	= dropWhile (< 2) x 

-- dropWhile (< 3) [1,2,3,4,5,1,2,3] /= tail x

