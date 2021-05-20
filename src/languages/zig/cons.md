There are many erroneous claims made regarding Zig allocators. Contrary to what is claimed, the fact that you pass an explicit allocator does not affect:

- That an out-of-memory condition is elegantly handled or not.
- That an out-of-memory condition is properly reported to the caller.
- That is simplifies WebAssembly support; whatver you put in the allocator your could put into malloc.
- That it easily allows arena allocators; you can only use an arena allocator if you intimately know every single uses of the passed in allocator, allo the implementation details of the libraries you call and of _all_ its dependencies. If a dependency, for example, implements a cache, the arena allocator will corrupt it when deallocated.

https://news.ycombinator.com/item?id=27145943
