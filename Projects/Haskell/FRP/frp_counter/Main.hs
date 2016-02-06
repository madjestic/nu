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
    let
        click0 = ((Just Click ==) . filter0) `filterE` e
        toggle0 = ((Just Toggle ==) . filter0) `filterE` e
        
    mode0 <- accumHold True -< not <$ toggle0 

    -- ---------------------------
    -- First order implementation
    -- ---------------------------
    count0 <- accumHold 0 -< mergeBy (.) (const 0 <$ toggle0) ((+1) <$ click0)

    let
        show0 = if mode0 then count0 else -1

    -- ---------------------------
    -- Higher order implementation
    -- ---------------------------

    -- Every toggle event causes switch of counters, 
    -- with every counter is newly created.
    let newCounter0 = if mode0 then  counter else arr $ const (-1)
    dynamic0 <- rSwitch counter -< (click0, newCounter0 <$ toggle0)

    -- Every toggle event causes switch of a counter, 
    -- with one counter reused.

    returnA -< 
        renderButtons
            show0 (Just dynamic0)
  where
    counter = proc e -> accumHold 0 -< (+1) <$ e




main :: IO ()
main =
    playYampa
        (InWindow "Yampa Example" (320, 240) (800, 200))
        white
        30
        mainSF
