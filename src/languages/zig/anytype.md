TLDR; I think the fact that `anytype` makes functions generic but `anyerror` and `anyframe` don't warrant a different syntax and/or naming scheme

I think the confusion here is caused by an inconsistency with the "any\*" types.

`anytype` is not a type in and of itself. It is a "placeholder" for other types. Declaring an `anytype` parameter is what makes functions generic. The word "any" in this case refers to the type itself meaning it can be substituted with "any type".

This is in contrast with `anyerror` and `anyframe` which are actual types and do not make functions generic. They are union types which can hold "any value" from any error type or any frame type respectively. Here the word "any" means the type that can represent "any value", whereas with `anytype`, "any" means the type is a generic placeholder that accepts "any type".

```zig
const std = @import("std");

fn takeAnyError(x: anyerror) void {}
fn takeAnyFrame(x: anyframe) void {}
fn takeAnyType(x: anytype) void { }

pub fn main() void {
    std.debug.print("{}\n", .{&takeAnyError});
    std.debug.print("{}\n", .{&takeAnyFrame});
    // compile error because takeAnyType is generic
    //std.debug.print("{}", .{&takeAnyType});
}
```

At first glance, all 3 `takeAny*` functions appear as if they would behave similarly, but they are actually very different because only `takeAnyType` is generic. Regardless of the actual names, I think using a different naming convention to distinguish between generic and non-generic behavior would be more clear. Whether that means renaming `anyerror`/`anyframe` or `anytype` doesn't seem important but having a clear way to distinguish between them seems more so.

https://github.com/ziglang/zig/issues/5893#issuecomment-660705883
