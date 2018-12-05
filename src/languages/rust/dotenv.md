- can't have empty keys like this in `.env`: `host=`
- `.env` will be searched for up

Using `dotenv_macros` fails for me.

deps:

```toml
[dependencies]
dotenv = "0.13.0"
```

```rust
extern crate dotenv;

use dotenv::dotenv;
use std::env;

fn main() {
    dotenv().ok();

    for (key, value) in env::vars() {
        println!("{}: {}", key, value);
    }

    println!("HOME: {:?}", env::var("HOME"));
    println!("HOME: {:?}", option_env!("HOME")); // no need to dotenv().ok()
    println!("HOME: {:?}", env!("HOME")); // compile error if env not present
}
```

.env

```
data_server=example.com
```
- https://github.com/apiraino/rust-dotenv
  - https://users.rust-lang.org/t/rust-dotenv-repository-disappeared/22737
- http://siciarz.net/24-days-rust-environment-variables/
- http://neikos.me/Using_Rust_for_Webdev_as_a_Hobby_Programmer.html
- https://github.com/softprops/envy
