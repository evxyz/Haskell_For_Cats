(!!) :: [a] -> Int -> a 	-- Defined in `GHC.List'
($) :: (a -> b) -> a -> b 	-- Defined in `GHC.Base'
infixr 0 $
($!) :: (a -> b) -> a -> b 	-- Defined in `Prelude'
infixr 0 $!
(&&) :: Bool -> Bool -> Bool 	-- Defined in `GHC.Classes'
infixr 3 &&
class Num a where
  ...
  (*) :: a -> a -> a
  ...
  	-- Defined in `GHC.Num'
infixl 7 *
class Fractional a => Floating a where
  ...
  (**) :: a -> a -> a
  ...
  	-- Defined in `GHC.Float'
infixr 8 **
class Num a where
  (+) :: a -> a -> a
  ...
  	-- Defined in `GHC.Num'
infixl 6 +

(++) :: [a] -> [a] -> [a] 	-- Defined in `GHC.Base'
infixr 5 ++
class Num a where
  ...
  (-) :: a -> a -> a
  ...
  	-- Defined in `GHC.Num'
infixl 6 -

.
/
/=
<
<=
=<<
==
>
>=
>>
>>=
Bool
Bounded
Char
Double
EQ
Either
Enum
Eq
False
FilePath
Float
Floating
Fractional
Functor
GT
IO
IOError
Int
Integer
Integral
Just
LT
Left
Maybe
Monad
Nothing
Num
Ord
Ordering


abs :: Num a => a -> a -- Defined in `GHC.Num'       
all :: (a -> Bool) -> [a] -> Bool -- Defined in `GHC.List'        
and :: [Bool] -> Bool   -- Defined in `GHC.List'
any :: (a -> Bool) -> [a] -> Bool       -- Defined in `GHC.List'
asTypeOf :: a -> a -> a         -- Defined in `GHC.Base'
appendFile :: FilePath -> String -> IO ()
        -- Defined in `System.IO'
break :: (a -> Bool) -> [a] -> ([a], [a])  -- Defined in `GHC.List'
ceiling :: (Integral b, RealFrac a) => a -> b -- Defined in `GHC.Real' 
compare :: Ord a => a -> a -> Ordering -- Defined in `GHC.Classes'
