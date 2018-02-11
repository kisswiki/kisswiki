```rust
// if let Value::Array(val) = v {
//     println!("{}", val.len());
// }

// when reusing v
if let &Value::Array(ref val) = &v {
    println!("{}", val.len());
}

if v.is_array() {
    println!("{}", v.as_array().unwrap().len());
}
```

- non-reference pattern used to match a reference (see issue #42640) https://github.com/rust-lang/rust/issues/42640
- https://stackoverflow.com/questions/37267060/reference-to-parameters-within-an-enum