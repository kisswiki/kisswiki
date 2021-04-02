rofrol
How to reproduce it?

Tetralux
Stuff like that tends to be broken by release modes.
Because the optimizer assumes you don't do it.
Hence UB.

as(Sobeston, undefined)
This isn't something that you can, from a language perspective, reliably reproduce
You don't define where and how locals are stored

rofrol
Shouldn't compiler prevent that?

as(Sobeston, undefined)
Ideally yes. This isn't prevented yet

Tetralux
Use-after-free due to local scope.
It probably works because the array's memory is allocated as part of main's stack frame, and it happens to allocate space for all locals at once at the beginning, [which doesn't get popped off by the function call, since it's before it.]

as(Sobeston, undefined)
It might work for: this version of the compiler, on x86_64, in this case
In the general case this will not work
You're illegally accessing memory
It just so happens that the memory there is as you expect
All it takes is some platform difference, llvm shaking things up a little, Zig emitting different llvm ir, etc
And it's broken
Compile with a different back end and you might not be so lucky

```zig
fn oopsie() *i32 {
    var i: i32 = 44;
    return &i;
}

pub fn main() !void {
    var slice_of_mutable_array_literal: []u8 = blk: {
        var arr = [_]u8{ 1, 2, 3 };
        break :blk arr[0..];
    };
    oopsie();
}
```
