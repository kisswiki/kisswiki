`GeneralPurposeAllocator(…)` returns a new type — a struct-based one (as opposed to enum-based or whatever). You could decompose it like this:

```zig
// See https://github.com/ziglang/zig/blob/5d63d1115f0f18984ed7c517c2d85224aa4da444/lib/std/heap/general_purpose_allocator.zig#L115-L156 for what can go in this "Config" parameter.
// Note these configuration options are comptime values — they can influence the code generated for the GPA.
const MyGPAType = std.heap.GeneralPurposeAllocator(.{ .safety = false });

pub fn main() !void {
    // Here we can configure a different set of properties, these changeable at runtime.
    var gpa = MyGPAType{ .backing_allocator = std.testing.allocator };
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // … etc.
}
```

S `std.heap.GeneralPurposeAllocator(.{}){}` creates a new type (returned from the call to `GeneralPurposeAllocator(…)`), then instantiates one copy of it (with `{}`, accepting all default values for the struct type itself).

https://blog.orhun.dev/zig-bits-02/
