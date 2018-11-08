```rust
#[derive(Serialize, Deserialize)]
struct Point {
    x: f64,
    y: f64,
    #[serde(skip_serializing_if = "Vec::is_empty", default)]
    children: Vec<u8>,
}

```

The `skip_serializing_if` attribute specifies a function that is called to decide whether to serialize the current value of the field.
The `default` attribute says to use the `Default::default()` value of the field if it is not present in the input.

[Omit empty Vec · Issue #32 · dtolnay/serde-yaml](https://github.com/dtolnay/serde-yaml/issues/32#issuecomment-257743613)
