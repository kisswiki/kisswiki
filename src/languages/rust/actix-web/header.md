```rust
let token = "asdfasdfasdf";
client::ClientRequest::get("https://calculations-s.gwidx.net/api/categories")
   .header("Authorization", "Bearer ".to_owned() + token)
// or
client::ClientRequest::get("https://calculations-s.gwidx.net/api/categories")
   .header(actix_web::http::header::AUTHORIZATION, "Bearer ".to_owned() + token)
```

- https://actix.rs/actix-web/actix_web/http/header/constant.AUTHORIZATION.html
- https://github.com/ryanmcgrath/jelly/blob/80ba54e4efe0e301494438717cb07888fb8eb924/src/emails/postmark/mod.rs#L74
