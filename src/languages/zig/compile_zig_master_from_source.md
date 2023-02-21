- https://namnd.com/posts/build-zig-from-source/

## mlugg

Step 1: building LLVM (only necessary if system LLVM is <15)
You want a release build of LLVM (even if you want to debug the compiler). The steps are at https://github.com/ziglang/zig/wiki/How-to-build-LLVM,-libclang,-and-liblld-from-source. Note that for libc++ ABI reasons, I've found that it can be necessary to use a recent version of clang to build LLVM in a way that Zig likes; if you don't have one, you can actually use zig cc for it by setting CC="zig cc" and CXX="zig c++".

Step 2: building Zig
If you're using a system install of LLVM:
zig build -p stage3 --zig-lib-dir lib -Denable-llvm

If your system LLVM is outdated, so you compiled LLVM manually in step 1:
cd zig
zig build -p stage3 --search-prefix /path/to/llvm --zig-lib-dir lib -Dstatic-llvm

https://discord.com/channels/605571803288698900/1072209475055931495

## Pyxel

jmc
alright so awkward noob question -- how do I compile Zig master? https://github.com/ziglang/zig-bootstrap worked, but it runs on a specific tagged Zig commit.

Pyxel
i also have a script for this if you need something easier https://github.com/xpyxel/zig-utils/tree/main/scripts
