```rust
use std::io::Read;
response.read_to_string(&mut buf).expect("Failed to read response");
```

- https://zsiciarz.github.io/24daysofrust/book/vol2/day20.html
- https://doc.rust-lang.org/std/io/trait.Read.html#method.read_to_string
- https://github.com/rust-lang/rust/blob/master/src/libstd/io/mod.rs#L638

copy doesn't work for String:

```
let _ = std::io::copy(&mut res, &mut buffer)?;
   |             ^^^^^^^^^^^^^ the trait `std::io::Write` is not implemented for `std::string::String`
```