Hashi364
—
30.03.2021
Is there a way of creating a struct at compile time?
mason1920
—
30.03.2021
I'd think you'd use a TypeInfo, populate it, and send it through @Type

##

prime31
—
30.03.2021
Tuples have a len field
Hashi364
—
30.03.2021
So .{a, b} is a tuple. Can I create a tuple at compile time?
Specs_guy
—
30.03.2021
Yes, tuples share type info with structs, but set the is_tuple flag and have field names "0", "1", etc. See std.meta.Tuple for an example.
Hashi364
—
30.03.2021
Do something like, this

var tuple = undefined;
inline for (things) |thing, i| {
tuple[i] = thing;
}

Specs_guy
—
30.03.2021
You can also use this trick:

const Any = struct { value: anytype };
comptime var tuple: Any = .{ .value = .{} };
inline for (things) |thing| {
tuple.value = tuple.value ++ .{thing};
}
@call(.{}, func, tuple.value);

Hashi364
—
30.03.2021
I think it makes sense
Specs_guy
—
30.03.2021
For this variant, you would need:

var tuple: std.meta.Tuple(things_types) = undefined;
inline for (things) |thing, i| {
tuple[i] = thing;
}

Hashi364
—
30.03.2021
At the end you call func(.{thing1, thing2, ...}) ?
Specs_guy
—
30.03.2021
Yep, that's the tuple in tuple.value.
@call bypasses a tuple though, so this calls
func(thing1, thing2, ...) directly.
Hashi364
—
30.03.2021
Isn't it func(thing1, thing2, ...) ?
Yes, that
ZIG IS AWESOME!
Hashi364
—
30.03.2021
I'll try this
%%std.meta.Tuple
Zigbot 9001BOT
—
30.03.2021
std.meta.Tuple
https://github.com/ziglang/zig/blob/master/lib/std/meta.zig#L1224-L1253
