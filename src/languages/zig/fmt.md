`zig fmt` tries to upgrade code to current zig version.

Open bugs https://github.com/ziglang/zig/labels/zig%20fmt

## Bug 1

This code will

```zig
const DAYS_IN_MONTH = [12]u8{
    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
```

will be formatted incorrectly by `zig fmt` to this

```zig
const DAYS_IN_MONTH = [12]u8{
};
```

This is a bug. Put a closing brace in the next line as a workaround:

```
const DAYS_IN_MONTH = [12]u8{
    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
};
```

## Bug 2

- [zig fmt messes `if` indentation after line break · Issue #7363 · ziglang/zig](https://github.com/ziglang/zig/issues/7363)

Formats this

```zig
var dt =
    if (self.zone.offset == zone.offset)
        (self.copy() catch unreachable)
    else
       self.shiftMinutes(zone.offset - self.zone.offset);
```

into this

```zig
var dt =
    if (self.zone.offset == zone.offset)
    (self.copy() catch unreachable)
else
    self.shiftMinutes(zone.offset - self.zone.offset);
```

## params in new line

if you add trailing comma after function call `std.HashMap(u32, u32),` below

```zig
const variable = if (condition) std.thingo.how_long_can_you_read.TypeThing(u32, i32, std.HashMap(u32, u32)).init() else foobar;
```

we be formatted to

```zig
const variable = if (condition) std.thingo.how_long_can_you_read.TypeThing(
    u32,
    i32,
    std.HashMap(u32, u32),
).init() else foobar;
```
