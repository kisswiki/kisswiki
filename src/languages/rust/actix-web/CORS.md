Allow all

```rust
    Cors::for_app(app)
        .send_wildcard()
        .register()
```

Allow specific origin
	
- https://github.com/actix/examples/tree/master/web-cors
- https://github.com/actix/actix-web/issues/117
- https://actix.rs/actix-web/actix_web/middleware/cors/struct.CorsBuilder.html#method.send_wildcard
