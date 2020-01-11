```rust
use serde_with;

#[derive(Debug, Serialize, Deserialize)]
struct Data {
    #[serde(with = "serde_with::rust::StringWithSeparator::<CommaSeparator>")]
    y1_list_str: Vec<i32>,
```

- https://github.com/jonasbb/serde_with
  - https://github.com/jonasbb/serde_with/commit/ecd279f54a8ffba882d00ef57a45bfc3f9720886
- [Deserialize comma-separated list · Issue #581 · serde-rs/serde](https://github.com/serde-rs/serde/issues/581#issuecomment-253626616)
