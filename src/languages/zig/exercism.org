https://github.com/rofrol/exercism-zig

## Watchexec

`watchexec -i zig-cache -e zig -r -c reset 'zig test test* 2>&1| less'`

## Sieve

StaticBitSet uses IntegerBitSet or ArrayBitSet depending on size passed.

Iterating over bit set will only iterate over set bits.

You can return slice from slice `return buffer[0..j]`

Or you can do `var buf = buffer; buf.len = 41; return buf;`. https://exercism.org/tracks/zig/exercises/sieve/solutions/kalev666

Sieve of Erastothenes: next to sieve is `j = i * i`, but subsequent are `j += i`, because for 3, there will be 2 * 3 already set thanks to 2.

Nice solution https://exercism.org/tracks/zig/exercises/sieve/solutions/citizen428

```zig
const std = @import("std");
pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var sieve = std.StaticBitSet(limit + 1).initEmpty();
    sieve.set(0);
    sieve.set(1);
    var idx: u32 = 0;
    var n: u32 = 2;
    while (n <= limit) : (n += 1) {
        if (sieve.isSet(n)) continue;
        buffer[idx] = n;
        idx += 1;
        var j = n * n;
        while (j <= limit) : (j += n) {
            sieve.set(j);
        }
    }
    return buffer[0..idx];
}
```

Solution from benchmark https://github.com/PlummersSoftwareLLC/Primes/blob/drag-race/PrimeZig/solution_2/src/prime.zig

## binary search

Nice solution:

```zig
pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    var low: usize = 0;
    var high: usize = items.len;
    while (low < high) {
        const mid = low + (high - low) / 2;
        if (items[mid] == target) return mid;
        if (items[mid] > target) {
            high = mid;
        } else {
            low = mid + 1;
        }
    }
    return null;
}
```

https://exercism.org/tracks/zig/exercises/binary-search/solutions/tdjordjevski

## Matching Brackets

Nice solution:

```zig
const std = @import("std");
const mem = std.mem;
pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var stack = std.ArrayList(u8).init(allocator);
    defer stack.deinit();
    for (s) |char| {
        switch (char) {
            '(', '{', '[' => try stack.append(char),
            ')' => if (stack.popOrNull() != @as(u8, '(')) return false,
            '}' => if (stack.popOrNull() != @as(u8, '{')) return false,
            ']' => if (stack.popOrNull() != @as(u8, '[')) return false,
            else => continue,
        }
    }
    return stack.popOrNull() == null;
}
```

https://exercism.org/tracks/zig/exercises/matching-brackets/solutions/Eisenaxt

## Acronym

Nice solution:

```zig
const std = @import("std");
const mem = std.mem;
pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var between_words: bool = true;
    var abbr = std.ArrayList(u8).init(allocator);
    for (words) |word_char| {
        switch (word_char) {
            ' ', '-', '_' => between_words = true,
            else => if (between_words) {
                try abbr.append(std.ascii.toUpper(word_char));
                between_words = false;
            },
        }
    }
    return abbr.toOwnedSlice();
}
```

https://exercism.org/tracks/zig/exercises/acronym/solutions/Eisenaxt

## secret handshake

My solution

```zig
const std = @import("std");
const mem = std.mem;
// const print = std.debug.print;

pub const Signal = enum {
    wink,
    double_blink,
    close_your_eyes,
    jump,
    reverse,
};

pub fn calculateHandshake(allocator: mem.Allocator, number: isize) mem.Allocator.Error![]const Signal {
    var list = std.ArrayList(Signal).init(allocator);
    errdefer list.deinit();
    var n = number;
    // print("\n", .{});
    {
        var i: usize = 0;
        while (n > 0) : ({
            n >>= 1;
            i += 1;
        }) {
            // print("n: {b}\n", .{n});
            if (n & 1 != 0) {
                try list.append(@intToEnum(Signal, i));
            }
        }
    }
    if (list.items.len != 0 and list.items[list.items.len - 1] == .reverse) {
        // print("last: {}\n", .{list.items[list.items.len - 1]});
        _ = list.pop();
        mem.reverse(Signal, list.items);
        // var i: usize = 0;
        // while (i < list.items.len / 2) : (i += 1) {
        //     var tmp = list.items[i];
        //     list.items[i] = list.items[list.items.len - i - 1];
        //     list.items[list.items.len - i - 1] = tmp;
        // }
    }
    return list.toOwnedSlice();
}
```

Nice solution:

```zig
const std = @import("std");
const mem = std.mem;
pub const Signal = enum { wink, double_blink, close_your_eyes, jump };
pub fn calculateHandshake(allocator: mem.Allocator, number: isize) mem.Allocator.Error![]const Signal {
    var actions = std.ArrayList(Signal).init(allocator);
    errdefer actions.deinit();
    if (number & 0b00001 != 0) try actions.append(Signal.wink);
    if (number & 0b00010 != 0) try actions.append(Signal.double_blink);
    if (number & 0b00100 != 0) try actions.append(Signal.close_your_eyes);
    if (number & 0b01000 != 0) try actions.append(Signal.jump);
    if (number & 0b10000 != 0) mem.reverse(Signal, actions.items);
    return actions.items;
}
```

https://exercism.org/tracks/zig/exercises/secret-handshake/solutions/ErikSchierboom

Also nice:

```zig
const std = @import("std");
const mem = std.mem;
pub const Signal = enum(u4) {
    wink = 0b0001,
    double_blink = 0b0010,
    close_your_eyes = 0b0100,
    jump = 0b1000,
};
const reverse = 0b10000;
pub const signalValues = std.enums.values(Signal);
pub fn calculateHandshake(
    allocator: mem.Allocator,
    number: isize
) mem.Allocator.Error![]const Signal {
    var signals = std.ArrayList(Signal).init(allocator);
    errdefer signals.deinit();
    inline for (signalValues) |signal| {
        if (@enumToInt(signal) & number > 0)
            try signals.append(signal);
    }
    if (number & reverse > 0)
        mem.reverse(Signal, signals.items);
    return signals.items;
}
```

https://exercism.org/tracks/zig/exercises/secret-handshake/solutions/citizen428

## allergies

Niece solution:

```zig
const std = @import("std");
const EnumSet = std.EnumSet;
const IntegerBitSet = std.bit_set.IntegerBitSet;
pub const Allergen = enum(u8) {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};
pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    return initAllergenSet(score).contains(allergen);
}
pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    return .{ .bits = IntegerBitSet(8){ .mask = @truncate(u8, score) } };
}
```

https://exercism.org/tracks/zig/exercises/allergies/solutions/citizen428

- https://github.com/ziglang/zig/blob/0.10.x/lib/std/enums.zig
- https://github.com/exercism/zig/blob/main/exercises/practice/allergies/.meta/example.zig
