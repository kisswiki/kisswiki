
```shell
$ cargo clean && RUSTFLAGS="-C codegen-units=8" time cargo build

143.14user 36.68system 0:44.14elapsed 407%CPU (0avgtext+0avgdata 482804maxresident)k
0inputs+0outputs (0major+2929517minor)pagefaults 0swaps

$ cargo clean && RUSTFLAGS="-C codegen-units=1" time cargo build

117.53user 27.18system 0:41.50elapsed 348%CPU (0avgtext+0avgdata 286164maxresident)k
0inputs+0outputs (0major+2391345minor)pagefaults 0swaps
```

- http://stackoverflow.com/questions/32029486/how-can-i-globally-configure-a-cargo-profile-option
- https://github.com/rust-lang/cargo/blob/master/src/doc/manifest.md
- https://www.reddit.com/r/rust/comments/3tco32/shattering_a_crate_in_pursuit_of_compile_times/
