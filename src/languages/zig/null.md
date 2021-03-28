Instead of null references, Zig uses optional types, and optional pointers in particular, to avoid many of the problems associated with null. As the documentation puts it:

Null references are the source of many runtime exceptions, and even stand accused of being the worst mistake of computer science.
Zig does not have them.

Instead, you can use an optional pointer. This secretly compiles down to a normal pointer, since we know we can use 0 as the null value for the optional type. But the compiler can check your work and make sure you don't assign null to something that can't be null.

- https://lwn.net/Articles/833400/
- https://ziglang.org/documentation/master/#null
- [null.md](/src/00other/null.md)
