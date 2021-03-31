In addition, this is already kind of a problem -- if two independently maintained error sets both coincidentally (i.e., without coordinating with each other) choose the same error name, a caller of a function which propagates both error sets can't distinguish between the two error cases (I am assuming that since they were chosen without coordination, they don't [necessarily] indicate the same kind of recovery must be done), which can result in incorrect error recovery.

https://github.com/ziglang/zig/issues/2647#issuecomment-678553855
