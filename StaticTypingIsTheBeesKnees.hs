{-
Brian Hurt on StaticTyping wapWOut3rdVal 
    He has done 
        70+ KLoC in Clojure
        250+ KLoC in Ocaml
            throw in C,C++,Java etc.

Static Typing is Faster to Working Code
    Working Code = Solves Problems
        written compiled documented in production for the duration. 
    Programming what gets us working code "hopefully"
 
This is independent of theory or aesthetics.

This is not Java type system
    as in not Algol derived  

Static typing as in ML derived 
    Ocaml 
    F#
    Haskell 


1. the little things
finding bugs is quicker
because 
type errors show 
    that they exist 
    the file that the error is in
    what line it is in 
    what column the error starts in 
    a hint as to what the problem is ... 
    at compile time 
        compiler might be off 10x lines 
    
    Time to fix 
        10s of secs
        or tens of minutes 
        
    Unit testing wapWOut3rdVal 
        a bug exits 
        a module or class 
        a manifestation of the bug 
        a stack trace (sometimes to much stack sometimes not enough stack)
        an ability to reduce the bug
            and now the debugging starts 
                and the stepping through it 
            On the plus side it is minutes 
            on the minus Hours and Hours
                just running the test suite takes minutes to ....
        
Static Typing kills Null pointer exceptions 
    
    Haskell has no such thing as a Null Value

        Sir Charles Antony Richard Hoare's   
            billion dollar mistake:
                Speaking at a conference in 2009, Hoare apologized for inventing the null reference: "I call it my billion-dollar mistake. It was the invention of the null reference in 1965. At that time, I was designing the first comprehensive type system for references in an object oriented language (ALGOL W). My goal was to ensure that all use of references should be absolutely safe, with checking performed automatically by the compiler. But I couldn't resist the temptation to put in a null reference, simply because it was so easy to implement. This has led to innumerable errors, vulnerabilities, and system crashes, which have probably caused a billion dollars of pain and damage in the last forty years."
-}
data Maybe a = 
       Just a
      | Nothing -- kind of like a list 
            
find :: (a->bool) -> [a] -> Maybe a  -- note that only the "Maybe a" is optional, a function is still required.

Maybe Int /= Int
-- so : 
(find f [1..100]) + 3 -- is a type error because maybe Int isn't Int
-- solution is 
case (find f [1..100]) of Just x -> x + 3 Nothing -> 77 -- pattern matches and binds values at the same time



