- https://github.com/actix/actix-web/blob/master/MIGRATION.md
- https://docs.rs/crate/actix-web
- https://docs.rs/actix-web/1.0.0-beta.5
- https://docs.rs/actix-web/0.7.19
- [migration_from_actix-web-0.7.19_to_1.0.0-beta.5.md](https://gist.github.com/rofrol/351f97c40ebc83c20882c2859db8c626)

## Errors

```
error[E0277]: the trait bound `&actix_web::request::HttpRequest: actix_web::extract::FromRequest` is not satisfied
   --> src/main.rs:194:70
    |
194 |             .service(web::resource("/js/{file:.*}").route(web::get().to(files::js)))
    |                                                                      ^^ the trait `actix_web::extract::FromRequest` is not implemented for `&actix_web::request::HttpRequest`
```

Solution: use `.to_async`



Use `impl Future` instead of `FutureResult`

Use `fn index(req: HttpRequest)` instead of `fn index(&req: HttpRequest)`


After`cargo upgrade` (from `cargo-edit`):

```
    Upgrading actix-files v0.1.3 -> v0.1.4
    Upgrading serde_derive v1.0.94 -> v1.0.99
    Upgrading serde v1.0.94 -> v1.0.99
    Upgrading actix-web v1.0.3 -> v1.0.5
```

it does not compile:

```
512 |             Err(e) => return Either::A(err(Error::from(e).into())),
    |                                            ^^^^^^^^^^^ the trait `actix_http::error::ResponseError` is not implemented for `serde_urlencoded::ser::Error`
```

Solution: `cargo clean && rm Cargo.lock`

- [actix-web DOES NOT build because of `awc` dependecy compilation error · Issue #1048 · actix/actix-web](https://github.com/actix/actix-web/issues/1048#issuecomment-523683114)
