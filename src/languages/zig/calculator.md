main.zig

```
const math = @import("std").math;
const print = @import("std").debug.print;
pub fn main() !void {
    const f1: f32 = math.log2(314159);
    // @as taken from https://github.com/ziglang/zig/blob/70dc910086582b028d404d5de5049ceae0a95161/lib/std/math/log2.zig#L45
    const f2: f32 = math.log2(@as(f32, 314159));
    print("result: {d:.3} {d:.3}\n", .{ f1, f2 }); // result: 18.000 18.261
}
```

`zig run main.zig`

- https://ziglang.org/documentation/master/std/#root;math.log2
- https://ziglang.org/documentation/master/#Standard-Library-Math-Functions
- https://ziglang.org/documentation/master/std/#root;fmt.format
- https://stackoverflow.com/questions/68552110/zig-print-float-precision
- https://ziglang.org/documentation/master/#Primitive-Types
