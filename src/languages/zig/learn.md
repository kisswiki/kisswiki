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

##

Zig is one of the most interesting languages I've seen in a very long time, and possibly the first radical breakthrough in low-level programming design in decades. Maybe it will become a big success and maybe it will tank, but after having two visions for low-level programming -- that of C's "syntax-sugared Assembly", or that of C++'s "zero-cost abstractions" whose low-level, low-abstraction code appears high level on the page, once you get all the pieces to fit (Rust, while introducing the ingenious borrow checking, still firmly follows C++'s design philosophy and can be seen as a C++ that checks your work) -- Zig shows a third way by rethinking, from the ground up, how low-level programming could and should be done.
It manages to address all of C++'s biggest shortcomings, which, in my view, are 1. language complexity, 2. compilation time, 3. safety -- in this order -- and it does so in a language that is arguably simpler than C, can be fully learned in a day or two (although the full implications of the design might take longer to sink in), and also inspires a new approach to partial evaluation, replacing generics and value templates, concepts/traits/typeclasses, constexprs/procedural macros, macros (or, at least, the "good parts" of macros) and conditional compilation with a single, simple feature.

- https://news.ycombinator.com/item?id=24616672
  - https://twitter.com/MichalZiulek/status/1502983958233034753

##

As someone who knows C and not Zig, Zig is very interesting. It has incremental compilation, in-place binary patching, the ability to use code before declaration in a file, compile-time code execution, and extremely low compile times. Rust itself doesn't have most of those.

https://news.ycombinator.com/item?id=26651603

## videos

