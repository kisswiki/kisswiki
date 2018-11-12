## Field is missing when deserializing, we want to have default value and we want to skip it when serializing if default

```rust
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    suffixes: Vec<Suffix>,
```

## Field is missing when deserializing, and we want to skip it when serializing is and it is Option None

```rust
    #[serde(default, skip_serializing_if = "Option::is_none")]
    suffixes: Option<Vec<Suffix>>,
```

## Missing field or null

```rust
#[macro_use]
extern crate serde_derive;

extern crate serde;
extern crate serde_json;

use serde::{Deserialize, Deserializer};

#[derive(Deserialize, Debug)]
struct S {
    #[serde(default, deserialize_with = "deserialize_some")]
    a: Option<Option<i32>>,
}

// Any value that is present is considered Some value, including null.
fn deserialize_some<'de, T, D>(deserializer: D) -> Result<Option<T>, D::Error>
    where T: Deserialize<'de>,
          D: Deserializer<'de>
{
    Deserialize::deserialize(deserializer).map(Some)
}

fn main() {
    println!("{:?}", serde_json::from_str::<S>("{}").unwrap());
    println!("{:?}", serde_json::from_str::<S>("{\"a\":null}").unwrap());
    println!("{:?}", serde_json::from_str::<S>("{\"a\":1}").unwrap());
}
```

https://github.com/serde-rs/serde/issues/984#issuecomment-314143738
