{-
module Cylinder where  
cylinder :: Double -> Double -> Double 
cylinder r h = 
		let sideArea = 2 * pi * r * h 
				topArea  = pi * r ^ 2 
		in 	sideArea + 2 * topArea 
-}
{- 
 - the where clause is only holding
 - a too narrowly defined variables 
 - makes the where only holding the last 
 - part, to make this work 
 - the where would have to be global 

greet :: String -> String 
greet "Juan" = niceGreeting ++ " Juan! " 
greet "Fernando" = niceGreeting ++ " Fernando! " 
greet name = badGreeting ++ " " ++ name 
		where niceGreeting = " Hello! " 
					badGreeting = " Oh! It's You "
-}  

{- 
bmiTell :: Double -> Double -> String 
bmiTell weight height
		| bmi <= skinny 	= "You're underweight, you emo, you!"
		| bmi <= normal 	= "You're supposedly normal. Pffft, I bet you're ugly!"
		| bmi <= fat 			= "You're fat! Lose some weight, fatty!"
		| otherwise 			= "You're a whale, congratulations!"
		where bmi 				= weight / height ^ 2
					skinny 			= 18.5
					normal 			= 25.0
`					fat 				= 30.0 

module BmiTell where 

bmiTell weight height 
		| bmi <= underweight = "Underweight"
		| bmi <= normal 		 = "Normal"
	  | bmi <= overweight  = "Overweight" 
		| otherwise 				 = "Morbid Obesity"
		where bmi = weight / height ^ 2
					underweight			= 18.5 
					normal 					=	25.0
					overweight 			= 30.0 

-}
{-
bmiTell weight height 
		| bmi <= 18.5 = "Underweight"
		| bmi <= 25.0 = "Normal"  
		| bmi <= 30.0 = "Overweight"
		| otherwise 									= "Morbid Obesity"
		where bmi = weight / height ^ 2  
-}

{-
module BmiTell where 

bmiTell weight height 
		| weight / height ^ 2 <= 18.5 = "Underweight"
		| weight / height ^ 2 <= 25.0 = "Normal"  
		| weight / height ^ 2 <= 30.0 = "Overweight" 
		| otherwise 									= "Morbid Obesity" 
-}
{------------------------
 - the where clause 
 ------------------------
 - the where can store 
 - store intermediate 
 ------------------------}





-- set ts=2






{-
module MyCompare where 

myCompare :: (Ord a) => a -> a -> Ordering 
a `myCompare` b  
		| a == b		= EQ
		| a <= b 		=	LT
		| otherwise = GT 
-} 

{-
module BmiTell where 

bmiTell weight height 
	| weight / height ^ 2 <= 18.5 = "Underweight" 
	| weight / height ^ 2 <= 25.0 = "Normal"  
	| weight / height ^ 2 <= 30.0 = "Overweight"
	| otherwise = "Morbid Obesity" 
-}


-- bmiTell :: => Double -> String 

{-
module BmiTell where 
bmiTell :: (Fractional a, Ord a) => a -> [Char]

bmiTell bmi
		| bmi <= 18.5 = "Underweight" 
		| bmi <= 25.0 = "Normal" 
		| bmi <= 30.0 = "Overweight" 
		| otherwise = "Morbid Obesity"  
-}



{-- --------------
 -- as-patterns --
 -----------------} 

{-
module FirstLetter where 

firstLetter :: String -> String
firstLetter "" = " Empty String!"
firstLetter all@(x:xs) = " First letter of " ++ all ++ " is " ++ [x] 
-} 
{----------------------------------
*FirstLetter> firstLetter ""
" Empty String!"
*FirstLetter> firstLetter "Hello"
" First letter of Hello is H"   
------------------------------------}


