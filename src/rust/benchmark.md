- http://benchmarksgame.alioth.debian.org/u64q/rust.html

> On non-SIMD tasks Rust/C are neck and neck
> In 5 of 10 benchmarks, C is twice as fast as Rust
> fannkuch-redux why? SIMD
> fasta-redux why? SIMD
> spectral-norm why? SIMD
> reverse-complement why? SIMD
> N-Body why? Oh you guessed it SIMD
> All 5 of these tests boil down to raw FLOPS. Which C/C++ having access to SIMD instructions wins at.
> Where exactly are the floating-point operations in fannkuch-redux Rust \#2 program ?
Where exactly are the floating-point operations in reverse-complement ?
> Rust is also slower in binarytrees, regexdna and fasta. SSE is not one "barely used corner case" because huge amounts of performance critical code takes advantage of it.
> https://news.ycombinator.com/item?id=11878881

- https://users.rust-lang.org/t/a-good-performance-comparision-c-and-rust/5901/8
- https://users.rust-lang.org/t/why-is-rust-n-body-benchmark-slower-than-c/5951/2

> most variations of the C++ version run only half as fast as they should on Intel Haswell chips, when built with Gcc or Clang, 5 a consequence of an instruction-sequence choice that makes the main inner loop take two cycles instead of one. (Wrapping “!(word & ~seven)” in __builtin_expect(..., false) helps.) It’s possible that Gcc will learn someday to generate better code for Haswell and newer Skylake chips
> http://cantrip.org/rust-vs-c++.html
