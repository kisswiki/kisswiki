```zig
var i: u8 = 1;
// panic: integer overflow
// var x: u8 = 255 + i;

// this works
var y: u8 = 255 - i + 1;
print("y: {}\n", .{y});
```

Ed T

Sometimes I really do not like zig's integer typing system. For instance, when you subtract two usigned, the results cannot directly be assigned to a signed int (with any overflows detected by zig). Or if you have a type u8 and you do = 256-x; you get an error, but =255-x+1 is okay... another, isize += usize fails, again all zig needs to do is check for overflows.... It tends to make very unreadable code due to all the @intCast calls that you need to insert to do what zig could figure out adding the same checks that that the @intCast does.

fengb

There’s what Zig is protecting you against

Ed T

but that is just an overflow and zig should detect it a runtime
not comptime
it cannot know what I am substracting

random internet person

This error is caused by it trying to load 256 into a u8, which doesn't work

Ed T

so `const x:i32 = @as(u32,10)-@as(u32,15)` needs an intCast

yet 255-x+1 works

random internet person

because 255 fits in a u8

g_w1

nice!
so it has to store those operands in temporary u8s
but the operand of 256 cannot be stored in a temporary u8 since the max is 255

Ed T

not really, since now not many cpus have just 8bit registers

g_w1

i think this would require a language change, which is not necessarily bad, just different. i think the compiler would have to change the type of the 256 to something higher, then downcast it and panic if 0 which is a lot of work
you could make a proposal

Ed T

the expression is what I think is important, Its what I would like to see the compiler work with. In the end it has to be stored in a u8 but what says the intermediate results must be too.

jumpnbrownweasel

I was confused about why this would compile so I experimented a little. I think it's because this is effectively (255-x) + 1. So the left hand side is allowed as a u8 at compile time, and then it becomes a runtime expression and will cause a runtime error. If you do 255 + 1 - x this gives the compile error.

For reference, Rust gives compile errors in even more cases than Zig for this. (255-x+1) gives a compile error if the compiler can deduce that x is zero, even if x is a mutable local variable. I was able to get a runtime error when x is zero (not a compile error) by making x a fn param, meaning that the compiler didn't deduce it's value.
