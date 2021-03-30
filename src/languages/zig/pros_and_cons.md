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
