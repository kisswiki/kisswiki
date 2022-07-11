- https://ziglang.org/documentation/master/std/#std;fmt.format
- https://github.com/ziglang/zig/blob/master/lib/std/fmt.zig
- https://zig.news/kristoff/where-is-print-in-zig-57e9
- 2s complement is not represented as how the memory actually looks [overhaul std.fmt formatting api · Issue #1358 · ziglang/zig](https://github.com/ziglang/zig/issues/1358#issuecomment-991884315)

## How to print array?

```zig
var items = &[_]u32{ 1, 3 };
std.log.info("items={any}", .{std.mem.span(items)});
std.log.info("items={any}", .{items.*});
//std.debug.print("items={any}", .{@as([]const u32, items)});
std.log.info("items={any}", .{@as([]const u32, items)});
```

https://discord.com/channels/605571803288698900/605572581046747136/935636183185236028

rofrol — Dziś o 21:44

hello,

I got error:

`error: Unknown format string: 's' for type '\*const [2]u32'`

for code

```
var items = &[_]u32{ 1, 3 };
std.log.info("items={s}", .{items});
```

Looking at this https://github.com/ziglang/zig/blob/master/lib/std/fmt.zig

any outputs this `info: items=[2]u32@203a70`

InKryption — Dziś o 21:46

Coerce it to a slice

InKryption — Dziś o 21:46

Nice way of doing that is using `std.mem.span`

But also

KingStnap — Dziś o 21:46

string is u8

InKryption — Dziś o 21:47

You could just pass the array by value
Also true

d3zd3z — Dziś o 21:47

How does `std.mem.span` end up differing from doing `items[0..]`?

InKryption — Dziś o 21:48

Because the zig compiler is free to turn it into a `*const [N]T`

KingStnap — Dziś o 21:48

Pointers to arrays automatically coerce into slices so that shouldn't be an issue

InKryption — Dziś o 21:49

Yeah, but only if the type is present in the first place
fmt is generic
It takes the type as is, without coercion
Afaik

KingStnap — Dziś o 21:50

it is, and yes it means it gets inferred all the way down as a pointer to an array, but the generic code should handle properly.

fengb — Dziś o 21:50

"should"

KingStnap — Dziś o 21:50

"hopefully"

InKryption — Dziś o 21:50

"maybe"

rofrol — Dziś o 21:51

Like this?
var items = &[_]u32{ 1, 3 };
std.log.info("items={s}", .{items[0..]});

but it errors:
error: Unknown format string: 's' for type '\_const [2]u32'

KingStnap — Dziś o 21:51

no you just can't print that like this.
{s} is for stringy things. Which is like a []u8.
you could try items.\_ with {any} if you want to just pass down the array literal

rofrol — Dziś o 21:53

this worked `std.log.info("items={any}", .{std.mem.span(items)});` with `info: items={ 1, 3 }`

InKryption — Dziś o 21:54

Cool cool

KingStnap — Dziś o 21:54

wait for real? today I learned that fmt does that
Who woulda thunk it.
https://discord.com/channels/605571803288698900/640658583666819142/935639446139854890

KingStnap — Dziś o 21:57

%%run

```
var items = &[_]u32{ 1, 3 };
std.debug.print("items={any}", .{@as([]const u32, items)});
```

Zigbot 9001 Dziś o 21:57

`items={ 1, 3 }`

InKryption — Dziś o 21:56

Just want to point out to you a couple things: when you take the address of an array literal, the type of that expression is \*const [len]T, which itself isn't a slice. If you want it to be a slice type, you can make it coerce to such a thing by assigning it to a variable with a type annotation of []const T.
Also note, if you make the variable var when doing this, the memory isn't mutable, only the pointer to the memory. So you may as well make the variable const.
Unless you are going to change what it points to in your program
If you want the memory to be mutable, use a normal array
(or allocate from the heap also works)

rofrol — Dziś o 21:58

great, thanks for this explanation

Looking at span https://github.com/ziglang/zig/blob/366c76744429cb9c2fcd60abad191b7ef40ed5db/lib/std/mem.zig#L657

it does this `ptr[0..l]`?

but `std.log.info("items={any}", .{items[0..]});` outputs `info: items=[2]u32@203cc0`

so why `std.mem.span` gives expected output like `{ 1, 3 }`?

fengb — Dziś o 22:09

items[0..] turns your array pointer into an array pointer

InKryption — Dziś o 22:09

Well, you see, it has to do with the comptime-known-ness of the length slice indexes
If you take a runtime slice, and slice it with [0..3], it will give you a \*[2]T
In the case of both arrays and pointers to arrays
But not pointers to pointers to arrays
Since their length is a comptime known value
Doing [0..] is the same as putting a comptime known index in that last index position
The reason span manages to force it into a slice is because when it's given a pointer to an array, it explicitly coerces it to an appropriate slice type

## binary

```zig
    std.log.info("----", .{});
    std.log.info("{d}", .{'W'});
    std.log.info("{d}", .{'I'});
    std.log.info("{d}", .{'K'});
    std.log.info("{d}", .{'T'});
    std.log.info("{d}", .{'O'});
    std.log.info("{d}", .{'R'});
    std.log.info("----", .{});
    std.log.info("{b}", .{'W'});
    std.log.info("{b}", .{'I'});
    std.log.info("{b}", .{'K'});
    std.log.info("{b}", .{'T'});
    std.log.info("{b}", .{'O'});
    std.log.info("{b}", .{'R'});
```
