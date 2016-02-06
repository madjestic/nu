{-# LANGUAGE Arrows #-}
module Main where

import Prelude hiding (id, (.))
import Control.Category
import Control.Arrow
import FRP.Yampa
import Graphics.Gloss
import qualified Graphics.Gloss.Interface.IO.Game as G
import Buttons
import GlossInterface

mainSF :: SF (Event G.Event) Picture
mainSF = proc e ->
  do
    let click0  = ((Just Click  ==) . filter0) `filterE` e
    count0 <- accumHold 0 -< ((+1) <$ click0)
    returnA -< renderButtons count0 Nothing

main :: IO ()
main =
    playYampa
        (InWindow "Yampa Example" (320, 240) (800, 200))
        white
        30
        mainSF
