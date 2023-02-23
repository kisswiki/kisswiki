There are many erroneous claims made regarding Zig allocators. Contrary to what is claimed, the fact that you pass an explicit allocator does not affect:

- That an out-of-memory condition is elegantly handled or not.
- That an out-of-memory condition is properly reported to the caller.
- That is simplifies WebAssembly support; whatver you put in the allocator your could put into malloc.
- That it easily allows arena allocators; you can only use an arena allocator if you intimately know every single uses of the passed in allocator, allo the implementation details of the libraries you call and of _all_ its dependencies. If a dependency, for example, implements a cache, the arena allocator will corrupt it when deallocated.

https://news.ycombinator.com/item?id=27145943

## "A simple language"

That's what it says in big bold letters near the top of the Zig language web page. Zig is a recent experiment in cutting away all this derided complexity which plagues modern programming languages. Closures, function traits, operator overloading - programming is hard enough to begin with, why can't we at least program in a simple language, without all that crap?

Zig honestly seems like a cool language, and I'd like to learn it one day, but I can't say its simplicity is its most attractive quality. Below the header, the website reads:

> Focus on debugging your application rather than debugging your programming language knowledge.

Why would I want that? The entire point of modern language complexity is to reduce the amount of debugging needed for your application, because its complexity is properly managed by the language.

Zig uses manual memory management, and does not have the same compile time guarantees about memory safety as Rust. Meaning of course that sure, compared to writing Rust code, it's probably simpler to write Zig code that compiles, but crashes at runtime, after which you get the joy of focusing "on debugging your application".

To me this is a trick of words: The difficulty in figuring out how to satisfy e.g. ownership rules in Zig is, by mere convention, debugging the "application", whereas the same difficulty in Rust would be debugging the "programming language".

Zig, of course, is not the first language to explicitly seek simplicity. Go did it before Zig, with much of the same motivation: Get the language out of the way. And in some way, they were successful. Go is heralded as an easy language to learn. But on the other hand... well, let me end on the the words of [someone else](https://fasterthanli.me/articles/i-want-off-mr-golangs-wild-ride):

> Over and over, every piece of documentation for the Go language markets it as "simple". This is a lie. Or rather, it's a half-truth that conveniently covers up the fact that, when you make something simple, you move complexity elsewhere.

https://viralinstruction.com/posts/defense/

## No checker for opened file descriptors

veloscillator

Might be helpful to add a sanitizer step to check for this. valgrind can do it but may be slow.

andrewrk

Agreed, I was thinking it might be possible to do something similar to the std lib leak checker, but with file descriptors. Maybe even with arbitrary resources.

https://github.com/ziglang/zig/pull/14703#issuecomment-1439298574
