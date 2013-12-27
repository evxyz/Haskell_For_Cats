-- !! to run this ---> runhaskell helloworld.hs
{-# LANGUAGE TypeFamilies, QuasiQuotes, MultiParamTypeClasses, TemplateHaskell, OverloadedStrings #-}
import Yesod
data Links = Links
mkYesod "Links" [parseRoutes| / HomeR GET
/page1 Page1R GET
/page2 Page2R GET |]
instance Yesod Links
getHomeR = defaultLayout [whamlet|<a href=@{Page1R}>Go to page 1!|]
getPage1R = defaultLayout [whamlet|<a href=@{Page2R}>Go to page 2!|] 
getPage2R = defaultLayout [whamlet|<a href=@{HomeR}>Go home!|]
main = warp 3000 Links
