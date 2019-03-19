https://gist.github.com/bobzhang/9f27a5a0bd730e8d3503bf5d058a58a7

```elm
loop i =
    if i >= lmt then i else
    loop (i + 1) in loop n
```

## About

Usually, people use loops for three things namely

- You have a collection of things and you'll like to filter out a subset of them based on a predicate
- You have a collection of things and you'll like to transform them into another collection of things
- You have a collection of things and you'll like to reduce them to a single value

https://www.quora.com/Why-dont-pure-functional-programming-languages-provide-a-loop-construct/answer/Chidi-Muorah

> If we ask how to iterate in a functional language, the answer is already there: functions or even expressions (in a lazy language) can refer to themselves, giving us unbounded iteration for free. If we ask how to do that with an imperative set of statements, the answer has to be added in—either we have a way of jumping around our set of statements or, since that proves unruly, we have special language constructs expressly designed to iterate. Loops are a purely synthetic solution to the question of iteration: to iterate, we throw in a language construct that says "iterate". A bit of deus ex machina where the language designer, appropriately enough, gets to play god.
> Map, filter, fold and friends package up common recursive patterns into library functions that are easier to use than direct recursion and signal intent. When you see a map, you know that it will apply a function to every element in a list and nothing more. Moreover, when you use map, you know the iteration is going to be correct—you can't make off-by-one errors or skip elements in the list.
> - https://www.quora.com/Why-dont-pure-functional-programming-languages-provide-a-loop-construct

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

Loop in Haskell

- https://hackage.haskell.org/package/loop-while-1.0.0/docs/Control-Monad-LoopWhile.html
- https://doingmyprogramming.com/2014/08/08/haskell-doesnt-have-loops/
- https://www.rosettacode.org/wiki/Loops/While#Haskell

## Is using tail-call optimization for recursion, making it loop?

> the only major change is that we explicitly pass the result as an argument instead of relying on it implictly sticking around between iterations.
> Well, there's two parts to this. First of all – plenty of the loops I write professionally use state as an implementation detail, but they are not stateful from the outside. They are enclosed in completely pure functions. Those loops do not "make no sense", they are still highly useful and they would be just as useful if implemented with a fold loop instead of a procedural foreach loop.
The second part is that "eliminate mutable state" is also half a misconception. Most pure FP languages are pure not because they don't have state at all, but because they make the state transformations explicit. As it says in the submitted article, fold loops do exactly the same thing as foreach loops, except instead of implicitly use the state from the last iteration they explicitly pass the state to the new iteration as a function argument. There's still state changing between iterations, only now it's explicit what you expect to change between each iteration.
What do you mean by folds "being" recursion? Where in the examples in the article do you see anything calling itself? A fold can be implemented through jump instructions or through call instructions. Both are valid, and given any decent compiler It's highly likely that it is implemented with jump instructions. You're making a (possibly false) assumption about the implementation. Making assumptions in line with your opinion to prove a point is begging the question.
To me, "use recursion" means writing a function that will call itself.
> - https://www.reddit.com/r/programming/comments/2oljb8/myth_of_the_day_functional_programmers_dont_use/cmqmay4

> bad_at_photoshop: recursion is equal in power to looping
> CyRaid: Recursion is not equal in power to loop. It has a slight draw back: Stack
> passwordisINDUCTION: Having a call-stack is not a requirement of recursion. See CPS transformation.
> - https://www.reddit.com/r/programming/comments/2oljb8/myth_of_the_day_functional_programmers_dont_use/
> kqr: I think you have a sort of pre-determined image of what a loop is based on how it is implemented (it needs to be a special language construct, it needs implicitly to mutate the counter variables, the loop body can't be defined in a function body and so on) and not at all how it is used. If there's one lesson I have taken away from programming it's that the public API is what matters, not the implementation.
If you have to go into the language and look at the implementation of a loop before you can conclude whether it's actually a loop or not, I think you're not making a useful distinction anymore. What should be interesting is how you use the construct, not how it is implemented. Do you use it like a loop? Then it is a loop!
> - https://www.reddit.com/r/programming/comments/2oljb8/myth_of_the_day_functional_programmers_dont_use/cmq147c
