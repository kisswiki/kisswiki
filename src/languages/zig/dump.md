```zig
fn dump(args: anytype) void {
    inline for (std.meta.fields(@TypeOf(args))) |field| {
        std.debug.warn("{any} = {any}\n", .{ field.name, @field(args, field.name) });
    }
}
```
