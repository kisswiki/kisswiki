```rust
#[macro_use]
extern crate serde_derive;

extern crate serde;
extern crate serde_json;

#[derive(Deserialize, Debug)]
struct Coordinate {
    longitude: f64, 
    latitude: f64,
}

fn main() {
    let j = r#"
        [121.4472492, 25.0052053]"#;
    println!("{:#?}", serde_json::from_str::<Coordinate>(j).unwrap());
}
```

- https://play.rust-lang.org/?gist=c4d5de2dff930ff7feb4daddd385d47f
- https://stackoverflow.com/questions/51890312/parsing-json-with-multiple-representation-in-the-same-attribute
- [De/serialize struct as an array of values · Issue #637 · serde-rs/serde](https://github.com/serde-rs/serde/issues/637)
- https://stackoverflow.com/questions/47237256/how-to-convert-vector-of-tuples-to-json-objects
