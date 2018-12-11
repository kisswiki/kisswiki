How to create handlers / and /* for Single Page Appliction?

So when I have a /settings route in my frontend application, and refresh will keep /settings in address bar but load index.html?

Akos Vandra @axos88 22:42
I have this

```rust
         .default_resource(|r| {
            r.method(Method::GET).f( |req| routes::assets("../frontend/dist/rust-angular", env::var_os("PASSTHROUGH").is_some()).serve(req, "index.html"));
            r.route().filter(pred::Not(pred::Get())).with( routes::error_404);
        }));
```

replace `routes::assets(...)` with whatever you serve your `index.html`

I have used this eventually:

main.rs

```rust
            .default_resource(|r| {
                r.method(Method::GET).f(files::index);
                r.route()
                    .filter(pred::Not(pred::Get()))
                    .f(|_req| HttpResponse::MethodNotAllowed());
            })
```

files.rs

```rust
pub fn index(_req: &HttpRequest) -> actix_web::Result<fs::NamedFile> {
    Ok(fs::NamedFile::open("../client/dist/index.html")?)
}
```

- https://actix.rs/docs/url-dispatch/
- https://actix.rs/actix-web/actix_web/struct.Scope.html#method.default_resource
