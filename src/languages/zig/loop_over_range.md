```zig
const std = @import("std");

// https://github.com/nektro/zig-range/blob/master/src/lib.zig
pub fn range(len: usize) []const void {
    return @as([*]void, undefined)[0..len];
}

pub fn main() void {
    std.debug.print("Hello, world!\n", .{});
    // Accepted proposal https://www.reddit.com/r/Zig/comments/tuq7a0/comment/i35y6p4/
    //for (0..10) |i| {
    //    std.debug.print("{d}\n", .{i});
    //}

    for (range(10)) |_, i| {
        std.debug.print("{d}\n", .{i});
    }
}
```

Or you can import [zig-extras](https://github.com/nektro/zig-extras/blob/master/src/lib.zig#L13) and range function from it. Example of import https://github.com/rofrol/sha256sum-zig.

Or comptime only example which has limited uses:

```zig
const std = @import("std");
const assert = std.debug.assert;
const warn = std.debug.warn;
const stdout = std.io.getStdOut().writer();

fn abs(comptime x: comptime_int) comptime_int {
    return if (x < 0) -x else x;
}

pub fn range(comptime a: comptime_int, comptime b: comptime_int) [@divTrunc(abs(b - a), 1) + 1](if (a < 0 or b < 0) isize else usize) {
    comptime assert(abs(a) != abs(b));
    comptime assert(abs(a + 1) != abs(b));

    comptime var res: [@divTrunc(abs(b - a), 1) + 1](if (a < 0 or b < 0) isize else usize) = undefined;
    comptime var idx = 0;
    inline while (idx < res.len) {
        res[idx] = a + 1 * idx;
        idx += 1;
    }

    return res;
}

// Type your code here, or load an example.
pub fn main() !void {
    for (range(1, 10)) |val| {
        try stdout.print("{d}\n", .{val});
    }
}
```

- https://godbolt.org/z/ceddraTWb
- https://www.reddit.com/r/Zig/comments/t1ty7e/comment/hyijccx/?utm_source=reddit&utm_medium=web2x&context=3
