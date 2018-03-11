module Misc where
-- | Bits of potentially useful code, reusable waste

-- | row    positions
gridRows m n = [[m * r .. m * r + m - 1] | r <- [0 .. n - 1]]
-- | λ> gridRows 3 3
-- | [[0,1,2],[3,4,5],[6,7,8]]

-- | redundant, bacaus of:
-- | mathGrid :: (a -> b) -> [[(a, a)]] -> [[(b, b)]]
-- | mathGrid f g = [map (mapT f) x | x <- g]

type Vec2 = (Double, Double)
type Vec3 = (Double, Double, Double)

mapT :: (a -> b) -> (a, a) -> (b, b)
mapT f (a1, a2) = (f a1, f a2)

multGrid :: Double -> [[(Int, Int)]] -> [[(Double, Double)]]
multGrid s grid = [map (mapT ((s*).fromIntegral)) x | x <- grid]

class Doubles a where
  toDoubles :: a -> [Double]
instance Doubles Vec2 where
  toDoubles :: Vec2 -> [Double]
  toDoubles (x ,y) = [x, y]
instance Doubles Vec3 where
  toDoubles :: Vec3 -> [Double]
  toDoubles (x ,y, z) = [x, y, z]
instance Doubles [Vec2] where
  toDoubles :: [Vec2] -> [Double]
  toDoubles x = undefined

faceVerts i j m n =                  -- face vertices indexes
  [tl, tr, bl, br]
  where
    tl = (gridIDX m n)!!i!!j         -- Top Left
    tr = (gridIDX m n)!!i!!(j+1)     -- Top Right
    bl = (gridIDX m n)!!(i+1)!!j     -- Bottom Right
    br = (gridIDX m n)!!(i+1)!!(j+1) -- Bottom Right
  
