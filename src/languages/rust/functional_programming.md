> HKT won't give Rust the magical ability to actually express "monads" either.
> One could even argue that Rust can't express FP because it doesn't have "functions" in t hat sense, only "procedures" with typeclasses to abstract over them and data structures. In fact, the only language feature that really qualifies as "functional" is closures, mainly used to parametrize imperative-procedural abstractions and contraptions (as sugar, if you will), instead of being directly composed.
> Rust is not, and will never be Haskell or F#: you may be able to borrow some good things, but certainly not everything.
> At the end of the day, FP cargo-culting is just as bad as its OOP cousin, and therein lies the irony of XY: why are you following a big-idea design pattern to solve your problem instead of attacking the problem directly, in a sugary imperative world?
> -- https://www.reddit.com/r/rust/comments/52jzyp/trylike_macro_that_shows_alternative/d7lk7zh

##

I hit some reliability issues caused by my use of elegant recursion which unfortunately leaks memory in Rust because it uses scope-based memory management and does not (yet) support tail call elimination. The workaround, rewriting recursive functions as loops with mutable loop variables, is grim and makes the code much harder to understand and check by inspection.

Finally, performance was lackluster. After weeks of work I was able to get the Rust up to par with respect to functional languages but I never managed to make it significantly faster in the general case: sometimes it was 3x faster but other times 3x slower. This problem was that the hashed data structures in Rust’s standard library are designed to be cryptographically secure rather than fast.

https://www.quora.com/What-do-functional-programmers-think-of-the-Rust-language