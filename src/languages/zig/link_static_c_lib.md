## example

squirl — 01/19/2024 11:20 AM

`addLibraryPath` provides a directory to search libraries in, not a path to a library

For a static library in a known location, I'd probably use `exe.addObjectFile(.{.path = "path/to/lib.a"})` but you could also use `exe.addLibraryPath(.{.path = "path/to"}); exe.linkSystemLibrary("lib");`

(`addObjectFile` should work fine with static libs too)

However, the best way to do this is to use Zig to build your static library in the first place, and then you can link the artifact in very easily using `exe.linkLibrary(lib)`

- https://discord.com/channels/605571803288698900/1019652020308824145/threads/1197845845043859497

## Other example

- https://ziggit.dev/t/a-simple-example-of-calling-a-c-library-from-zig/2225
  - https://mtlynch.io/notes/zig-call-c-simple/
