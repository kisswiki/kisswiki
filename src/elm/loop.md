Usually, people use loops for three things namely

- You have a collection of things and you'll like to filter out a subset of them based on a predicate
- You have a collection of things and you'll like to transform them into another collection of things
- You have a collection of things and you'll like to reduce them to a single value

https://www.quora.com/Why-dont-pure-functional-programming-languages-provide-a-loop-construct/answer/Chidi-Muorah

## tail-call optimizations

Since version 0.16 elm does tail-call optimizations for self-recursive functions http://elm-lang.org/blog/compilers-as-assistants

So no need for elm-loop? https://groups.google.com/forum/#!topic/elm-discuss/E2mgQnQWD3c

## Why no loop in pure functional programming languages?

> In contrast with the imperative paradigm, where user expresses her logic in term of subsequent operations, FP programs are expressed as a set of facts that the compiler and runtime will strive to keep true (sometime by internally using loops BTW).
>
> Pure functional languages generally do not maintain state, or at the very least, try to not rely on it. That means, generally, there aren't 'variables' -- values can be bound to a name, but you can't change that value later. Loop constructs as used in other languages rely on the concept of changing values to end the loop. Without variables, this can't happen. So no loop constructs.
>
> The loop construction is inherently a low-level expression of an execution strategy that enforces a law and relies on run-time operations sequencing. Hence, it isn't part of the more declarative approach of a FPL.
>
> In the world of pure functions, data is passed into the functions that carry out their work-- they don't reach out to them or depend on them
> - https://www.quora.com/Why-dont-pure-functional-programming-languages-provide-a-loop-construct

Haskell has it? https://hackage.haskell.org/package/loop-while-1.0.0/docs/Control-Monad-LoopWhile.html

## Is using tail-call optimization for recursion, making it loop?

> bad_at_photoshop: recursion is equal in power to looping
> CyRaid: Recursion is not equal in power to loop. It has a slight draw back: Stack
> passwordisINDUCTION: Having a call-stack is not a requirement of recursion. See CPS transformation.
> - https://www.reddit.com/r/programming/comments/2oljb8/myth_of_the_day_functional_programmers_dont_use/
> kqr: I think you have a sort of pre-determined image of what a loop is based on how it is implemented (it needs to be a special language construct, it needs implicitly to mutate the counter variables, the loop body can't be defined in a function body and so on) and not at all how it is used. If there's one lesson I have taken away from programming it's that the public API is what matters, not the implementation.
If you have to go into the language and look at the implementation of a loop before you can conclude whether it's actually a loop or not, I think you're not making a useful distinction anymore. What should be interesting is how you use the construct, not how it is implemented. Do you use it like a loop? Then it is a loop!
> - https://www.reddit.com/r/programming/comments/2oljb8/myth_of_the_day_functional_programmers_dont_use/cmq147c
