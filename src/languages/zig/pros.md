I have been using Zig in earnest for about 8 months now. At that time my default choice for new projects was Rust, so I picked up the biggest Rust project I had ([comrak](https://github.com/kivikakk/comrak), perhaps the 2nd most popular CommonMark/GFM formatter in the ecosystem) and [converted it to Zig](https://github.com/kivikakk/koino). It was quite refreshing.

Since then I’ve built a number of tools with Zig, and I have honestly not had to deal with memory leaks, use-after-free, double-free, etc. almost ever. The general purpose allocator does what you would otherwise have to reach for Valgrind for, but better. The careful design of defer, errdefer and control flow around error handling make it quite a joy to use.

If you already grok manual memory management as a concept (say, you’ve used C quite a bit before), then Zig feels like it gives you all the tools you need to do it sanely without much overhead, like what you always wanted. A lot of people are repelled by the idea of doing it ‘manually’, but my experience is that it is the poor affordances C gives that generates that repulsion. I do recommend it.

https://lobste.rs/s/f98dpj/pin_suffering#c_2z4fal

##

Zig is dramatically simpler than rust. It took a few days before I felt proficient vs a month or more for rust.

Most of this difference is not related to lifetimes. Rust has patterns, traits, dyn, modules, declarative macros, procedural macros, derive, associated types, annotations, cfg, cargo features, turbofish, autoderefencing, deref coercion etc. I encountered most of these in the first week. Just understanding how they all work is a significant time investment, let alone learning when to use each and how they affect the available design space.

I still haven't internalized the full rule-set of rust enough to be able predict whether a design in my head will successfully compile. I don't remember the order in which methods are resolved during autoderefencing, or how module visibility works, or how the type system determines if one impl might overlap another or be an orphan. There are frequent moments where I know what I want the machine to do but struggle to encode it into traits and lifetimes.

Zig manages to provide many of the same features with a single mechanism - compile-time execution of regular zig code. This comes will all kinds of pros and cons, but one large and important pro is that I already know how to write regular code so it's easy for me to just write down the thing that I want to happen.

https://scattered-thoughts.net/writing/assorted-thoughts-on-zig-and-rust/

##

Despite all this, I still don’t feel comfortable with Rust. It feels fractally complex — seemingly every time I use Rust on a new project, I run into some issue that forces me to confront a new corner of the language/ecosystem. Developing my keyboard firmware was no exception: I ran into two problems, and each required learning a completely new language feature.

These problems aren’t really specific to embedded, but they’re representative of the sorts of challenges I’ve run into using Rust over the past three years.

Using Zig for just a few hours has highlighted to me aspects of Rust that I’d never before considered. In particular, that much of the complexity I’d unconsciously attributed to the domain — “this is what systems programming is like” — was in fact a consequence of deliberate Rust design decisions.

For example, it’s now quite clear to me that Rust is a language which has a dedicated feature for everything. In addition to its famous borrow checker, Rust has modules, packages, generics, traits, two kinds of macros, attribute annotations, and a dozen other things.

Heck, even defining immutable variables is done with different language features depending on whether it’s in a function context or module context

> a particular form of guessability: when a person knows some of the language structure, how much of the rest can be guessed successfully?

Rust has many language features and they’re all largely disjoint from each other, so knowing some doesn’t help me guess the others.

Nothing I knew about if expressions helped me predict or understand the attribute annotation / feature system, even though they’re both fulfilling a conceptually similar need (conditional logic). Nothing I knew about functions helped me understand syntax macros.

Conversely, this “consistency” principle also explains why I had such an easy time picking up Zig — it absolutely excels in this department. Not only are there many fewer features to learn in the first place, they seem to all fit together nicely: The comptime and inline for keywords, for example, allowed me to leverage at compile-time all the looping, conditions, arithmetic, and control flow I wanted using the syntax and semantics I’d already learned — Zig!

Even though I’m only a dozen hours in, I feel like I can already be productive with Zig without an Internet connection. It feels like Zig is a language that I’d be able to master; to fully internalize such that I can use it without thinking about it. This feels super exciting and empowering.

https://kevinlynagh.com/rust-zig/
