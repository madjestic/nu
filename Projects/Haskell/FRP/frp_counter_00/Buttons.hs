module Buttons where

import Data.Monoid
import Graphics.Gloss
import Graphics.Gloss.Data.Extent
import Graphics.Gloss.Interface.Pure.Game
import Text.Printf


buttonC0 :: Extent
buttonC0  = makeExtent   35     5  (-60) (-140)

-- Button rendering

renderButtons :: Int -> Maybe Int
              -> Picture
renderButtons count0  advancedCount0
    = renderButton buttonC0  (unify count0  advancedCount0)

unify :: Int -> Maybe Int -> String
unify n Nothing               = show n
unify n (Just n') | n == n'   = show n
                  | otherwise = printf "%d != %d" n n'

renderButton :: Extent -> String -> Picture
renderButton ex s = color azure bg <> color white fg
  where
    bg = polygon (cornerPoints ex)
    fg = translate x y
       $ uscale 0.1
       $ translate (-180) (-50)  -- vertically centered, random x offset :(
       $ text s
    (x, y) = coord2point (centerCoordOfExtent ex)


uscale :: Float -> Picture -> Picture
uscale v = scale v v

coord2point :: Coord -> Point
coord2point (x,y) = (fromIntegral x, fromIntegral y)

cornerCoords :: Extent -> [Coord]
cornerCoords ex = [(w,n), (e,n), (e,s), (w,s)]
  where
    (n, s, e, w) = takeExtent ex

cornerPoints :: Extent -> [Point]
cornerPoints = map coord2point . cornerCoords

-- Button events

data ButtonClick = Click  deriving (Show, Eq)

isClickedBy :: Extent -> Event -> Bool
isClickedBy ex (EventKey (MouseButton LeftButton) Down _ p) = pointInExtent ex p
isClickedBy _ _ = False

filter0 :: Event -> Maybe ButtonClick
filter0 e | buttonC0 `isClickedBy` e = Just Click
          | otherwise                = Nothing
