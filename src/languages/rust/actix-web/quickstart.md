```bash
$ cargo new --bin actix-web-tryout
$ cd actix-web-tryout
# to have `cargo add` available, run `cargo install cargo-edit`
$ cargo add actix actix-web
```

src/main.rs

```rust
extern crate actix;
extern crate actix_web;

use acitx_web::*;

fn main() {
    let sys = actix::System::new("Hello actix");
    let _addr = HttpServer::new(
        || Application()
            .resource("/", |r| r.f(|_| "Hello actix-web")))
    .bind().unwrap()
    .start();
    let _ = sys.run();
}
```
