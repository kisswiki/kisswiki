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
