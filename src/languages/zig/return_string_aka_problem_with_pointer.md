## how can I return string that is available after function exits?

Some options:

1. Function takes a writer type, and you call its writeAll or print method with the new contents
2. Function takes a buffer, and you write to it
3. Function uses heap allocation to create the string
   You can wrap a buffer in a writer using FixedArrayBuffer to roll 1 & 2 into a single option
   But basically, you either have to heap allocate in the function or take in something that already created the space for the data
   I don't think it's applicable to this situation, but you can return a pointer to static data when it makes sense. String literals are static data, so it's perfectly fine to do e.g.

To get allocator

```zig
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer if (gpa.deinit()) @panic("leaked");
    const allocator = gpa.allocator();
```

https://github.com/Sobeston/ziglearn/blob/bd08cffcb115bae86747406b7efc5f30795b47e9/test-out.zig#L6

4. Buffer:

```zig
fn f(out: []u8) []const u8 {
    std.mem.copy(u8, out[0..5], "Hello");
    return out[0..5];
}
pub fn main() void {
    var buf: [1024]u8 = undefined;
    const out = f(&buf);
    // (or)
    const allocator = ...;
    const buf = try allocator.alloc(u8, 1024);
    defer allocator.free(buf);
    const out = f(buf);
    // etc, etc.
}
```

2. Writer

```zig
fn f(w: anytype) void {
    w.writeAll("Hello");
}
pub fn main() void {
    const allocator = ...;
    var buf = std.ArrayList(u8).init(allocator);
    defer buf.deinit();
    f(buf.writer());
    const out = buf.items;
}
```

3. Allocation

```zig
fn f(allocator: std.mem.Allocator) []const u8 {
    var out = std.ArrayList(u8).init(allocator);
    try out.appendSlice("Hello");
    return out.toOwnedSlice();
}
pub fn main() void {
    const allocator = ...;
    const out = f(allocator);
    defer allocator.free(out);
}
```

- Thanks to hryx#8355, Tetralux#0738 and n00byedge#2651 from zig discord https://discord.com/channels/605571803288698900/1068000302583787531
- [Solving Common Pointer Conundrums - Loris Cro - YouTube](https://www.youtube.com/watch?v=VgjRyaRTH6E)
- https://ikrima.dev/dev-notes/zig/zig-crash-course/#sentinel-termination