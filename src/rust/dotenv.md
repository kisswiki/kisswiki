deps:

```toml
[dependencies]
dotenv = "0.10.0"
dotenv_macros = "0.10.0"
```

```rust
#![plugin(dotenv_macros)]

extern crate dotenv;

fn main() {
    println!("{:?}", dotenv!("data_server"));
}
```

.env

```
data_server=example.com
```
