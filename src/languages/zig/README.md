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
watchexec -w src/main.zig -r 'zig build-exe src/main.zig && main'
```

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

globals are order-independent and lazily-evaluated, can be const (comptime-known) or var (runtime-known)

```zig
const S = struct {
    var x: i32 = 1234;
};
S.x += 1;
```

extern, export, @export to make available to other objects at link time

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
