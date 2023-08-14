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

Tetralux

To expand on Hyrx's suggestion:

1. Buffer:

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
  - https://zig.news/kristoff/what-s-a-string-literal-in-zig-31e9
- https://ikrima.dev/dev-notes/zig/zig-crash-course/#sentinel-termination

##

We can work around this in a couple of ways:

- Passing the slice in as a parameter to the function
- Making the array global
- Allocating the slice (returning an allocated copy of the slice) [most common]

Passing the slice

```zig
const std = @import("std");

/// Takes a slice as a parameter and fills it with a message.
fn zigBits(slice: []u8) usize {
    // Create an array literal.
    var message = [_]u8{ 'z', 'i', 'g', 'b', 'i', 't', 's' };

    // Print the array as string.
    std.log.debug("{s}", .{message});

    // Update the slice.
    std.mem.copy(u8, slice, &message);
    return message.len;
}

pub fn main() void {
    // Define the message buffer.
    var message: [9]u8 = undefined;

    // Get the message.
    const len = zigBits(&message);

    // Print the message.
    std.log.debug("{s}", .{message[0..len]});
}
```

- https://blog.orhun.dev/zig-bits-01/

## returned concatenated strings is not pointer to stack-allocated memory

```zig
pub fn convert(buffer: []u8, comptime n: u32) []const u8 {
    const pling = if (n % 3 == 0) "Pling" else "";
    const plang = if (n % 5 == 0) "Plang" else "";
    const plong = if (n % 7 == 0) "Plong" else "";
    const result = pling ++ plang ++ plong;
    return if (result.len > 0) result else std.fmt.bufPrint(buffer, "{}", .{n}) catch unreachable;
}
```

- https://github.com/exercism/zig/pull/155#issuecomment-1664584315
- https://github.com/exercism/zig/blob/8832cd5b7543989cc851868cbf7db08a26bf1765/exercises/practice/raindrops/.meta/example.zig 
