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
>this is limitation of current way futures do things, you need to avoid tying it to lifetimes as handler requires 'static lifetime

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

## when using r.a you need to provide method

```rust
            .resource("/dataSets", |r| r.method(Method::GET).a(api::data_sets))
```

## When using &'static str in Path extractor, got function or associated item not found in actix_web::extractor::Path

```
118 |     let params = actix_web::Path::<DataSetParams>::extract(req).unwrap();
    |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ function or associated item not found in `actix_web::extractor::Path<api::DataSetParams>`
```

Needed to use `url: String` instead of `url: &static str`.


## expected signature of `for<'r> fn(&'r actix_web::httprequest::HttpRequest) -> _

```
177 | fn favicon(req: HttpRequest) -> actix_web::Result<actix_web::fs::NamedFile> {
    | --------------------------------------------------------------------------- found signature of `fn(actix_web::httprequest::HttpRequest) -> _`
...
192 |             .resource("/favicon", |r| r.f(favicon))
    |                                         ^ expected signature of `for<'r> fn(&'r actix_web::httprequest::HttpRequest) -> _`
```

Solution: change to `&HttpRequest`. I was using example from https://github.com/actix/examples/blob/250fc6eaf1054df15e3b6a168bb8731363fb6812/basics/src/main.rs#L24

which uses:

```toml
actix = "0.5"
actix-web = "^0.6"
```

## What does `map_err(|_| ())` is doing?

```rust
System::new("test").block_on(lazy(|| {
       actix_web::client::Client::new()
          .get("http://127.0.0.1:9696/echo/Joe") // <- Create request builder
          .header("User-Agent", "Actix-web")
          .send()                          // <- Send http request
          .map_err(|_| ())
          .and_then(|mut response| {
                    response.body().and_then( |body| {
                        println!("==== BODY ====");
                        println!("{:?}", body);
                        Ok(body)
                    }).map_err(|_| ())
                }).map_err(|_| ())
    }));
```

This is a result of tokio, which actix-web uses, forcing all futures to have error types of () to indicate that errors are handled. See the comments in this [tokio example code](https://tokio.rs/docs/getting-started/hello-world/#creating-the-stream).
