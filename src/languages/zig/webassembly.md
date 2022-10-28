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

## Links

- https://dev.to/sleibrock/webassembly-with-zig-part-1-4onm
- https://developer.mozilla.org/en-US/docs/WebAssembly/Loading_and_running
- Zig + WebAssembly + JS + DOM https://github.com/shritesh/zig-wasm-dom
- tiny Zig allocator primarily targeting WebAssembly https://github.com/fengb/zee_alloc
- Zig WebAssembly Runtime Engine https://github.com/malcolmstill/zware
- Zig bindings for the Wasmer WebAssembly runtime https://github.com/zigwasm/wasmer-zig
- https://www.wasm.builders/ydvsahitya/webassembly-with-zig-702
- https://blog.cloudflare.com/running-zig-with-wasi-on-cloudflare-workers/
- Original 1962 game code running on a PDP-1 emulator in Zig + Wasm + JS + HTML5 Canvas https://github.com/daneelsan/spacewasm/
- build to target wasm https://github.com/daneelsan/spacewasm/blob/master/build.zig
- https://stackoverflow.com/questions/68476647/errors-with-compiling-zig-to-wasm32-freestanding
- Zig has been designed from the ground up with C interop as a first class feature. In this section we will go over how this works. https://ziglearn.org/chapter-4/
- export fn https://www.reddit.com/r/Zig/comments/fqd4zo/parameter_issues/
- Getting Zig compiling to WASM https://gist.github.com/josephg/873a21d4558fd69aeccea19c3df96672
- A simple tetris clone written in zig programming language https://github.com/raulgrell/tetris
- https://www.reddit.com/r/Zig/comments/r52ehv/wasm4_is_a_virtual_game_console_for_building/
- using typescript, also implements console_log_ex https://github.com/meheleventyone/zig-wasm-test
- WASI bad?
  - https://www.assemblyscript.org/standards-objections.html
  - https://news.ycombinator.com/item?id=32
- https://github.com/appcypher/awesome-wasm-runtimes
- https://blog.logrocket.com/webassembly-runtimes-compared/
