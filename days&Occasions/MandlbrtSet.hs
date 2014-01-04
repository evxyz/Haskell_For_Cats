module Mandlbrt where 

import Data.Complex

mandelbrot a = iterate (\z -> z^2 + a) a !! 500

main = mapM_ putStrLn [[if magnitude (mandelbrot (x :+ y)) < 2 then '*' else ' '
                           | x <- [-2, -1.9685 .. 0.5]]
                           | y <- [1, 0.95 .. -1]]
