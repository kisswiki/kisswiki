zero-cost does not mean no cost, it means no extra cost over manually writting code that does not use the abstraction, but emulates instead.

E.g. the function abstraction adds overhead (function calls, requires a stack, a calling convention, etc.) and you can manually write code without it. However, if you wanted to be able to reuse code in a binary without functions, you'd need some concept of calling convention, how to get there and go back (function call), etc. Functions are a zero-cost abstraction over manually doing that, if and only if, there is no manual way of doing something that's feature-wise the same as functions, but in a faster way.

https://www.reddit.com/r/rust/comments/bo13qq/what_specifically_are_all_the_zerocost/enbhaqh/
