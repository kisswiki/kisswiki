## src/bin directory
Cargo must recognize this file as a binary. For example, you can place your file inside src/bin subdirectory, or you could add [[bin]] section to the Cargo.toml (the first option is preferable).

Then run

`cargo run --bin main2.rs`

or main.rs with

`cargo run --bin project_name`

- https://github.com/intellij-rust/intellij-rust/issues/2093#issuecomment-348683328
- https://stackoverflow.com/questions/27613874/how-do-i-tell-cargo-to-build-files-other-than-main-rs
- https://stackoverflow.com/questions/26946646/rust-package-with-both-a-library-and-a-binary
- https://stackoverflow.com/questions/47649318/how-do-i-tell-cargo-to-run-files-from-a-directory-other-than-src


## bin section

```toml
[[bin]]
name = "romgen"
src = "src/romgen.rs"
```

- https://fullsnack.io/en/multiple-binaries-rust.html

## default-run

- https://stackoverflow.com/questions/51785457/how-can-i-specify-which-crate-cargo-run-runs-by-default-in-the-root-of-a-cargo?rq=1
