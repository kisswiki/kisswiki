Because Zig treats error types specially, when using errors you get a bunch of nice features, such as ! error-set inference, try/catch, and errdefer; you currently lose these features if you want to return extra diagnostic information since that information is no longer an error type.

I'm currently writing code with a very many number of exit points which throw an error and are required to also set a message, and being diligent to always do both is dragging on me.

In addition, this is already kind of a problem -- if two independently maintained error sets both coincidentally (i.e., without coordinating with each other) choose the same error name, a caller of a function which propagates both error sets can't distinguish between the two error cases (I am assuming that since they were chosen without coordination, they don't [necessarily] indicate the same kind of recovery must be done), which can result in incorrect error recovery.

- [Allow returning a value with an error · Issue #2647 · ziglang/zig](https://github.com/ziglang/zig/issues/2647#issuecomment-678553855)
- [Error messages should use a mutex · Issue #7859 · ziglang/zig](https://github.com/ziglang/zig/issues/7859)
