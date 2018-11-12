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
