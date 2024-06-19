- C has macros which greatly help keep code smooth. Zig has only comptime which does not help with boilerplate reduction the way macros do. For example, people have implemented generics and interfaces using macros, which Zig just can’t do;

- C has a proto-exceptions system with setjmp/longjmp, Zig has nothing similar. For example, in C I can throw an exception on a null pointer, handle it, and my program will move on. In Zig it will be a “panic” and there’s no way to recover from it;

- C is stable and mature, battle-tested even, while Zig has breaking changes every several months with no end in sight. When’s it going to reach a status of “battle-tested”? Years if not decades.

https://www.reddit.com/r/Zig/comments/1ddn59m/comment/l88p2ej/
