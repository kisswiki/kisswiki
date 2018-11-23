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

add `.body().limit(67108864)` in iB. That would be 64 MiB.

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

## add explicit lifetime `'static` to the type of `req`: `&'static actix_web::HttpRequest`

>you need to copy request if you want to use it with future combinators

```rust
#[derive(Debug, Deserialize)]
#[serde(deny_unknown_fields)]
struct SearchObj {
    value: String,
}

fn search(req: &HttpRequest) -> Box<Future<Item = HttpResponse, Error = actix_web::error::Error>> {
    let reqc = req.clone();
    req.json()
        .from_err() // convert all errors into `Error`
        .and_then(move |search: SearchObj| {
            println!(">>>val: {:?}", search);
            let token = reqc.headers()[actix_web::http::header::AUTHORIZATION].clone();
            println!(">>>token: {:?}", token);
            use std::fs;

            let j = fs::read_to_string("json/request_q.json").unwrap();
            Ok(HttpResponse::Ok()
                .content_type("application/json")
                .body(r#"{"one":"val1"}}"#)) // <- send response
        })
        .responder()
}
```

- [Cookie auth without cloning HttpRequest · Issue #522 · actix/actix-web](https://github.com/actix/actix-web/issues/522#issuecomment-424961930)
