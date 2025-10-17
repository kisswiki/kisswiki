I would argue that Zig’s inability to produce static or dynamic libraries that use Zig features in its API is a much bigger problem that Odin’s lack of a package manager.

Neither Odin nor C3 has any problems with this, and it simply follows from Zig’s semantics that it is rendered impossible.

So will Zig semantics change (which would be a big change indeed), or will Zig precompiles libraries always be forced to go by way of special C-compatible calls and types?

Before I’d declare Zig the winner due to a package manager I’d be sure to figure that one out.

<https://news.ycombinator.com/item?id=38840602>

Odin is a general purpose language, in the same way C.

Professionally, we use Odin to create all of our software at JangaFX: EmberGen, LiquiGen, and GeoGen.

Many people have been using Odin for similar purposes:

- game development
- application development
- 3D graphics
- physics related stuff
- etc

This is what a lot of people feel Odin's "niche" is, even if it is not restricted to that. A good example of this is Odin's first class features for array-programming, swizzling, matrices, quaternions, and many other things useful when dealing with 3D related things (graphics, physics, games, etc).

<https://news.ycombinator.com/item?id=38840727>
