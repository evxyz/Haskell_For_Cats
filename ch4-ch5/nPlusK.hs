module NplusK where
factorial 0             = 1
factorial (n + 1)       = (*) (n + 1) (factorial n)