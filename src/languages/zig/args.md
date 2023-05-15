```zig
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const args = try std.process.argsAlloc(std.heap.page_allocator);
    defer std.process.argsFree(std.heap.page_allocator, args);

    if (args.len < 2) return error.ExpectedArgument;

    const f = try std.fmt.parseFloat(f32, args[1]);
    const c = (f - 32) * (5.0 / 9.0);
    try stdout.print("{d:.1}c\n", .{c});
}
```

https://zig.news/sobeston/fahrenheit-to-celsius-akf

```zig
pub fn main() !void {
    // Choose an allocator based on our needs.
    const allocator = std.heap.page_allocator;
    {

        // Concatenate.
        const path = try concatPath(allocator, "zig", "bits");
        defer allocator.free(path); // free the memory at the end of the scope

        // Print the final path.
        std.log.debug("{s}", .{path});
    }

    {
        // Concatenate.
        const path = try concatPath(allocator, "zig", "bits2");
        defer allocator.free(path); // free the memory at the end of the scope

        // Print the final path.
        std.log.debug("{s}", .{path});
    }
}
```

https://blog.orhun.dev/zig-bits-02/
First argument is executable name. You do not provide it in command line. It is given.

```zig
var args_iter = std.process.args();
const exe_name = try (args_iter.next(allocator) orelse return error.MissingArgument);
defer allocator.free(exe_name);
```

https://github.com/MasterQ32/zig-network/blob/72082f77a31a2bf9f1e457839acc188e6a210aa4/examples/echo.zig#L22
