## motivation

- [Why I rewrote my Rust keyboard firmware in Zig: consistency, mastery, and fun](https://kevinlynagh.com/rust-zig/)
  - https://news.ycombinator.com/item?id=26374268
    - also comments from user pron

## init

```bash
zig init-exe
zig build-exe src/main.zig
./main
```

## autorun

```bash
cargo install watchexec
# on windows
watchexec -w src/main.zig -i zig-cache -e zig 'printf \n\n && zig build-exe src/main.zig && main'
# on linux
watchexec -w src/main.zig -i zig-cache -e zig 'printf \n\n && zig build-exe src/main.zig && ./main'
```

for rustlings

`watchexec -w exercises -i zig-cache -e zig zig build`

## syntax

top-level consts are order-independent

const

var

try - if statement can fail

function can return error or value or nothing

!void - returns anyerror or void

void - returns nothing

```zig
pub fn main() !void {
// this is
// multiline comment

const multiline_string_literal =
// this is
// multiline string literal
}
}
```

`expect`

`test "name" {}`

`zig test test.zig`

var needs type

`var y: i32 = 2823;`

variables must be initialized or assigned `undefined`

`var y: i32 = undefined`

undefined is `0xaa` in debug

variables cannot shadow outer scope identifiers

## global variables

globals are order-independent and lazily-evaluated, can be const (comptime-known) or var (runtime-known)

```zig
const S = struct {
    var x: i32 = 1234;
};
S.x += 1;
```

extern, export, @export to make available to other objects at link time

- [Docs clarification: local static variable](https://github.com/ziglang/zig/pull/8381)

##

`threadlocal var`

threadlocals in single-threaded builds are globals

threadlocal may not be const

```zig
const thread1 =try std.Thread.spawn(testTls, {});
thread1.wait();
```

local variables

comptime colors all expressions using comptime variables to also be comptime

```zig
comptime var y: i32 = 1;
y += 1;
if(y != 2) {
// never reaches here
}
```

divistion operation is vunlerable to integer overflow

INT_MIN == -INT_MAX - 1

and thus

INT_MIN < -INT_MAX

and thus

INT_MIN / -1 > -INT_MAX / -1

and thus

INT_MIN / -1 > INT_MAX.

- https://stackoverflow.com/questions/30394086/integer-division-overflows
  - https://en.wikipedia.org/wiki/Two%27s_complement

## wrapping addition, substraction, negation, multiplication

```zig
@as(u32, std.math.maxInt(u32)) +% 1 == 0
@as(u32, 0) -% 1 == std.math.maxInt(u32)
-%@as(i32, std.math.minInt(i32)) == std.math.minInt(i32)

```

##

The maximum allowed bit-width of an integer type is 65535 = 2^16 - 1

What about u128?

2^129 - 1 = 680564733841876926926749214863536422911

https://www.wolframalpha.com/input/?i=2%5E129-1

## std.log.info or std.debug.debug.print use fmt.format for options

```zig
print("std.math.minInt(i16) binary: {b}\n", .{std.math.minInt(i16)});
```

`.{}` is anonymouse list literal https://twitter.com/andy_kelley/status/1194046250909392902/photo/1

- https://ziglang.org/documentation/master/std/#std;fmt.format
- https://github.com/ziglang/zig/blob/9f01598a498ecbd868cb81dc1efdb1507010c1b8/lib/std/fmt.zig#L55
- https://github.com/ziglang/zig/issues/1358

## @as

```zig
const big = @as(f64, 1 << 40);
```

## orelse

```zig
const value: ?u32 = null;
const unwrapped = value orelse 1234;
unwrapped == 1234
```

## unwrap optional

```zig
const value: ?u32 = 5678;
value.? == 5678
```

## error union

```zig
const value: anyerror!u32 = error.Broken;
const unwrapped = value catch 1234;
unwrapped == 1234
```

## boolean

```zig
(false and true) == false
false or true == true
!false == true
(1 == 1) == true
const value: ?u32 = null;
value == null
```

## array

concatenation

```zig
[_]u32{1,2} ++ [_]u32{3,4} == &[_]u32{1,2,3,4}
```

multiplication

```zig
"ab" ** 3 == "ababab"
```

## expression value is ignored

```zig
// this errors
// mem.eql(u32, &together, &[_]u32{ 1, 2, 3, 4 });

// use this
const result = mem.eql(u32, &together, &[_]u32{ 1, 2, 3, 4 });

// or this
expect(mem.eql(u32, &together, &[_]u32{ 1, 2, 3, 4 }));
```

## pointers

```zig
const x: u32 = 1234;
const ptr = &x;
ptr.* == 1234
```

## merging error sets

```zig
const A = error{One};
const B = error{Two};
(A || B) == error{One, Two}
```

## iterating over array

```zig
var integers = [_]i32{ 1, 2 };
print("{any}\n", .{integers});
print("{any}\n", .{integers[0]});

var some_integers: [100]i32 = undefined;
for (some_integers) |*item, i| {
    item.* = @intCast(i32, i);
}
```

## numbers

i16 is 15 bits

```zig
expect(0b111_1111_1111_1111 == std.math.maxInt(i16))
print("{}\n", .{std.math.maxInt(i16)});
print("{b}\n", .{std.math.maxInt(i16)});
```

u8 can hold 8 bits (0 to 255)

## dump function

```zig
fn dump(args: anytype) void {
    inline for (std.meta.fields(@TypeOf(args))) |field| {
        std.debug.warn("{any} = {any}\n", .{ field.name, @field(args, field.name) });
    }
}
```

- https://twitter.com/andy_kelley/status/1194046250909392902

## Sentinel-Terminated Arrays

```zig
const arr = [_:0]u8{1,2,3,4};
expect(arr[len] === 0);
```

## pointers

TODO: pointers

## slices

TODO: slices

## structs

TODO: structs

You can return a struct from a function. This is how we do generics in Zig

Since all structs are anonymous, Zig infers the type name based on a few rules.

## from erik engheim blog

if and while accept boolean or optional

https://web.archive.org/web/20210301143402/https://medium.com/swlh/zig-the-introduction-dcd173a86975 (disable uBlock Origin and stop when content loaded, otherwise page will be blank)

## rustlings

switch has else

switch is an expression

unreachable

### format string

```zig
<span style="color: #{x:0>6}">Red</span>
```

### pointers

```zig
var unlocked: u8 = 10;
const p5: *const u8 = &unlocked;
```

Note that you don't need to dereference the "pv" pointer to access the struct's fields

### optionals

```zig
const foo = bar.?;
```

is the same as

```zig
const foo = bar orelse unreachable;
```

### optional and result and void

> [null] is **typically** used with optional types

optional: null?value

result: error<err>!value

result is tagged union. Similar to optional but error wraps err.

```zig
var foo: void = {};
```

assign empty expression to variable of type void

```zig
var a: i32 = 2;
print("a = 2 : {}\n", .{a});
a = undefined;
print("a = undefined : {}\n", .{a});
```

prints:

```
a = 2 : 2
a = undefined : -1431655766
```

## slice

You do not put underscore like `const hand1: [_]u8`. Underscore is for array to infer the size.

```zig
var cards = [8]u8{ 'A', '4', 'K', '8', '5', '2', 'Q', 'J' };

// Please put the first 4 cards in hand1 and the rest in hand2.
const hand1: []u8 = cards[0..4];

fn printHand(hand: []u8) void {
    for (hand) |h| {
        std.debug.print("{u} ", .{h});
    }
}
```

## pointer vs slice

```zig
var foo: [4]u8 = [4]u8{ 1, 2, 3, 4 };
var foo_slice: []u8 = foo[0..];
var foo_ptr: [*]u8 = &foo;
```

pointer to multiple items is `[*]`. Why not `*[]`?

- `*T` - single-item pointer to exactly one item.
- `[*]T` - many-item pointer to unknown number of items.
  - Similar to `*[N]T`, except `T` must have a known size, which means that it cannot be c_void or any other opaque type.
- `*[N]T` - pointer to N items, same as single-item pointer to an array.

https://ziglang.org/documentation/master/#Pointers

```
//     FREE ZIG POINTER CHEATSHEET! (Using u8 as the example type.)
//   +---------------+----------------------------------------------+
//   |  u8           |  one u8                                      |
//   |  *u8          |  pointer to one u8                           |
//   |  [2]u8        |  two u8s                                     |
//   |  [*]u8        |  pointer to unknown number of u8s            |
//   |  [2]const u8  |  two immutable u8s                           |
//   |  [*]const u8  |  pointer to unknown number of immutable u8s  |
//   |  *[2]u8       |  pointer to an array of 2 u8s                |
//   |  *const [2]u8 |  pointer to an immutable array of 2 u8s      |
//   |  []u8         |  slice of u8s                                |
//   |  []const u8   |  slice of immutable u8s                      |
//   +---------------+----------------------------------------------+
```

## string

```zig
const zen12: *const [21]u8 = "Memory is a resource.";
//
//   It would also have been valid to coerce to a slice:
//         const zen12: []const u8 = "...";
```

## tagged union

Enum can be infered. Instead of this

```zig
const InsectStat = enum { flowers_visited, still_alive };

const Insect = union(InsectStat) {
    flowers_visited: u16,
    still_alive: bool,
};
```

we can right this

```zig
const Insect = union(enum) {
    flowers_visited: u16,
    still_alive: bool,
};
```

Also in official documentation there is no mention that in switch we don't have to use `Enum.field` to match, just `.field`.

Also with normal compare:

```zig
    const version = std.builtin.zig_version;
    const order = version.order(needed_version);
    return order != .lt;
```

## operations on string

- https://zigforum.org/t/strings-in-zig-what-do-i-miss/188/6

## official documentation continue

Blocks limit scope of variable declarations.

Blocks are expressions. When labeled, you can a value with `break`.

```zig
{
    var x: i32 = 1;
}
const x = blk: {
    y += 1;
    break :blk y;
};
```

Strange that you need to use this `blk` label.

## post code to zigbin.io

https://zigbin.io/0f4af2

## args

First argument is executable name. You do not provide it in command line. It is given.

```zig
var args_iter = std.process.args();
const exe_name = try (args_iter.next(allocator) orelse return error.MissingArgument);
defer allocator.free(exe_name);
```

https://github.com/MasterQ32/zig-network/blob/72082f77a31a2bf9f1e457839acc188e6a210aa4/examples/echo.zig#L22

## parseInt

```zig
const port_number = try std.fmt.parseInt(u16, port_name, 10);
```

https://github.com/MasterQ32/zig-network/blob/72082f77a31a2bf9f1e457839acc188e6a210aa4/examples/echo.zig#L28

## ziglings

if function is annotated to return error union, but it does not, there will be compiler error.

in switch statement, case needs to end with coma. Add parentheses you if you need more statements in case.

## Use master version

It is adviced to use master version, for example with https://github.com/rofrol/zig-utils/blob/main/scripts/zupd.

But zls is tracking latest release, not master https://www.reddit.com/r/Zig/comments/n8oih2/basic_zig_extensions_dont_have_error_highlighting/gxk98vi/.

## blk example

```zig
        const offset = blk: {
            if (lhs == .code_offset) break :blk lhs.code_offset;
            if (rhs == .code_offset) break :blk rhs.code_offset;
            break :blk self.code.items.len;
        };
```

https://github.com/ziglang/zig/pull/8847/files#diff-9ce0a4b8e7f543bcef9fa9b480a1588a459deab87fc80f924408b532c3ae7dc3R867
