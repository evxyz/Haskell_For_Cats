ghci>:i Num
class Num a where
  (+) :: a -> a -> a
  (*) :: a -> a -> a
  (-) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
        -- Defined in `GHC.Num'
instance Num Integer -- Defined in `GHC.Num'
instance Num Int -- Defined in `GHC.Num'
instance Num Float -- Defined in `GHC.Float'
instance Num Double -- Defined in `GHC.Float'
---------------------------------------------------------------
ghci>:i Integer
data Integer
  = integer-gmp:GHC.Integer.Type.S# GHC.Prim.Int#
  | integer-gmp:GHC.Integer.Type.J# GHC.Prim.Int# GHC.Prim.ByteArray#
        -- Defined in `integer-gmp:GHC.Integer.Type'
instance Enum Integer -- Defined in `GHC.Enum'
instance Eq Integer -- Defined in `integer-gmp:GHC.Integer.Type'
instance Integral Integer -- Defined in `GHC.Real'
instance Num Integer -- Defined in `GHC.Num'
instance Ord Integer -- Defined in `integer-gmp:GHC.Integer.Type'
instance Read Integer -- Defined in `GHC.Read'
instance Real Integer -- Defined in `GHC.Real'
instance Show Integer -- Defined in `GHC.Show'
---------------------------------------------------------------
ghci>:browse GHC.Real
(GHC.Real.%) :: Integral a => a -> a -> GHC.Real.Ratio a
class Num a => Fractional a where
  (/) :: a -> a -> a
  recip :: a -> a
  fromRational :: Rational -> a
class (Real a, Enum a) => Integral a where
  quot :: a -> a -> a
  rem :: a -> a -> a
  div :: a -> a -> a
  mod :: a -> a -> a
  quotRem :: a -> a -> (a, a)
  divMod :: a -> a -> (a, a)
  toInteger :: a -> Integer
data GHC.Real.Ratio a = !a GHC.Real.:% !a
type Rational = GHC.Real.Ratio Integer
class (Num a, Ord a) => Real a where
  toRational :: a -> Rational
class (Real a, Fractional a) => RealFrac a where
  properFraction :: Integral b => a -> (b, a)
  truncate :: Integral b => a -> b
  round :: Integral b => a -> b
  ceiling :: Integral b => a -> b
  floor :: Integral b => a -> b
(^) :: (Num a, Integral b) => a -> b -> a
(GHC.Real.^%^) :: Integral a => Rational -> a -> Rational
(^^) :: (Fractional a, Integral b) => a -> b -> a
(GHC.Real.^^%^^) :: Integral a => Rational -> a -> Rational
GHC.Real.denominator :: Integral a => GHC.Real.Ratio a -> a
even :: Integral a => a -> Bool
fromIntegral :: (Integral a, Num b) => a -> b
gcd :: Integral a => a -> a -> a
GHC.Real.gcdInt :: Int -> Int -> Int
GHC.Real.infinity :: Rational
GHC.Real.integralEnumFrom :: (Integral a, Bounded a) => a -> [a]
GHC.Real.integralEnumFromThen ::
  (Integral a, Bounded a) => a -> a -> [a]
GHC.Real.integralEnumFromThenTo :: Integral a => a -> a -> a -> [a]
GHC.Real.integralEnumFromTo :: Integral a => a -> a -> [a]
lcm :: Integral a => a -> a -> a
GHC.Real.notANumber :: Rational
GHC.Real.numerator :: Integral a => GHC.Real.Ratio a -> a
GHC.Real.numericEnumFrom :: Fractional a => a -> [a]
GHC.Real.numericEnumFromThen :: Fractional a => a -> a -> [a]
GHC.Real.numericEnumFromThenTo ::
  (Ord a, Fractional a) => a -> a -> a -> [a]
GHC.Real.numericEnumFromTo ::
  (Ord a, Fractional a) => a -> a -> [a]
odd :: Integral a => a -> Bool
GHC.Real.ratioPrec :: Int
GHC.Real.ratioPrec1 :: Int
realToFrac :: (Real a, Fractional b) => a -> b
GHC.Real.reduce :: Integral a => a -> a -> GHC.Real.Ratio a
GHC.Real.showSigned :: Real a => (a -> ShowS) -> Int -> a -> ShowS

