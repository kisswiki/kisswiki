```zig
10 % 3 == 1
@rem(-5, 3) == -2
@mod(-5, 3) == 1 // always comes to positive, useful in game when we go out of the map and come back on the other side
```

## %

- Remainder Division.
- Can cause Division by Zero for integers.
- Can cause Division by Zero for floats in FloatMode.Optimized Mode.
- Signed or floating-point operands must be comptime-known and positive. In other cases, use @rem or @mod instead.
- Invokes Peer Type Resolution for the operands.

## @rem

```zig
@rem(numerator: T, denominator: T) T
```

Remainder division. For unsigned integers this is the same as `numerator % denominator`. Caller guarantees `denominator > 0`, otherwise the operation will result in a Remainder Division by Zero when runtime safety checks are enabled.

```zig
@rem(-5, 3) == -2
(@divTrunc(a, b) * b) + @rem(a, b) == a
```

For a function that returns an error code, see `@import("std").math.rem`.

```zig
/// Returns the remainder when numerator is divided by denominator, or
/// an error if denominator is zero or negative. Negative numerators
/// can give negative results.
pub fn rem(comptime T: type, numerator: T, denominator: T) !T {
    @setRuntimeSafety(false);
    if (denominator == 0) return error.DivisionByZero;
    if (denominator < 0) return error.NegativeDenominator;
    return @rem(numerator, denominator);
}
```

## @mod

```zig
@mod(numerator: T, denominator: T) T
```

Modulus division. For unsigned integers this is the same as `numerator % denominator`. Caller guarantees `denominator > 0`, otherwise the operation will result in a Remainder Division by Zero when runtime safety checks are enabled.

```zig
@mod(-5, 3) == 1
(@divFloor(a, b) * b) + @mod(a, b) == a
```

For a function that returns an error code, see `@import("std").math.mod`.

```zig
/// Returns numerator modulo denominator, or an error if denominator is
/// zero or negative. Negative numerators never result in negative
/// return values.
pub fn mod(comptime T: type, numerator: T, denominator: T) !T {
    @setRuntimeSafety(false);
    if (denominator == 0) return error.DivisionByZero;
    if (denominator < 0) return error.NegativeDenominator;
    return @mod(numerator, denominator);
}
```

## Links

- `a % b` and `a %= b`. Remainder Division https://ziglang.org/documentation/master/#Table-of-Operators
- https://ziglang.org/documentation/master/#rem
- https://ziglang.org/documentation/master/#mod
- https://en.m.wikipedia.org/wiki/Modulo
