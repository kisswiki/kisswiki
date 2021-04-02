Lia
—

in short, an allocator is how you ask for memory (and free it again)

https://ziglearn.org/chapter-2/#allocators

you will need to pass an Allocator to ChildProcess.init, if that's what you're using!
here's one way to get one:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
```

the general-purpose allocator is suitable for use in programs. if you're making a library, you probably want to take an allocator from the user and use that.

ok. i assume you are using ChildProcess.init at some point. that needs an Allocator, because it needs the ability to allocate and free memory for its own needs.
if you're writing a program (not a library), i suggest you use a GeneralPurposeAllocator (per above).
if you're writing a library, you should take an allocator argument from your user and pass it to ChildProcess.
same if you use ChildProcess.exec
@clad code speaks better than i do: https://zigbin.io/05bf44
here is an example using an allocator with ChildProcess.exec. hope this helps

you will need to change some *const Allocator to *Allocator
if it's const it won't be able to modify its internal state when you make allocations
i think there'll be some more changes needed too though

##

Lia

You can say `allocator.create(MyNode)` and it'll allocate memory to fit a MyNode and hand it back to you as a `*MyNode`
If you then want to initialise it, you can say `my_node._ = .{ .field_1 = 1, .field_2 = 'x', ... };` (`allocator.destroy(my_node)` will clean that up when you're done with it.)

you will need to pass an Allocator to ChildProcess.init, if that's what you're using!
here's one way to get one:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
```
