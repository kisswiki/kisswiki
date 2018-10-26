```toml
[dependencies.awesome]
version = "1.3.5"
default-features = false # do not include the default features, and optionally
                         # cherry-pick individual features
features = ["secure-password", "civet"]
```

https://doc.rust-lang.org/cargo/reference/manifest.html

also like this

```
[dependencies]
serde_json = { version = "1.0.32", features = ["raw_value"] }
```

https://github.com/serde-rs/json/issues/355#issuecomment-423281429
