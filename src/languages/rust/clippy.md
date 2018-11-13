- http://asquera.de/blog/2017-03-03/setting-up-a-rust-devenv/
- https://github.com/Manishearth/rust-clippy
- You cannot exclude deps https://stackoverflow.com/questions/40518446/exclude-dependencies-when-running-clippy

## Install and run

```bash
$ rustup component add clippy-preview --toolchain nightly
$ cargo +nightly clippy
```

## force rerun

Is it needed anymore?

`touch src/main.rs; cargo clippy`

[force full re-clippy · Issue #2604 · rust-lang-nursery/rust-clippy](https://github.com/rust-lang-nursery/rust-clippy/issues/2604)
