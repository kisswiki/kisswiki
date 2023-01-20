```zig
//usr/bin/env zig run --enable-cache "$0" -- "$@" | tail -n +2; exit;
const std = @import("std");
const expect = std.testing.expect;

fn sum (comptime T: type, array: anytype) T {
    var acc: T = 0;
    for (array) |element| {
        acc += element;
    }
    return acc;
}
pub fn main() !void {
    const items = [_]i32 { 1, 2, 3, 4, 5 };
    try expect(sum(i32, items) == 15);
}
```

run `./main.zig`

https://www.reddit.com/r/Zig/comments/108mslt/how_do_i_make_generics_readable/
