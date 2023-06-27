@Travis:

```zig
const std = @import("std");

const Option = enum {
    output_numbers,
    output_numbers_non_empty,
    show_ends,
    squeeze_blank,
    show_tabs,
};

const Options = std.EnumSet(Option);

test {
    var opts = Options.initOne(.show_tabs);
    const opts2 = Options.initMany(&.{
        .output_numbers,
        .output_numbers_non_empty,
        .show_ends,
        .squeeze_blank,
        .show_tabs,
    });
    try std.testing.expect(opts.intersectWith(opts2).bits.mask != 0);
}
```

you can see i used `set.intersectWith(set2).bits.mask != 0` to check if any of the fields are set.

so to use this, you can init one with `Options.initEmpty();`.

and set a single field `opts.insert(.show_ends);`

actually, using a packed struct and bit casting to an integer is a little easier:

```zig
const std = @import("std");

const Options = packed struct {
    output_numbers: bool = false,
    output_numbers_non_empty: bool = false,
    show_ends: bool = false,
    squeeze_blank: bool = false,
    show_tabs: bool = false,
};

test {
    var opts = Options{};
    opts.show_tabs = true;
    opts.show_ends = true;
    try std.testing.expect(@as(u5, @bitCast(opts)) != 0);
}
```

as you can see, packed structs are basically integers in disguise. and a packed struct of N bools only requires N bits.

https://discord.com/channels/605571803288698900/1123032219930333205/1123156872690679839
