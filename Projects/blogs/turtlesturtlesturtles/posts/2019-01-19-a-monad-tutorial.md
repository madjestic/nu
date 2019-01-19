---
title: A Monad Tutorial
---

#### Let's face it: all monad tutorials suck.  So here's another one:
\
The term "Monad" come from mathematics, which exact meaning is irrelevant to programming in haskell.

<div class="small"> 
*Here's the synopsis, but you really don't need to read it:*

*A monad is a special case of a monoid.  
A monoid is a mathematical structure: 
(set of values + some operator + identity element).  
Thus, (idea of) monad is related (loosely) to the (idea of a) function, defined over a set of elements, while identity element is required for mathematical consistency.*

*Why bother giving such a fancy explanation for something which looks awefully like an ordinary function then?*

*Such interpretation of (the idea of) a function comes with a bonus from mathematics, as an algebra, allowing various code gurantees as well as 'mathematically correct' composability with other abstractions, which come with their own algebras and guarantees as well as 'mathematematically correct'... ad ifinitum.  If you think that you need to know more - look up Set Theory and Category Theory.*
</div>


Here's what it means in practice:
The ifamous  `>>=` helps us pass non-monadic values to functions without leaving a monad. In the case of the Maybe monad, the monadic aspect is the qualifier that we don't know with certainty whether the value will be...  IO monad gives as a practical way to compose functions which does not make you want to pull your hair out.  

In other words we sequence functional transofrmations of values in an intuitive form.  It allows us to write complex functions in such a way, that instead of a horrible nested mess, we get a simple set of imperative statements.  We are syntactically chaining functions together.  

*It's really a very basic idea, there's not much to it, but it's a fleeting simplicity*:\
It's a powerful building-block to write programs.
It's just a monoid in the category of endofunctors.
It's a burrito.
\
\

```haskell
regularBurrito :: ()
regularBurrito = ()

```
```haskell
monadicBurrito :: IO ()
monadicBurrito =
  do
  ...stuff...
    return ()
```    

and then, instead of
```haskell
stomack = regularBurrito
```
you can write
```haskell
stomack <- monadicBurrito
```
which is much more appropriate, is not it?  It becomes much more obvious if we need to compose multiple functions over a value.

```haskell

-- | let x = foo in x + 3          corresponds to      (\x -> x + 3) foo
-- | x <- foo; return (x + 3)      to     foo >>= (\x -> return (x + 3))

displayResult :: Maybe Int -> String
displayResult mx = maybe "There was no result" (("The result was " ++) . show) mx   
              
-- | fromMaybe 0 (Just 1) - interesting example of Maybe and extracting
-- | values from Just   

add :: Maybe Int -> Maybe Int -> Maybe Int
add mx my =
  mx >>= (\x -> my >>= (\y -> return (x + y)))

-- | is equivalent to the following:
add' :: Maybe Int -> Maybe Int -> Maybe Int
add' mx my = do
  x <- mx
  y <- my
  return (x + y)
  

main = undefined
```

P.S. I probably stole bits and pieces from somebody, so if you need a credit or think that I lied somewhere and think that there should be a correction, please, feel free to ping me.
