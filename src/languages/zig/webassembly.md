## Compile

```zig
extern fn print(s: [*:0]const u8, len: i32) void;

export fn helloWorld() void {
    print("Hello, world!", 13);
}
```

```bash
zig build-lib -O ReleaseSmall -target wasm32-freestanding src.zig
```

## This does not export helloWorld

```zig
extern fn print(s: [*:0]const u8, len: i32) void;

export fn helloWorld() void {
    print("Hello, world!", 13);
}

const std = @import("std");

pub fn main() void {
    std.mem.doNotOptimizeAway(helloWorld);
}
```

```bash
$ zig build-exe -O ReleaseSmall -target wasm32-freestanding lol.zig
$ wasm2wat lol.wasm
```

## Test

```bash
$ zig build test-stage2 -Denable-wasmtime
```
