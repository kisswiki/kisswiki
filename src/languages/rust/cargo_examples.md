```bash
# build single
cargo build --example file

# build all
for i in examples/*; do cargo build --example $(basename $i .rs); done
```

##

```bash
~/personal_projects/jakrom-shop/server (master)$ cargo run
   Compiling juniper-example v0.1.0 (file:///Users/romanfrolow/personal_projects/jakrom-shop/server)
error[E0425]: cannot find function `new` in module `server`
   --> src/main.rs:101:21
    |
101 |     let _ = server::new(move || {
    |                     ^^^ not found in `server`

error[E0603]: module `http` is private
  --> src/main.rs:16:29
   |
16 | use actix_web::{middleware, http, server,
   |                             ^^^^

error: aborting due to 2 previous errors

error: Could not compile `juniper-example`.

To learn more, run the command again with --verbose.
```

##

```bash
~/personal_projects/rust/vendor/actix-web/examples/juniper (master)$ cargo run
   Compiling juniper-example v0.1.0 (file:///Users/romanfrolow/personal_projects/rust/vendor/actix-web/examples/juniper)
error[E0599]: no method named `unwrap` found for type `actix_web::HttpResponse` in the current scope
  --> examples/juniper/src/main.rs:70:21
   |
70 |         .body(html).unwrap())
   |                     ^^^^^^

error[E0277]: the `?` operator can only be applied to values that implement `std::ops::Try`
  --> examples/juniper/src/main.rs:82:40
   |
82 |                         Ok(user) => Ok(HttpResponse::Ok().body(user)?),
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the `?` operator cannot be applied to type `actix_web::HttpResponse`
   |
   = help: the trait `std::ops::Try` is not implemented for `actix_web::HttpResponse`
   = note: required by `std::ops::Try::into_result`

error: aborting due to 2 previous errors

error: Could not compile `juniper-example`.

To learn more, run the command again with --verbose.
```
