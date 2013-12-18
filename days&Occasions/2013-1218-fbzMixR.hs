module Dec18 where 
import ListSort
-- import PrImEs
find'   k t   = [v | (k', v) <- t, k == k']
swap' (x,y)   = (y,x)
nList xs      = [if x `mod` 15 ==0  then "fbz" else if x `mod` 5 == 0 then "bz" else if x  `mod` 3 == 0 then "fz" else  "o" | x <- xs ]
zzzs          = zip (nList (reverse[1..100])) (reverse[1..100])
zzzsr         = zip (reverse[1..100]) (nList (reverse[1..100]))
rzzzs         = reverse zzzs 
rzzzsr        = reverse zzzsr
firsts ps           = [x| (x,_)<- ps]
seconds ps          = [y| (_,y)<-ps]
strTups :: [([Char],[Char])] -- interpretor returns:  strTups :: [([Char], String)] changed it here to make (a,b) same typeclass as (b,a) 
strTups = zip (firsts zzzs)  [show x|x <-(seconds zzzs)] -- strTups :: [([Char], String)] need to change [Char] -> String so that the Tup is [(String),(String)] or I should change String so that it reads [([Char],[Char])].
oTups = [ (y,x) | (x,y)  <-strTups, x =="o"]
fbzMix =  [if fst (x,y)=="o" then swap'(x,y)else (x,y) | (x,y) <-strTups ] 
fbzMixR = reverse (firsts fbzMix) 
{--------------------------------- 

["1","2","fz","4","bz","fz","7","8","fz","bz","11","fz","13","14","fbz","16","17","fz","19","bz","fz","22","23","fz","bz","26","fz","28","29","fbz","31","32","fz","34","bz","fz","37","38","fz","bz","41","fz","43","44","fbz","46","47","fz","49","bz","fz","52","53","fz","bz","56","fz","58","59","fbz","61","62","fz","64","bz","fz","67","68","fz","bz","71","fz","73","74","fbz","76","77","fz","79","bz","fz","82","83","fz","bz","86","fz","88","89","fbz","91","92","fz","94","bz","fz","97","98","fz","bz"]

-----------------------------------
test15	= [x `mod`15==0  |x <-nList]
*Dec18> [x|x<-(firsts strTups),x /= "o"]
["bz","fz","fz","bz","fz","fbz","fz","bz","fz","fz","bz","fz","fbz","fz","bz","fz","fz","bz","fz","fbz","fz","bz","fz","fz","bz","fz","fbz","fz","bz","fz","fz","bz","fz","fbz","fz","bz","fz","fz","bz","fz","fbz","fz","bz","fz","fz","bz","fz"]
*Dec18> [x|x<-(firsts strTups),x == "o"]
["o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o"]
----------------------------------}





{-

let strTups = zip (firsts zzzs)  [show x|x <-(seconds zzzs)]
 
oTups = [ (y,x) | (x,y)  <-zzzs, x =="o"]

[ (y,x) | (x,y)  <-zzzs, x =="o"]

-- [swap'(strTups!!x)|x <-[0..99]]  
an if clause that returns identitiy and a branch that returns "fbz"? 

[ x | x <- [10..20], x /= 13, x /= 15, x /= 19] 


-} 
