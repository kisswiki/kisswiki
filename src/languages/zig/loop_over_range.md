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
