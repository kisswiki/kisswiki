```zig
const url_platform = try std.fmt.allocPrint(arena, "{s}-{s}", .{ @tagName(builtin.cpu.arch), @tagName(builtin.os.tag) });
```

https://github.com/rofrol/zig-update/blob/3f2cd3030c01dda4ffff29c9be80a98589bea53f/src/main.zig#L40

or

```zig
const url_platform = os ++ "-" ++ arch;
```

https://github.com/marler8997/zigup/blob/f38bd66642dbd61ff4accd35a3dccafa0d8c28b9/zigup.zig#L27
