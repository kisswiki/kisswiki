- https://actix.rs/docs/errors/

## no method named `poll` found for type `actix_web::HttpRequest` in the current scope

In Cargo.toml change from

```toml
futures = "0.2"
```

to

```toml
futures = "0.1"
```

## A payload reached size limit

add `.body().limit(65536)` in KiB. That would be 64 MiB.

```rust
fn step() -> Box<Future<Item = serde_json::Value, Error = actix_web::error::Error>> {
    Box::new(
            client::ClientRequest::get("https://example.com")
                .finish()
                .unwrap()
                .send()
                .map_err(actix_web::error::Error::from) // <- convert SendRequestError to an Error
                .and_then(|resp| {
                    resp.body() // <- this is MessageBody type, resolves to complete body
                        .limit(65536)
                        .from_err() // <- convert PayloadError to an Error
                        .and_then(|body| {
                            let resp: serde_json::Value = serde_json::from_slice(&body).unwrap();
                            fut_ok(resp)
                        })
                }),
        )
}

fn request(req: &HttpRequest) -> Box<Future<Item = HttpResponse, Error = actix_web::error::Error>> {
    step()
        .and_then(|d| {
            println!("{:?}", &d);
            Ok(HttpResponse::Ok()
                .content_type("application/json")
                .body(serde_json::to_string(&d).unwrap())
                .into())
        })
        .responder()
}
```

- This gave me a clue to use `limit()` on `body` [Connection Reset with FutureResponse and body-limit · Issue #563 · actix/actix-web](https://github.com/actix/actix-web/issues/563#issuecomment-433283112)
- https://actix.rs/actix-web/actix_web/dev/struct.PayloadConfig.html#method.limit
