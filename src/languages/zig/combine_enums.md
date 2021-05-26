```zig
const E1AndE2 = @Type(out: {
    const fields = @typeInfo(E1).Enum.fields ++ @typeInfo(E2).Enum.fields;
    break :out .{
        .Enum = .{
            .layout = .Auto,
            .tag_type = std.math.IntFittingRange(0, fields.len - 1),
            .decls = &[_]std.builtin.TypeInfo.Declaration{},
            .fields = fields,
            .is_exhaustive = true,
        },
    };
});
```

https://zigforum.org/t/can-enums-be-combined/485/2
