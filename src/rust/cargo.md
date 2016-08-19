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
