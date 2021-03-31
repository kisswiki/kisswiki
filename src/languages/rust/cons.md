- [Rust is a hard way to make a web API - macwright.com](https://macwright.com/2021/01/15/rust.html)

> You can obtain similar quality in a C modern code-base, using tools like static and dynamic analyzers. In fact, today the hardest issues came from multi-threading. I won't even dare to write multi-threading apps without helgrind/TSAN.
> And Rust doesn't help in this regard. From: https://doc.rust-lang.org/nomicon/races.html 'So it's perfectly "fine" for a Safe Rust program to get deadlocked or do something incredibly stupid with incorrect synchronization.'
>
> -- https://news.ycombinator.com/item?id=13317147

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

- That Rust is only harder because it enforces 'correctness.' It certainly is harder because it enforces correctness, but it's also harder because of how. I'm not saying there's a better approach to this, but I think a lot of people are implying that there isn't, and I don't think that's a safe assumption. I think that we could find ways to make equally memory-safe languages that go about enforcing safety in entirely different manners than with ownership and lifetime semantics.

- In fact, the entire idea that Rust enforces correctness. Only if your definition of 'correctness' to be memory-safety, but I would normally define 'correctness' to include rigorous mathematical proofs. Rust's safety guarantees are often accidentally blown out of proportion; they mainly aid in preventing security and concurrency bugs, but only a certain class of each. This is still useful, but this caveat really needs to be in your face more often, as a lot of people will not mention it when touting the benefits of Rust, and beginners can get easily confused about what exactly Rust prevents you from doing.

- The idea that Rust's approach is always worth the trade-offs. Go is another programming language I like, and there are definitely things that are simply easier to write in Go with few disadvantages. Fearless concurrency is a wonderful feature, but for embarrassingly parallel problems like, often, web servers, where each thread is usually independent in terms of mutable state, Go works wonderfully. It also lets you shoot yourself in the foot in a way that Rust wouldn't, but often for a lot of simpler apps it still ends up being easier.

- The idea that solving the compiler errors makes you understand the problems correctly. For example, you could always just clone memory at every occasion, return the input instead of borrowing, etc. In fact, these things might be easier for a beginner to do. There will probably be a ton of Rust anti-patterns that come about from trying to resolve compiler errors.

https://news.ycombinator.com/item?id=16202373

##

Blow: And so Rust has a good set of ingredients there. The problem that I have with it is when I'm working on really hard stuff, I don't exactly know what I'm doing for a long time. And so if the cost of experimentation is driven too high, it actually impairs my ability to get work done.

https://www.reddit.com/r/rust/comments/evgl81/jonathan_blow_on_rust/

##

"Go is the result of C programmers designing a new programming language, and Rust is the result of C++ programmers designing a new programming language"

- C: 0.73 new features per year, measured by the number of bullet points in the C11 article on Wikipedia which summarizes the changes from C99, adjusted to account for the fact that C18 introduced no new features.
- Go: 2 new features per year, measured by the number of new features listed on the Wikipedia summary of new Go versions.
- C++: 11.3 new features per year, measured by the number of bullet points in the C++17 article which summarizes the changes from C++14.
- Rust: 15 new features per year, measured by the number of headers in the release notes of major Rust versions over the past year, minus things like linters.

##

[V] is a mix between Go and C. Which is what I would want from Rust but Rust is so hard. It gets free no overhead interop with C libs I would want to use.

https://twitter.com/kellabyte/status/1220905816657682432

I’m fascinated at a higher level language that doesn’t have the pain of Rust but has zero overhead with C interop. Big opportunity for infrastructure code.

https://twitter.com/kellabyte/status/1220921730614661126

##

withoutabouts

I’m trying to think of what new syntax we’ve added since 1.0 & all I can come up with is `?`.

Centril

Yeah that’s very hard to answer cause it depends on what you mean by “new syntax”… For example: are trait aliases new syntax? are new attributes new syntax? I suppose unions/const-generics/impl-trait/dyn/const-fn/async/await/try is new syntax… I filed some syntax-bug-fix RFCs that were accepted – those could be new syntax but it would be strange to say so… Raw identifiers come to mind…

It’s hard to understand what constitutes new syntax to various people imo.

H2CO3

Tangential with regards to C++: I do think it’s a valid fear, because Rust recently kept picking up features quicker than C++ as far as I can tell, and I think this rate is going to lead to unsustainable growth. Yes, C++ has a 40-year-old baggage of backward compatibility. But it also started on top of a very small and consistent language (C wasn’t always as quirky and messy as it eventually became trying to support all the exotic, niche platforms of the 70s and 80s). And conversely, Rust also cares a lot about backwards compatibility. So I don’t think that we can just dismiss the issue with hubris and say “but we know better than those lowly C++ guys” :smile: – the issue is real.

I also have a feeling that several (most?) language team members and core developers are generally more than subtly biased in favor of changing and extending the language. That is opposite to the design process of some other languages, e.g. Go was designed by only adding features that the designer could specifically “talk the others into”.

https://internals.rust-lang.org/t/dont-keep-complicating-the-syntax-soft-post-maybe-off-topic-maybe-irrelevant/8768/9

##

Most people have lives outside of Rust and only have a limited amount of time each week to dedicate to reading RFCs and commenting. Even when someone does have plenty of time, they can still get burnt out focusing on just a few really lively RFCs. When a whole truckload of RFCs are shoved through FCP at the same time, people end up only being able to pay attention to some of them, while other RFCs slip by unnoticed. The current situation is borderline ridiculous

https://github.com/rust-lang/rfcs/issues/2142

##

Aside from driver-bound futures like those that use I/O or timers, there are "extra" functions that you need to watch for like yield_now, block_in_place, and block_on - whether you or the libraries you use call them. Depending on the situation, they could cause panics or deadlocks if used improperly, and using multiple runtimes in one project can turn that into a more likely possibility.

https://www.reddit.com/r/rust/comments/eagjyf/using_libraries_depending_on_different_async/

##

This talk will explore some strategies for using with concurrency in Go without the pitfalls.

https://www.youtube.com/watch?v=yKQOunhhf4A

##

FWIW C#'s async/await is the “event loop + state machines” solution, and is pretty much the premier implementation of the feature that other languages have drawn from. The only earlier instance I know of is F#'s “asynchronous workflows.”

Rust’s innovation here is that its state machines are value types- not even C++ has that.

https://users.rust-lang.org/t/on-modern-programming-languages-and-growing-hardware-complexity/14208/44

##

I was also able to complete the task in Rust. I really wanted to like Rust. Rust feels like all of the complexity and difficulty of C++, without much added benefit for simple programs.

Pride

Rust suffers from one of the Seven Deadly Sins. Pride. This manifests in one of two ways. The first is the borrow checker. The second is the approach to performance over simplicity.

In the Rust documentation, they say:

> However, this system does have a certain cost: learning curve. Many new users to Rust experience something we like to call ‘fighting with the borrow checker’, where the Rust compiler refuses to compile a program that the author thinks is valid. This often happens because the programmer’s mental model of how ownership should work doesn’t match the actual rules that Rust implements. You probably will experience similar things at first. There is good news, however: more experienced Rust developers report that once they work with the rules of the ownership system for a period of time, they fight the borrow checker less and less.

If the language has the problem that people are fighting with the language in order to become productive with it, perhaps something is wrong with the language, and not the programmers? Instead, the Rust community continues to flaunt the correctness of their language — a valuable property, but without taking a step back and thinking that perhaps different defaults might make more sense.

https://blog.usejournal.com/systems-languages-an-experience-report-d008b2b12628

via https://twitter.com/kellabyte/status/1006975550718541824

##

For years Rust slowly boiled in its own poor compile times, not realizing how bad it had gotten until it was too late. It was 1.0. Those decisions were locked in.

Looking at some of these in retrospect, I am tempted to think that “well, of course Rust must have feature foo", and it's true that Rust would be a completely different language without many of these features. However, language designs are tradeoffs and none of these were predestined to be part of Rust.

- Borrowing — Rust's defining feature. Its sophisticated pointer analysis spends compile-time to make run-time safe.
- Monomorphization — Rust translates each generic instantiation into its own machine code, creating code bloat and increasing compile time.
- Stack unwinding — stack unwinding after unrecoverable exceptions traverses the callstack backwards and runs cleanup code. It requires lots of compile-time book-keeping and code generation.
- Build scripts — build scripts allow arbitrary code to be run at compile-time, and pull in their own dependencies that need to be compiled. Their unknown side-effects and unknown inputs and outputs limit assumptions tools can make about them, which e.g. limits caching opportunities.
- Macros — macros require multiple passes to expand, expand to often surprising amounts of hidden code, and impose limitations on partial parsing. Procedural macros have negative impacts similar to build scripts.
- LLVM backend — LLVM produces good machine code, but runs relatively slowly.
- Relying too much on the LLVM optimizer — Rust is well-known for generating a large quantity of LLVM IR and letting LLVM optimize it away. This is exacerbated by duplication from monomorphization.
- Split compiler/package manager — although it is normal for languages to have a package manager separate from the compiler, in Rust at least this results in both cargo and rustc having imperfect and redundant information about the overall compilation pipeline. As more parts of the pipeline are short-circuited for efficiency, more metadata needs to be transferred between instances of the compiler, mostly through the filesystem, which has overhead.
- Per-compilation-unit code-generation — rustc generates machine code each time it compiles a crate, but it doesn't need to — with most Rust projects being statically linked, the machine code isn't needed until the final link step. There may be efficiencies to be achieved by completely separating analysis and code generation.
- Single-threaded compiler — ideally, all CPUs are occupied for the entire compilation. This is not close to true with Rust today. And with the original compiler being single-threaded, the language is not as friendly to parallel compilation as it might be. There are efforts going into parallelizing the compiler, but it may never use all your cores.
- Trait coherence — Rust's traits have a property called “coherence”, which makes it impossible to define implementations that conflict with each other. Trait coherence imposes restrictions on where code is allowed to live. As such, it is difficult to decompose Rust abstractions into, small, easily-parallelizable compilation units.
- Tests next to code — Rust encourages tests to reside in the same codebase as the code they are testing. With Rust's compilation model, this requires compiling and linking that code twice, which is expensive, particularly for large crates.

https://pingcap.com/blog/rust-compilation-model-calamity/

##

For sure! I’ve been patiently awaiting NLL for as long as I’ve been working with Rust. It should make a lot of common/unusual problems go away, which is very promising.

I think to be clear, the concept of borrowing itself is very simple; it’s defined perfectly with just 3 short rules 38. The real learning curve is not with borrowing (or these rules), the problem is with complex lifetimes. Complex lifetimes come into play anywhere that the lifetimes cannot be elided.

I’ve mentioned this elsewhere, but since it is relevant … I had a really hard time coming to terms with lifetimes as I was learning Rust. In fact, it is still my biggest pain point with the language. But I taught myself to get around it by writing a non-trivial project without using a single lifetime parameter. I also didn’t need Box, Rc, RefCell, or friends. But that’s because most of the code is stateless (which explains why it doesn’t need explicit lifetimes).

IMHO, this is the best way to learn Rust. Doing things that require explicit lifetimes (like global state management or FFI) should come way, way, way later in the book.

Lifetimes are part of the interface contract of a type or function, because they determine what data can be passed in to a function or inserted into objects of a certain type. In this sense they should be exposed by the language’s syntax. Otherwise, a modification of a type’s or function’s implementation could silently break code that uses it, a subtle compatibility bug which the design of Rust has taken great steps to avoid.

If you do not want to expose the lifetime information in the interface, you need to use abstractions which hide lifetimes from the user and manage them at run time, such as reference-counted pointers. But these abstractions come at a performance cost, which is why they should not be used at the most fundamental layer of a system programming language.

https://users.rust-lang.org/t/isnt-rust-too-difficult-to-be-widely-adopted/6173/38

##

- https://www.reddit.com/r/rust/comments/4o6nd7/problem_in_rust_adoption/

##

It compiles - can one spot the issue? If you know about Timeout::new() and its return type, you will. But this is an example of where returning (), which is what’s needed for compilation, coupled with methods/combinators like map() reused across different types, makes for really subtle bugs. And all this reliance on the “if it compiles it works” goes out the window.

https://users.rust-lang.org/t/rust-language-and-special-cases-blog-post/17844/27

##

The feedback I’m trying to express is that it doesn’t feel like the typical learning curve. Keep in mind that I took to Haskell like a duck to water, and that’s generally considered a relatively difficult language to learn.

The link you referenced seems to cover at least some of the issues I’ve noted (yay!), but at the same time it feels like it’s making things worse because it’s yet more layers of ad-hoc magic and bandaids layered on top of what to me feels like a shaky foundation.

I’ve observed that successful languages take some core mathematically sound theory and produce a concrete, applied implementation of it. Relational theory became SQL, typed lamba calculus became functional programming, object oriented theory is wildly popular, etc…

I feel like Rust came `>this<` close to implementing something similarly ‘pure’, for a want of a better word, fell short, and is slowly sinking into the same messy quagmire that makes C++ so repulsive to me now after having used it for over a decade and then abandoned it for vastly more productive languages.

I think part of this is that most of the Rust core development team comes from a C++ background, and to them, Rust is a huge improvement relative to what they’re used to. This is true, but it feels like a step backwards for everyone else used to elegant languages with a more consistent underlying logic.

The most telling aspect is the general disregard for IDE integration in Rust. It’s been, what, 8 years and there still isn’t a first-class integration with any development environment out there! Tab-complete is woeful at best, and refactoring is basically hopeless.

So… lets all assume that deep IDE integration really is a goal. How is this going to happen? Having poked through the source of the standard library, I’ve noted that huge chunks of it is implemented with macros. The language is a littered with automagic landmines, and from what I’m seeing this is just getting worse. The IDEA team, known for their fantastic tooling across a range of languages, is struggling to make Rust work after over a year of effort. For example, the line `use nom::*` breaks their IDE, making it forget what str is. I don’t even…

So what’s the fix? I feel like automatic deref is already one step too far in the wrong direction. Compile-time-lifetimes are brilliant, but the fact that NLL took this long indicates that there is no sound underlying theory that can be analysed, understood by humans, or refactored by IDEs.

I’m going to keep poking away at some toy Rust problems as a learning exercise, but I just can’t see any utility in it at the moment. There’s too many ‘undefined behaviors’ for it to feel safe, not enough SIMD to make it truly performant, and it’s not productive enough to replace C# or its ilk at the moment…

PS: I’m no longer surprised at Rust’s slow compiles times, this type of “bulk impl for dozens of concrete types using macros” is a common pattern. The lines of code might look fine to a human, but the in-memory bloat must be hideous…

https://users.rust-lang.org/t/rust-beginner-notes-questions/14928
