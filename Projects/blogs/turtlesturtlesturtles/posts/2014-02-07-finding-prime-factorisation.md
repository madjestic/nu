---
title: Finding Prime Factorisation
---

## Finding Prime Factorisation
\
\
Here's a small textbook excercise that I decided to turn into a haskell program:

```haskell
-- | factorize1 function is an interface to factorize function
factorize1 :: (Integral b, RealFrac a) => a -> [b]
factorize1 n = map round $ factorize n 2

-- | factorize requires an index k (since we can't use variables)
factorize :: RealFrac a => a -> a -> [a]
factorize n k
          | k >= n = n : []
          | n `isDivisableBy` k          = k : factorize (n/k) k
          | n `isDivisableBy` k == False = factorize n (k+1)

```
\
\

And a small supporting function that returns True if the product is a full number,
and False otherwise


```haskell
isDivisableBy :: RealFrac a => a -> a -> Bool
isDivisableBy n m = let fullNumber = fromInteger $ round (n/m)
                    in (n/m) == fullNumber

```
\
\
Example output:

```
> factorize1 1000645
[5,29,67,103]

```
\
\
Hope you enjoyed it as I did :)

[source files on GitHub](https://github.com/madjestic/TinyMath)
