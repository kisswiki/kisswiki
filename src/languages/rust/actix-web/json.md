## Read json file from disk and return it as json response?

```rust
fn campaigns(req: &HttpRequest) -> Box<Future<Item = HttpResponse, Error = Error>> {
    use std::fs;
    let j = fs::read_to_string("campaign_response.json").unwrap();

    let params = Path::<Campaign>::extract(req).unwrap();
    result(Ok(HttpResponse::Ok()
        .content_type("application/json")
        .body(j))).responder()
}
```

Set content-type manually, and return vec or String as body.

https://gitter.im/actix/actix?at=5be5b864bb06d73a994a9cb9
