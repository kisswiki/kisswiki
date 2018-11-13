> HKT won't give Rust the magical ability to actually express "monads" either.
> One could even argue that Rust can't express FP because it doesn't have "functions" in t hat sense, only "procedures" with typeclasses to abstract over them and data structures. In fact, the only language feature that really qualifies as "functional" is closures, mainly used to parametrize imperative-procedural abstractions and contraptions (as sugar, if you will), instead of being directly composed.
> Rust is not, and will never be Haskell or F#: you may be able to borrow some good things, but certainly not everything.
> At the end of the day, FP cargo-culting is just as bad as its OOP cousin, and therein lies the irony of XY: why are you following a big-idea design pattern to solve your problem instead of attacking the problem directly, in a sugary imperative world?
> -- https://www.reddit.com/r/rust/comments/52jzyp/trylike_macro_that_shows_alternative/d7lk7zh

##

I hit some reliability issues caused by my use of elegant recursion which unfortunately leaks memory in Rust because it uses scope-based memory management and does not (yet) support tail call elimination. The workaround, rewriting recursive functions as loops with mutable loop variables, is grim and makes the code much harder to understand and check by inspection.

Finally, performance was lackluster. After weeks of work I was able to get the Rust up to par with respect to functional languages but I never managed to make it significantly faster in the general case: sometimes it was 3x faster but other times 3x slower. This problem was that the hashed data structures in Rust’s standard library are designed to be cryptographically secure rather than fast.

https://www.quora.com/What-do-functional-programmers-think-of-the-Rust-language

##

It depends on what you attribute to "functional programming." I would not classify rust as a FP language at all, not even a humble one. To me, for a language to be considered as supporting FP, it makes the following idiomatic, the default, and forces you to go out of your way to avoid them:

immutable data
pure functions / referential transparency
functions are first class
lexical closures
Note I didn't say anything about pattern matching, destructuring, or monads. Those are tools of convenience, not defining qualities of FP.

Rust actually makes those things difficult to achieve. 1 is made difficult by not allowing final / const to be defined by the struct. The rest are all made difficult to achieve because of the borrow checker being the idiomatic default. FP languages usually include a garbage collector for good reason. Between all the lexical closures and the freedom of passing references around by all data being immutable, it becomes very difficult to reason about how long what resources will be held by what components. A GC alleviates a lot of that complexity and allows the programmer to focus on the logic instead of the resources.

https://www.reddit.com/r/rust/comments/7mvxcs/rust_is_a_humble_functional_programming_language/

##

For me, the central value proposition of functional programming is that it tries as hard as possible to eliminate shared mutable state. Most functional languages accomplish this by eliminating the "mutable" part, but Rust achieves it by eliminating the "shared" part. The end result is the same: a language in which you can reason confidently and precisely about how information flows through your program. For this reason, as someone who loves functional programming, I would say that Rust is one of my favorite functional languages, because it satisfies the same need.

https://www.reddit.com/r/rust/comments/9p8rli/is_rust_functional/
