---
title: On Purity vs. Impurity in haskell.
---

#### On Purity vs Impurity in Haskell
\

*"`IO ()` type signature is like a\ "Danger: Minefield!" sign - it does not mean that everywhere you step there's going to be a mine, but there can be a mine somewhere".*
<p style="text-align:right;"> \(c\) hoknamahn, a XXII century philosopher.</p>

\
\
That's in short. The whole story, however,  is a little bit more complicated and goes somewhere along the lines the conversation I had on #haskell-beginners@freenode some time ago:
\
\

**Me:** I am trying to understand the concept of purity, and though, on
the surface, the distinction seems obvious, there seems to be
cases, where things are not so blunt as " `IO ()` means *impure*",
isn't it?

For example, if pure = ref.transparent + no side effects [(a definition from the wiki)
](https://en.wikipedia.org/wiki/Pure_function), then `fakeIO = return () :: IO ()` - does not it qualify as pure, even though its type is `IO ()`?  It has no side effects, it always return the same value, it is, presumably, ref.transparent.

If ```readLn``` is obviously *impure*, is not ```putStrLn "Hello"```, in a sense, pure? I guess it's *impure*, since it can be printed in different ways (via various output devices), is it why it's *impure*? It always returns the same value and its side effect
seems limited by printing - can impurity of putStrLn lead to
rocket launch from a Moon-base somehow?

**MarcelineVQ**: IO is pure, you'll be happy to know. The difference between `f :: String` and  `f :: IO String` is that the first is a value of String and the second is an action that may result in a `String` when executed, haskell separates evaluation and execution, so both of these things are as pure as any other Haskell value in your code. `getLine :: IO String` contains a `String` in the same way that `/bin/ls` contains a list of files.

You may see `IO` called *impure* sometimes, however IO is entirely pure. For example something like  `putStrLn "foo" :: IO ()` describes a recipe for writing some output to the outside world, this recipe is pure, any `putStrLn "foo" :: IO ()` are always the same recipe and working with the recipe has no side effects. Haskell separates evaluation and execution, we can combine and modify recipes all we like **[evaluation]** and it's not until we're baking the cake **[execution]** that side effects would even be possible.

The story is a little more complicated than that, but does this make sense as an idea?

**Me:**: does it mean that a function can be *pure* during evaluation, but when executed it may be *impure* (have sideefects)?

**MarcelineVQ**: That's a great question, I'm not firm enough on the terminology to say for sure now that you've asked.

**dmwit**: Everything (okay, almost everything) in Haskell is referentially transparent, even terms of type IO Whatever.
Different people mean different things by "*pure*", but referentially transparent has a solid, technical definition.

**Me:** Thanks.  I guess now I need to better understand what are sideeffects (SEs) then.  Let's say that SE is some sort of interaction with the world (like reading a file or printing to the screen (that changes the state of the videodriver, which draws something on the screen as a result)) - but where do you draw the line then? I.e.: is not everything an interaction with the world? Say, thunks are being generated - does not it change the state of RAM, hence interaction with the world, hence it's a SE?

**ab9rf**: Mmost of the time, we pretend that "processor state" doesn't exist 

**Me:**: So, every other change of state outside of "processor state" can be considered as a SE?

**ab9rf**: And so the "side effects" of making the processor do things, allocating memory, and so forth are ignored. we blithely assume that the processor will not malfunctio and that the runtime will not run out of memory.

Consider whatever you want to be a "side effect" :)

I think it's better to approach this abstractly. Instead of spending a great deal of energy cataloging and categorizing the microscoping activities of the runtime system.

**Me:**: I would like to settle on some solid ground here, if possible - I
don't want to think of it as a matter of taste

**jle**: side-effect is basically a concept that applies differently in every context, there's no 'universal' definition; it's pretty much context. Basically, you get to define the world you are talking about, and in doing that you define what side effects are and what non-side-effects are 

**Me**: Nice, I like that! My next question after "what is *pure*, what is SE" would be: "what is **world**?" :)

**jle**: right, the definition of world also depends on the context. It's sort of like picking the primitives of your deontation, think of it like the idea of 'universe' in set theory, there is no absolute idea of universe, just whatever is useful for what theorem or conclusion you are trying to prove or figure out.

**Cale_:**: It might all be much clearer if Haskell still had a formally
specified [denotational semantics](https://en.wikipedia.org/wiki/Denotational_semantics) (in principle it does, but in practice, nobody's gone to the trouble since the very early versions)

**jle**: even if haskell had a formally defined [denotational semantics](https://en.wikipedia.org/wiki/Denotational_semantics), you can still talk about your own mini denotative semantics in an EDSL you write, so you have a completely different idea of universe, sideeffects, etc.

**Cale_:** Sure. 

**Me:** Interesting

**Cale_:** I just mean, what people are usually talking about when they say "side effect" of a program is any behaviour of the program which we care about, but which isn't captured by discussing values (in the sense of denotations of programs)

**Me:** "still had a formally specified " - was it specified before?

**Cale_:** Yeah, I think someone did Haskell 1.0. Or some core language of Haskell 1.0, and then other stuff was handled by translation into that core. An interesting thing is that by encoding effects into a type like IO, we turn things which would have been side-effects into values to some extent - though what can be understood denotationally about IO actions is still rather shallow (Conal Elliott has likened it to a syntax-level encoding, and that's mostly right). 

It still gives us a language with which to discuss equations between IO actions, but it doesn't really tell us anything about what nontrivial equations might exist. For that, we'd need some machine model still -- and so it becomes about the same as any imperative language. But still, you can maintain a distinction between evaluation of Haskell expressions, and execution of IO actions, and in ordinary Haskell programs, evaluation has no side effects, (while execution exists to carry out the effects described by the IO actions, so it seems strange to call them side effects at that point)
\
*(getting off my train, headed to the airport bound for London for Haskell eXchange)*
\
\
*The communication ends here.*


