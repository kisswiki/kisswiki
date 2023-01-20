```zig
//usr/bin/env zig run --enable-cache "$0" -- "$@" | tail -n +2; exit;
pub fn main() void {
    @import("std").debug.print("hello there\n",.{});
}
```

run `./main.zig`

// https://www.reddit.com/r/Zig/comments/107wh7a/running_a_zig_file_like_a_script/
