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

- https://github.com/slapresta/rust-dotenv
- http://siciarz.net/24-days-rust-environment-variables/
- http://neikos.me/Using_Rust_for_Webdev_as_a_Hobby_Programmer.html
- https://github.com/softprops/envy
