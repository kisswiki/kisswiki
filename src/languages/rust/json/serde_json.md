```rust
&serde_json::Value::Number(ref item_val) => req = req.arg(item_val.as_f64().expect("f64 value")),
```

https://users.rust-lang.org/t/solved-serde-json-deserialize-unknown-json-structure-to-primitive-types/9369/2

## untyped JSON values

- https://github.com/serde-rs/json#operating-on-untyped-json-values
- https://www.packtpub.com/mapt/book/application_development/9781785880254/11/ch11lvl1sec106/parsing-unstructured-json

## full path to the thing that errored out

https://github.com/serde-rs/json/issues/285