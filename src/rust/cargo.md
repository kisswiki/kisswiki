- https://www.reddit.com/r/rust/comments/66ro0b/popular_crates/

## proxy

~/.cargo/config

```
[http]
proxy = "..."
```

http://doc.crates.io/config.html

## no targets specified in the manifest

Cargo.toml

```
[[bin]]
name="server"
path="server.rs"
```

- http://stackoverflow.com/questions/37491436/failed-to-parse-manifest-no-targets-specified
- http://doc.crates.io/manifest.html#configuring-a-target

## working on an existing project

```bash
cargo build
./target/build/main
```

http://doc.crates.io/guide.html#working-on-an-existing-cargo-project

## new project

`cargo new hello_world --bin`

http://doc.crates.io/guide.html

## build all examples

`for i in examples/*; do cargo build --target=x86_64-pc-windows-gnu --verbose --example $(basename $i .rs); done`

- https://github.com/rust-lang/cargo/issues/192
- http://stackoverflow.com/questions/29969208/how-to-build-rust-examples-without-running

## run

By default it will compile and run `src/main.rs`

```
cargo run
```

If you want to have multiple bins, you have to add it to Cargo.toml:

```toml
[[bin]]
name = "main"
path = "src/main.rs"

[[bin]]
name = "server"
path = "src/server.rs"
```

And then run it like that:

```
cargo run --bin main
cargo run --bin server
```

Runing single `cargo run` won't work if specified `[[bin]]`.

https://www.reddit.com/r/rust/comments/2bhr28/cargo_how_to_use_srcbin_effectively/cj5gdq5

## Errors caused by linking to multiple versions of a crate

https://github.com/rust-lang/rust-roadmap/issues/3#issuecomment-278506850

## Specify path to Cargo.toml

`--manifest-path path/to/Cargo.toml`

http://stackoverflow.com/questions/35112929/how-to-specify-the-path-to-a-cargo-toml

You also may need to add to specify bin path:

```toml
[[bin]]
name = "test"
path = "src/test.rs"
```

http://stackoverflow.com/questions/37491436/failed-to-parse-manifest-no-targets-specified
