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
