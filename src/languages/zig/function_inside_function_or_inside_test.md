## Use struct

```zig
test "binarySearch" {
  const S = struct {
    fn order_u32(context: void, lhs: u32, rhs: u32) math.Order {
      _ = context;
      return math.order(lhs, rhs);
    }
    fn order_i32(context: void, lhs: i32, rhs: i32) math.Order {
      _ = context;
      return math.order(lhs, rhs);
    }
  };

  try testing.expectEqual(
      @as(?usize, null),
      binarySearch(u32, 1, &[_]u32{}, {}, S.order_u32),
  );
}
```

https://github.com/ziglang/zig/blob/4133bbd67e1e694ffbeb9972c9b9414cb961ce39/lib/std/sort.zig#L32
