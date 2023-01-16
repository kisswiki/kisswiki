```zig
const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    std.debug.print("Tell me your name\n", .{});
    const bare_line = try stdin.readUntilDelimiterAlloc(
        std.heap.page_allocator,
        '\n',
        8192,
    );
    defer std.heap.page_allocator.free(bare_line);
    const line = std.mem.trim(u8, bare_line, "\r");
    std.debug.print("Hi {s}\n", .{line});

    var line_buf: [20]u8 = undefined;
    const amt = try stdin.read(&line_buf);
    std.debug.print("Your number {}", .{amt});
}
```

- https://stackoverflow.com/questions/62018241/current-way-to-get-user-input-in-zig
- https://zig.news/sobeston/a-guessing-game-5fb1
- https://github.com/roc-lang/roc/blob/726d8d80c4f58678886ac62ab1858c3b030db118/examples/cli/tui-platform/host.zig#L214
- https://github.com/oven-sh/bun/blob/8911c398d9ed8a7bcb0413128f2db62b355e2adc/src/cli/init_command.zig#L54
- https://github.com/ziglang/zig/blob/master/test/standalone/guess_number/main.zig
