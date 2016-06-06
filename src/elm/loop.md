Usually, people use loops for three things namely

- You have a collection of things and you'll like to filter out a subset of them based on a predicate
- You have a collection of things and you'll like to transform them into another collection of things
- You have a collection of things and you'll like to reduce them to a single value

https://www.quora.com/Why-dont-pure-functional-programming-languages-provide-a-loop-construct/answer/Chidi-Muorah

## tail-call optimizations

Since version 0.16 elm does tail-call optimizations for self-recursive functions http://elm-lang.org/blog/compilers-as-assistants

So no need for elm-loop? https://groups.google.com/forum/#!topic/elm-discuss/E2mgQnQWD3c

## Why no loop in pure functional programming languages?

> Pure functional languages generally do not maintain state, or at the very least, try to not rely on it. That means, generally, there aren't 'variables' -- values can be bound to a name, but you can't change that value later. Loop constructs as used in other languages rely on the concept of changing values to end the loop. Without variables, this can't happen. So no loop constructs.
> - https://www.quora.com/Why-dont-pure-functional-programming-languages-provide-a-loop-construct

Haskell has it? https://hackage.haskell.org/package/loop-while-1.0.0/docs/Control-Monad-LoopWhile.html
