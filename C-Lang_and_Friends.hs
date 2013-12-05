-- the set of common programming languages (as compiled by Tiobe), that are wholly or in part derived from the C programming language.

-- list of tuples that are Char + Float
-- Sum the percentages for a total. --

[("c",18.155), ("java",16.521), ("objective_c",9.406), ("c++",8.369), ("c#",6.024), ("bash",0.475), ("c_shell",0.445), ("lua",0.425), ("scala",0.292), ("go",0.214)]
{-
ghci> (unzip cList) (["c","java","objective_c","c++","c#","bash","c_shell","lua","scala","go"],[18.155,16.521,9.406,8.369,6.024,0.475,0.445,0.425,0.292,0.214])
-- Of the set of common programming languages, 60.326 percent are directly derived from C.
ghci> sum(snd(unzip cList))
60.326
-}

-- the set of common programming languages (as compiled by Tiobe), that are wholly or in part derived from the Lisp language.
-- list of tuples that are Char + Float
-- > let 
lList = [ ("Lisp",      0.706), ("F#",     0.498), ("Common_Lisp",    0.387), ("Scheme",     0.354), ("Haskell",    0.250), ("Ruby", 1.303),("JavaScript", 2.050) ]
-- Prelude> 
sum(snd(unzip lList))
-- 5.548

{----------------------}  ML      0.234%  {----------------------}  Prolog        0.335%  -- Big list of Tuples that are composed of Char + list of Integers -- Sum this list of Ints -- average  list of Ints -- then sort ascending [ (C,       [1, 2,  1,  1]), (Java,     [2, 1,  4,  0]), (Objective_C,  [3, 38, 0,  0]), (C++,      [4, 3,  2,  6]), (C#,       [5, 7,  0,  0]), (PHP,      [6, 5,  0,  0]), (Visual_Basic, [7, 4,  5,  5]), (Python,   [8, 6,  29, 0]), (Transact_SQL, [9, 45, 0,  0]), (JavaScript,   [10,    10, 14, 0]), (Lisp,     [15,    21, 17, 3]), (COBOL,        [19,    17, 3,  12]), (Ada,     [22,    23, 18, 2]) ]