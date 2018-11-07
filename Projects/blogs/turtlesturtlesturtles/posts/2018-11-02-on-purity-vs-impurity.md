---
title: On Purity vs. Impurity in haskell.
---

## This is some working material for the future post
\
\

   me > I am trying to understand the concept of purity, and though, on
    the surface, the distinction seems obvious, there seems to be
    cases, where things are not so blunt as " `IO ()` means impure",
    isn't it?
   me > e.g. if pure = ref.transparent + no side effects, then ```fakeIO
       = return () :: IO ()``` - does not it qualify as pure, even though
       it's IO ()?  It has no side effects, it always return the same
       value, it is, presumably, ref.transparent.
   me > if ```readLn``` is obviously impure, is not ```putStrLn
       "Hello"```, in a sense, pure?  I guess it's impure, since it can
       be printed in different ways (via various output devices), is it
       why it's impure?
   me > otherwise it always returns the same value and its side effect
       seems limited by printing - can impurity of putStrLn lead to
       rocket launch from a Moon-base somehow?
   <MarcelineVQ> IO is pure, you'll be happy to know. The difference
       between f :: String and  f :: IO String is that the first is a
       value of String and the second is an action that may result in a
       String when executed, haskell separates evaluation and execution,
       so both of these things are as pure as any other Haskell value in
       your code
   <MarcelineVQ> @quote /ls
   <lambdabot> shachaf says: getLine :: IO String contains a String in
       the same way that /bin/ls contains a list of files
   <MarcelineVQ> You may see IO called impure sometimes, however IO is
       entirely pure. For example something like  putStrLn "foo" :: IO ()
       describes a recipe for writing some output to the outside world,
       this recipe is pure, any putStrLn "foo" :: IO () are always the
       same recipe and working with the recipe has no side
       effects. Haskell separates evaluation and execution, we can
       combine and modify recipes all we like [evaluation] and it's
   <MarcelineVQ> not until we're baking the cake [execution] that side
       effects would even be possible.
   <MarcelineVQ> The story is a little more complicated than that, but
       does this make sense as an idea?
   me > does it mean that a function can be pure during evaluation, but
       when executed it may be impure (have sideefects)?
   <MarcelineVQ> That's a great question, I'm not firm enough on the
       terminology to say for sure now that you've asked.
   <dmwit> madjestic: Everything (okay, almost everything) in Haskell is
       referentially transparent, even terms of type IO Whatever.
   <dmwit> Different people mean different things by "pure", but
       referentially transparent has a solid, technical definition.
   me > thanks.  I guess now I need to better understand what are
       sideeffects (SEs) then.  Let's say that SE is some sort of
       interaction with the world (like reading a file or printing to the
       screen (that changes the state of the videodriver, which draws
       something on the screen as a result)) - but where do you draw the
       line then? I.e.: is not everything an interaction with the world?
       Say, thunks are being generated - does not it change the
   me > state of RAM, hence interaction with the world, hence it's a SE?
   <ab9rf> madjestic: most of the time, we pretend that "processor state"
       doesn't exist
   me > so every other change of state outside of "processor state" can
       be considered as a SE?
   <ab9rf> and so the "side effects" of making the processor do things,
       allocating memory, and so forth are ignored. we blithely assume
       that the processor will not malfunctio and that the runtime will
       not run out of memory
   <ab9rf> madjestic: consider whatever you want to be a "side effect" :)
   <jle`> side-effect is basically a concept that applies differently in
       every context, there's no 'universal' definition; it's pretty much
       context
   me > I would like to settle on some solid ground here, if possible - I
       don't want to think of it as a matter of taste
   <ab9rf> i think it's better to approach this abstractly
   <jle`> basically you get to define the world you are talking about,
       and in doing that you define what side effects are and what
       non-side-effects are
   me > nice, I like that
   <ab9rf> instead of spending a great deal of energy cataloging and
       categorizing the microscoping activities of the runtime system
   me > coz my next question after "what is pure, what is SE" would be
       "what is world?" :)
   <jle`> it's sort of like picking the primitives of your deontation
   <jle`> right, the definition of world also depends on the context
   <jle`> think of it like the idea of 'universe' in set theory
       left #haskell-beginners: Quit: Konversation terminated!
   <jle`> there is no absolute idea of universe, just whatever is useful
       for what theorem or conclusion you are trying to prove or figure
       out
   <Cale_> It might all be much clearer if Haskell still had a formally
       specified denotational semantics (in principle it does, but in
       practice, nobody's gone to the trouble since the very early
       versions)
   <jle`> even if haskell had a formally defined denotational semantics,
       you can still talk about your own mini denotative semantics in an
       EDSL you write
   <jle`> so you have a completely different idea of universe, side
       effects, etc.
   <Cale_> Sure
       W. Flint)
   me > interesting
   <Cale_> I just mean, what people are usually talking about when they
       say "side effect" of a program is any behaviour of the program
       which we care about, but which isn't captured by discussing values
       (in the sense of denotations of programs)
   me > Cale_: "still had a formally specified denotational semantics" -
       was it specified before?
       realname)
   <Cale_> Yeah, I think someone did Haskell 1.0
   <Cale_> Or some core language of Haskell 1.0, and then other stuff was
       handled by translation into that core
   me > wow, DS seems like yet another world of its own
   me > I wish I got to that sort of stuff at the uni 
   <Cale_> an interesting thing is that by encoding effects into a type
       like IO, we turn things which would have been side-effects into
       values to some extent -- though what can be understood
       denotationally about IO actions is still rather shallow (Conal
       Elliott has likened it to a syntax-level encoding, and that's
       mostly right)
   <Cale_> It still gives us a language with which to discuss equations
       between IO actions, but it doesn't really tell us anything about
       what nontrivial equations might exist
   <Cale_> For that, we'd need some machine model still -- and so it
       becomes about the same as any imperative language
       left #haskell-beginners: Quit: Leaving
   <Cale_> But still, you can maintain a distinction between evaluation
       of Haskell expressions, and execution of IO actions, and in
       ordinary Haskell programs, evaluation has no side effects.
       W. Flint)
   <Cale_> (while execution exists to carry out the effects described by
       the IO actions, so it seems strange to call them side effects at
       that point)
   <Cale_> (getting off my train, headed to the airport bound for London
       for Haskell eXchange)

![](../images/my_image.png)
\
\

[ref name](https://ref_link_addres)
\
My Text
\
previous: [Previous Post](../posts/previous_post_name.html)
