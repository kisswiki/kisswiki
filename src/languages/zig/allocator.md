Lia
—
you will need to pass an Allocator to ChildProcess.init, if that's what you're using!
here's one way to get one:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
```

the general-purpose allocator is suitable for use in programs. if you're making a library, you probably want to take an allocator from the user and use that.
