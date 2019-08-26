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
