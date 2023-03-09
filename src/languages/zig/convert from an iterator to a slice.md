```zig
const slice: []T = blk: {
    var list = std.ArrayList(T).init(allocator);
    defer list.deinit();
    while (iter.next()) |item| try list.append(item);
    break :blk try list.toOwnedSlice();
};
defer allocator.free(slice);
```

https://discord.com/channels/605571803288698900/1019652020308824145/threads/1082977168369393734
