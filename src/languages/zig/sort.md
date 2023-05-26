`std.mem.sort(u32, &maximum, {}, comptime std.sort.desc(u32));`

https://github.com/kostya/benchmarks/blob/ee881e34c20834e034565def0e6bbfa2775f4307/primes/primes.zig#L157

```zig
const lessThan = struct {
    pub fn lessThan(_: void, rhs: []const u8, lhs: []const u8) bool {
        return std.mem.order(u8, lhs, rhs).compare(.lt);
    }
}.lessThan;
std.mem.sort(u3, &dice2, {}, lessThan);
```

https://github.com/Vexu/i18n-experiment/blob/3c2757aaa2ec61d95d0c15015ff6896b3cd0b8c0/src/lib.zig#L59

- https://rguiscard.medium.com/zig-tutorial-4-sort-c7ca296faa91
