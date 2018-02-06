>You can obtain similar quality in a C modern code-base, using tools like static and dynamic analyzers. In fact, today the hardest issues came from multi-threading. I won't even dare to write multi-threading apps without helgrind/TSAN.
And Rust doesn't help in this regard. From: https://doc.rust-lang.org/nomicon/races.html 'So it's perfectly "fine" for a Safe Rust program to get deadlocked or do something incredibly stupid with incorrect synchronization.'
>
>-- https://news.ycombinator.com/item?id=13317147

##

I cannot say the same due to lack of support for GUI toolkits, the way the borrow checker handles callbacks, or mixed debugging support.

What specifically do you mean by "the way the borrow checker handles callbacks"?

It is described in the Non-lexical lifetimes RFC under "Closure desugaring".

https://github.com/nikomatsakis/nll-rfc/blob/master/0000-nonlexical-lifetimes.md

Basically if you have a struct to represent, lets say a Window, and inside of it try to reference instance variables on a closure that would handle a button click for example, self will be moved.
There are a few workarounds, but all of them are less ergonomic than any mainstream GUI toolkit.

https://news.ycombinator.com/item?id=15051940

##

I like Rust so far, but there's a few things I think aren't true:
* That Rust is only harder because it enforces 'correctness.' It certainly is harder because it enforces correctness, but it's also harder because of how. I'm not saying there's a better approach to this, but I think a lot of people are implying that there isn't, and I don't think that's a safe assumption. I think that we could find ways to make equally memory-safe languages that go about enforcing safety in entirely different manners than with ownership and lifetime semantics.

* In fact, the entire idea that Rust enforces correctness. Only if your definition of 'correctness' to be memory-safety, but I would normally define 'correctness' to include rigorous mathematical proofs. Rust's safety guarantees are often accidentally blown out of proportion; they mainly aid in preventing security and concurrency bugs, but only a certain class of each. This is still useful, but this caveat really needs to be in your face more often, as a lot of people will not mention it when touting the benefits of Rust, and beginners can get easily confused about what exactly Rust prevents you from doing.

* The idea that Rust's approach is always worth the trade-offs. Go is another programming language I like, and there are definitely things that are simply easier to write in Go with few disadvantages. Fearless concurrency is a wonderful feature, but for embarrassingly parallel problems like, often, web servers, where each thread is usually independent in terms of mutable state, Go works wonderfully. It also lets you shoot yourself in the foot in a way that Rust wouldn't, but often for a lot of simpler apps it still ends up being easier.

* The idea that solving the compiler errors makes you understand the problems correctly. For example, you could always just clone memory at every occasion, return the input instead of borrowing, etc. In fact, these things might be easier for a beginner to do. There will probably be a ton of Rust anti-patterns that come about from trying to resolve compiler errors.

https://news.ycombinator.com/item?id=16202373