## run all tests

purple

is there a way to run "all" tests, or must one run zig test for each file that contains tests?

ifreund

you can import all your tests into a test_main.zig or similar
have a block like

```zig
test "all tests" {
_ = @import("other_file_with_tests.zig");
_ = @import("another.zig");
}
```

purple

The reason it didn’t run them all when I test main.zig is because of zig’s laziness right? The imports are unreachable from my tests in main.zig?

ifreund

Yeah, they aren't referenced so they aren't semantically analyzed by the compiler and the tests aren't found

## debug

```
zig test file.zig -femit-bin=./tests-binary
gdb ./tests-binary
```

or

```
zig test ./test.zig --test-cmd gdb --test-cmd '--eval-command=run' --test-cmd-bin
```

https://zigforum.org/t/how-to-debug-zig-tests-with-gdb-or-other-debugger/487/3

## unable to resolve comptime value

```zig
try expectEqual(6, moves.items.len);
```

Solution

```zig
try expectEqual(@as(usize, 6), moves.items.len);
```

- [Proposal: flip expected and actual in std.testing.expectEqual · Issue #4437 · ziglang/zig](https://github.com/ziglang/zig/issues/4437#issuecomment-1439385595)

## Reverse

```zig
// reversed order, taken from zigimg
// I expect a + b to equal 42
pub fn expectEq(actual: anytype, expected: anytype) !void {
    try std.testing.expectEqual(@as(@TypeOf(actual), expected), actual);
}
```

- https://github.com/ziglang/zig/issues/4437#issuecomment-1523061747
- https://github.com/ziglang/zig/issues/4437#issuecomment-683309291
- https://github.com/ziglang/zig/issues/4437#issuecomment-585408987
- https://github.com/zigimg/zigimg/blob/e57148bf6c6df395ef308e559ec833639940220c/tests/helpers.zig#LL14C5-L16C2
