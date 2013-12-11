module Factorial where
    factorial :: Double -> Double
    factorial 0 = 1
    factorial x = x * factorial (x - 1)
