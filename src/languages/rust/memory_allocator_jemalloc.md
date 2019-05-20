Until now, rustc implicitly linked the jemalloc memory allocator to every Rust program (not staticlib or cdylib libraries) by default on some platforms (including Linux and macOS). jemalloc is often more performant than the system’s allocator, but not always, and it adds a non-trivial amount to the size of the executable.

In Rust 1.28, we stabilized the #[global_allocator] attribute that allows a program to opt into another memory allocator, and the std::alloc::System type to represent the system’s default allocator.

PR #55238 has landed today, removing jemalloc from the Rust standard library. So starting with tomorrow’s Rust Nightly, Rust programs will use the system allocator by default. You can use the jemallocator crate together with #[global_allocator] if you want to keep using jemalloc.

https://www.reddit.com/r/rust/comments/9twam5/jemalloc_was_just_removed_from_the_standard/


>It also turns out Jemalloc has a knob for exactly this. It can start its own background threads to do these cleanups without disrupting the application. https://vorner.github.io/2019/05/19/rust-in-avast.html


Adding the background_threads feature to jemalloc in Cargo.toml:

```toml
jemallocator = { version = "~0.3", features = ["background_threads"] }
```

https://www.reddit.com/r/rust/comments/bqewnp/rust_in_avast/eo4kg5v/
