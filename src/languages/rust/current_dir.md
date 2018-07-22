```rust
use std::env;
use std::path::Path;

let root = Path::new("/");
assert!(env::set_current_dir(&root).is_ok());
println!("Successfully changed working directory to {}!", root.display());
```

https://doc.rust-lang.org/std/env/fn.set_current_dir.html
