```zig
const std = @import("std");

// https://github.com/ziglang/zig/issues/4437#issuecomment-683309291
// https://github.com/ziglang/zig/issues/4437#issuecomment-585408987
// https://github.com/zigimg/zigimg/blob/e57148bf6c6df395ef308e559ec833639940220c/tests/helpers.zig#LL14C5-L16C2
pub fn expectEq(expected: anytype, actual: anytype) !void {
    try std.testing.expectEqual(@as(@TypeOf(actual), expected), actual);
}
```

```zig
const util = @import("util.zig");

test {
  try util.expectEq(24000, maximum[0]);
}
```
