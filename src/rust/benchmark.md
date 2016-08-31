- http://benchmarksgame.alioth.debian.org/u64q/rust.html
  - On non-SIMD tasks Rust/C are neck and neck https://news.ycombinator.com/item?id=11878881
- https://users.rust-lang.org/t/a-good-performance-comparision-c-and-rust/5901/8

> most variations of the C++ version run only half as fast as they should on Intel Haswell chips, when built with Gcc or Clang, 5 a consequence of an instruction-sequence choice that makes the main inner loop take two cycles instead of one. (Wrapping “!(word & ~seven)” in __builtin_expect(..., false) helps.) It’s possible that Gcc will learn someday to generate better code for Haswell and newer Skylake chips
> http://cantrip.org/rust-vs-c++.html
