RAII-heavy projects can hide fun surprises in an object’s destructor, meaning that you still have to remember and know which object does what when it goes out of scope, and even when you manage to avoid bugs, you can end up with programs that take forever to shut down because every single object in the system wants to run its own destructor.

I personally love defer because in Zig allocations are always explicit: if a function takes in an allocator, you know you will have to eventually free whatever it gives you back.

Even better than defer is errdefer, which makes resource cleanup very natural.

https://lobste.rs/s/lalx23/zig_bits_0x2_using_defer_defeat_memory#c_j1hgkc

More generally, RAII is a feature that exists in tension with the approach of operating on items in batches, which is an essential technique when writing performance-oriented software.

And it doesn’t end here: operating in batches by using memory arenas, for example, is also a way to reduce memory ownership complexity, since you are turning orchestration of N lifetimes into 1.

But don’t just take my word for it.

[Casey Muratori | Smart-Pointers, RAII, ZII? Becoming an N+2 programmer](https://www.youtube.com/watch?v=xt1KNDmOYqA)

In this video Casey Muratori describes how going from thinking about individual allocations to thinking in batches is a natural form of progression for a programmer.

The first 10 minutes of the video contain the main argument and everything that he says about smart pointers equally applies to Rust lifetimes.

[CppCon 2014: Mike Acton “Data-Oriented Design and C++”](https://www.youtube.com/watch?v=rX0ItVEVjHc)

Extremely popular talk on the advantages of looking at problems as data transformation pipelines, where Mike Acton shows how common approaches in C++ (RAII being one of them) are antithetical to the goal of creating performant code.

Andrew Kelley also [gave a related talk](https://www.youtube.com/watch?v=IroPQ150F6c) at Handmade Seattle and more recently Matthew Lugg [gave another](https://www.youtube.com/watch?v=KOZcJwGdQok) at Software You Can Love.

https://kristoff.it/blog/raii-rust-linux/
