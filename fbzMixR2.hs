module FbzMixR where 
swap' (x,y)   = (y,x)
nList xs      = [if x `mod` 15 ==0  then "fbz" else if x `mod` 5 == 0 then "bz" else if x  `mod` 3 == 0 then "fz" else  "o" | x <- xs ]
zzzs          = zip (nList (reverse[1..100])) (reverse[1..100])
firsts ps           = [x| (x,_)<- ps]
seconds ps          = [y| (_,y)<-ps]
strTups :: [([Char],[Char])] -- interpretor returns:  strTups :: [([Char], String)] changed it here to make (a,b) same typeclass as (b,a) 
strTups = zip (firsts zzzs)  [show x|x <-(seconds zzzs)] 
oTups = [ (y,x) | (x,y)  <-strTups, x =="o"]
fbzMix =  [if fst (x,y)=="o" then swap'(x,y)else (x,y) | (x,y) <-strTups ] 
fbzMixR = reverse (firsts fbzMix) 
---------------------------------------
 fizzbuzz xs = [if x `mod` 3 == 0 && x `mod` 5 == 0 then "FizzBuzz"
		 else if x `mod` 3 == 0 then "Fizz"
		 else if x `mod` 5 == 0 then "Buzz"
		 else show x
		 | x <- xs]
---------------------------------------
main = print [ fizzbuzz x | x <- [1..100] ]
	where fizzbuzz x
		| x `multipleOf` [3, 5] = "FizzBuzz"
		| x `multipleOf` [3]	= "Fizz"
		| x `multipleOf` [5]	= "Buzz" 
		| otherwise		= show x
		where m `multipleOf` ns = 
			all (\n -> m `mod` n == 0) ns
---------------------------------------
Common Lisp using conditional formatting:
  (loop for i from 1 to 100 do
	(format t "~[Fizz~;~]~[Buzz~;~]~:[~a~;~] "
	(mod i 3) (mod i 5) (zerop (* (mod i 3) (mod i 5))) i))
---------------------------------------
Scala!
	(1 to 100) foreach { n => 
		if (n % 3 == 0) print("Fizz")
		if (n % 5 == 0) print("Buzz")
		if (n % 3 != 0 && n % 5 != 0) print(n)
		println
	}
---------------------------------------
F#
[1..100] |> Seq.map (function
	| x when x%5=0 && x%3=0 -> "FizzBuzz"
	| x when x%3=0 -> "Fizz"
	| x when x%5=0 -> "Buzz"
	| x -> string x)
|> Seq.iter (printfn "%s")

--------------------------------------
Clojure
 (doseq [x (map #(cond (zero? (mod % 15)) "FizzBuzz"
			(zero? (mod % 3)) "Fizz"
			(zero? (mod % 5)) "Buzz"
			:else %)
		(range 1 101))]
	(println x))
--------------------------------------
My own Clojure without doseq

(ns fizzBuzz)

(loop [x 100]
  (when (> x 0)
(cond 
   (= 0 (mod x 15))
  (print   "FizzBuzz ")
     (= 0 (mod x 5))
   (print   "Buzz ")
      (= 0 (mod x 3))
    (print   "Fizz ")
        (<= 0 (mod x 2))
      (print x\ ))
  (recur (- x 1))))

--------------------------------------

let strTups = zip (firsts zzzs)  [show x|x <-(seconds zzzs)]
 
oTups = [ (y,x) | (x,y)  <-zzzs, x =="o"]

[ (y,x) | (x,y)  <-zzzs, x =="o"]

-- [swap'(strTups!!x)|x <-[0..99]]  
an if clause that returns identitiy and a branch that returns "fbz"? 

[ x | x <- [10..20], x /= 13, x /= 15, x /= 19] 


-} 