- [ ] [What's Zig got that C, Rust and Go don't have? (with Loris Cro) | Developer Voices](https://youtu.be/5_oqWE9otaE)
- [ ] [Zig for Impatient Devs | Isaac Harris-Holt](https://youtu.be/5I4ZkmMS4-0)
- [ ] [Building a Better C with Loris Cro from Zig Software Foundation | Software Huddle](https://youtu.be/ZzqVHMA0jXQ)
- [ ] [the TRUTH about this NEW Language (BETTER Than Rust and C++?) | Low Level Learning](https://youtu.be/zFELcHTki9U)
- [ ] [How Zig Helped Us | Prime Reacts | ThePrimeTime](https://youtu.be/wxx5_Xaw7zU)
- [ ] [Just Learn Zig, Dude | Berr's Tech](https://youtu.be/oeU3OQn9eR0)
- [ ] [3 reasons to choose ZIGLANG over RUST for Programming #zig | @chrishayuk](https://youtu.be/null)
- [ ] [Coding a Math Function in ZIG - In 60 Seconds! #ziglang | @chrishayuk](https://youtu.be/null)
- [ ] [Zig Programming Language getting started tutorial in 60 Seconds #ziglang | @chrishayuk](https://youtu.be/null)
- [ ] [Programming WebAssembly with Zig - Getting Started with the ZIG programming language | Chris Hay](https://youtu.be/R2GW197izwQ)
- [ ] [Zig in 100 Seconds | Fireship](https://youtu.be/kxT8-C1vmd4)
- [ ] [Zig Game Development – Full Programming Course | Beau](https://youtu.be/2co5DgL_-3s)
- [ ] [Zig Roadmap 2023 - Andrew Kelley | Zig SHOWTIME](https://youtu.be/AqDdWEiSwMM)
- [ ] [Rust vs Zig Programming Language | Edufane](https://youtu.be/HLTIZrBoCcE)
- [ ] [Paid Zig Stream | Tsoding Daily](https://youtu.be/eIX9zER9vjY)
- [ ] [Zig 0.12 Release Stream and Project Upgrades - VOD (04/20/2024) | ninja_tron](https://youtu.be/1dTHtKVKwgs)
- [ ] ninja_tron https://www.youtube.com/watch?v=Zlbouq6AMM4&list=PLhSzt4Qca0JpTF5407cSm0IYHwESOAKV0
- [ ] ["I Am Sorry" - Zig 0.11.0 Release | Prime Reacts | ThePrimeTime](https://youtu.be/5skH-9LljLc)
- [ ] [How To Learn A New Programming Language - LETS ZIG IT | Anthony GG](https://youtu.be/rvRKrvRLP_U)
- [ ] [[#36] Zig Roadmap 2024 - Andrew Kelley | Zig SHOWTIME](https://youtu.be/5eL_LcxwwHg)
- [ ] [Go is blazingly faster than Zig? | ThePrimeagen](https://youtu.be/RSY85SLXzwk)
- [ ] [Zig programming language tutorial - Part 1 | Matt Freire](https://www.youtube.com/watch?v=a6obU5lleyE&list=PLLRM7ROnmA9GNl8t_02kTa6Xqp7leH7lN)
- [ ] [What is Zig? | Brad Cypert](https://youtu.be/hcLAG8yfaHg)
- [ ] [[#32] Ghostty: A New Terminal Emulator Written in Zig - Mitchell Hashimoto | Zig SHOWTIME](https://youtu.be/l_qY2p0OH9A)
- [ ] [Should You Learn C Before Zig? | Zig SHOWTIME](https://youtu.be/dK41zamWqz8))
- [ ] [When Zig Outshines Rust | Prime Reacts | ThePrimeTime](https://youtu.be/prgWXy9vGc4)
- [ ] [My Zig Experience | Prime Reacts | ThePrimeTime](https://youtu.be/SBe8DgBCjTc)
- [ ] [Migrating from Zig to Jai | Tsoding Daily](https://youtu.be/CDCU6b-WzAw)
- [ ] [⚡zap⚡ - Blazingly Fast Backends in Zig - Rene Schallner - Software You Can Love Vancouver 2023 | Zig SHOWTIME](https://youtu.be/-GyLWrDF8ss)
- [ ] [[Programming Languages] Episode 4 - First Impression - Zig | Mike Shah](https://youtu.be/X4CoGko1I8E)
- [ ] [Differences between Odin and Zig | Rickard Andersson](https://youtu.be/tgxtk2OeLwM)
- [ ] [Simple fetch requests with Zig | Brook Jeynes](https://youtu.be/xSyYl186rLw)
- [ ] [POSIX shared memory with Zig | Brook Jeynes](https://youtu.be/QEGihu2Z9pE)
- [ ] [Socket programming in Zig | Brook Jeynes](https://youtu.be/V7Jql_SZ7kY)
- [ ] [How Much Memory for 1,000,000 Threads in 7 Languages | Go, Rust, C#, Elixir, Java, Node, Python | ThePrimeTime](https://youtu.be/WjKQQAFwrR4)
- [ ] [Learning Zig | Day 1 | TheVimeagen](https://youtu.be/1gvdG4Ahr_4)
- [ ] [Lexer In Zig, Rust, Typescript | TheVimeagen](https://youtu.be/GroRGkaS6k4)
- [ ] [Zig Day 2 | Prime Vod | TheVimeagen](https://youtu.be/Twik70B7hwo)
- [ ] [Zig Data Structure Katas | TheVimeagen](https://youtu.be/xIPrwrBAU2c)
- [ ] [Code Review: Zig | Guest teej_dv! | TheVimeagen](https://youtu.be/M2raTS6QfM0)
- [ ] [Rust and Zig: Extending The Lexer | TheVimeagen](https://youtu.be/MvdalthpiwQ)
- [ ] [Learning Zig : Creating a Stack (comptime) | TheVimeagen](https://youtu.be/jefPqllQKmA)
- [ ] [Zig Lexer : Finished it!!! | TheVimeagen](https://youtu.be/BiYPrMjPU60)
- [ ] [The Road to Zig 1.0 - Andrew Kelley | ChariotSolutions](https://youtu.be/Gv2I7qTux7g)
- [ ] [Zig: First Impressions | DevOnDuty](https://youtu.be/kRrxbRLWsBo)
- [ ] [P99 CONF: Coding for Speed: Rust vs Zig vs.... JavaScript ??? | ScyllaDB](https://youtu.be/gf1bC9-h5C0)
- [ ] [Zig Programming Language | Gamefromscratch](https://youtu.be/ygfGO5n1Oe4)
- [ ] [Using Zig to write native extension modules for Python - Adam Serafini | Zig Meetups](https://youtu.be/AKhqFOdjUfg)
- [ ] [Achieving peak performance with register allocation - Joachim Schmidt | Zig Meetups](https://youtu.be/Gb-Sv6cyRWI)
- [ ] [Why I wrote a Windows Resource compiler from scratch - Ryan Liptak | Zig Meetups](https://youtu.be/RZczLb_uI9E)
- [ ] [Thoughts about package management - Kayla Washburn | Zig Meetups](https://youtu.be/UQ-7k8uAc3c)
- [ ] [Zig: The right choice for building C projects - Felix Queißner | Zig Meetups](https://youtu.be/D6w4EOv9-yI)
- [ ] [End of C? Rust, Zig | Telusko](https://youtu.be/UTV_eauFWVU)
- [ ] [Zero Cost Abstractions in C++20, Rust, & Zig | Context Free](https://youtu.be/43X9ia-qpds)
- [ ] [MicroZig Demo for Zig 0.10.0 Release Party | mattnite](https://youtu.be/dLZVTnpB5Ds)
- [ ] [Interview with Zig language creator Andrew Kelley | Context Free](https://youtu.be/ZvskDoP09Ao)
- [ ] [Is Rust an efficient compiler? (Rust vs Zig) | Bayo Code](https://youtu.be/OszCn3zzH1I)
- [ ] [1. Installing the Zig Compiler | Zig Programming Language Tutorials | Bayo Code](https://youtu.be/fQ08HMZLbCw?list=PLRMNjZSQLv5iGpjubyzlWYcGqiTPVyK3s)
- [ ] [Why Zig is a great language for Elixir Nifs: Vol. 2 | E-xyza](https://youtu.be/l848TOmI6LI)
- [ ] [Why you should use Zig for your Elixir Nifs | E-xyza](https://youtu.be/IM_tO8hQgKA)
- [ ] [Zig FFI for great Justice | E-xyza](https://youtu.be/v1SOsJaQK8c)
- [ ] [Cancelling threaded nifs using Zigler | E-xyza](https://youtu.be/30mUqnPENxk)
- [ ] [Showing off Zig Errors in Zigler | E-xyza](https://youtu.be/j4s2EfgXJjs)
- [ ] [Using Zig's uncolored async to make nifs simpler | E-xyza](https://youtu.be/kpRK9BC0-I8)
- [ ] [Installing Zig Using Snap Package Manager On WSL2 Ubuntu | Sphorb](https://youtu.be/4zVU3LxSksE)
- [ ] [Compile WebAssembly on Linux to native Windows using Wasmer & Zig | Context Free](https://youtu.be/VbYy2gqjnJI)
- [ ] [Browserless app runtime in Rust - Demo app in Zig - Wasm/WebGPU | Context Free](https://youtu.be/VhCgep06-I8)
- [ ] [Async engines in C++20, Rust, & Zig | Context Free](https://youtu.be/Ws3jC6AJC_4)
- [ ] [Efficient Web Assembly with the Smarts of Zig | Patrick Smith](https://youtu.be/owK-vhT8ibE)
- [ ] [Zig challenges C Language | New Programming Language | MySirG | MySirG.com](https://youtu.be/4RDCV2qXk_U)
- [ ] [Lexer In Zig, Rust, Typescript | TheVimeagen](https://youtu.be/GroRGkaS6k4)
- [ ] [Mach game engine, what's next (2022) (Zig MiLAN lightning talk) | Hexops](https://youtu.be/m3gOX26LOeM)
- [ ] [iOS DX With Zig - Jakub Konka | Zig SHOWTIME](https://youtu.be/bJNSPZTLMUU)
- [ ] [Q&A: Going to School for C? Forget C, Learn Zig (from Webi #23) | Beyond Code Bootcamp](https://youtu.be/OuaaHIwc3lM)
- [ ] [A to Zig | 01 Hello World | Dylan Falconer](https://youtu.be/iWqCekosIiI)
- [ ] [A to Zig | 02 Values | Dylan Falconer](https://youtu.be/I2E-9jSsxcM)
- [ ] [A to Zig | 03 Arrays | Dylan Falconer](https://youtu.be/NhOWXvruqZc)
- [ ] [Rafał Pocztarski - Zig, because fullstack is no longer just JavaScript and TypeScript #ziglang | WarsawJS](https://youtu.be/_WccWcx0p4k)
- [ ] [How to use raylib on Zig | Ariq Fajar](https://youtu.be/_fkmeW7dGDo)
- [ ] [Reading Zig's Standard Library | Zig SHOWTIME](https://youtu.be/NQgju_2mX-8)
- [ ] [Zig for building C and or using C libraries + Rust Foundation Opinions | Cade](https://youtu.be/l3UWcaS8A1Y)
- [ ] [Zig: a great fit for emulators - Benjamin Feng | Zig SHOWTIME](https://youtu.be/jkkUS0nmdsg)
- [ ] [Numeric Types in Zig - Loris Cro | Zig SHOWTIME](https://youtu.be/La2Xl6Ewxuk)
- [ ] [A tour of std.crypto in Zig 0.7.0 - Frank Denis | Zig SHOWTIME](https://youtu.be/9t6Y7KoCvyk)
- [ ] [Zig SHOWTIME | Zig SHOWTIME](https://www.youtube.com/@ZigSHOWTIME/videos)
- [ ] [Exploring Zig with Fermyon Spin | Fermyon](https://youtu.be/pknRk7a8-cM)
