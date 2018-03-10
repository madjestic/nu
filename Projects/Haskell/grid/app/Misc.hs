module Misc where
-- | Bits of potentially useful code, reusable waste

-- | row    positions
gridRows m n = [[m * r .. m * r + m - 1] | r <- [0 .. n - 1]]
-- | λ> gridRows 3 3
-- | [[0,1,2],[3,4,5],[6,7,8]]

-- | redundant, bacaus of:
-- | mathGrid :: (a -> b) -> [[(a, a)]] -> [[(b, b)]]
-- | mathGrid f g = [map (mapT f) x | x <- g]

mapT :: (a -> b) -> (a, a) -> (b, b)
mapT f (a1, a2) = (f a1, f a2)

multGrid :: Double -> [[(Int, Int)]] -> [[(Double, Double)]]
multGrid s grid = [map (mapT ((s*).fromIntegral)) x | x <- grid]

