## tuple

```rust
match (tup.0.as_slice(), tup.1.as_slice()) {
    ("foo", "bar") => print!("foobar"),
    _ => print!("Unknown"),
}
```

- https://stackoverflow.com/questions/27078250/match-string-tuple-in-rust

```rust
let window = match opt_windowrecv {
    Some((window, _)) => window,
    None            => return
};
```

- https://stackoverflow.com/questions/24943914/how-to-match-for-an-option-with-multiple-fields

```rust
    // Checks if a token and mode is in the query string of the request
    match (&hub.mode, &hub.token) {
        (Some(mode), Some(token)) => {
            // Checks the mode and token sent is correct
            if mode == "subscribe" && token == verify_token {
                // Responds with the challenge token from the request
                println!("WEBHOOK_VERIFIED");
                HttpResponse::Ok()
                    .content_type("text/html")
                    .body(hub.challenge.clone())
            } else {
                // Responds with '403 Forbidden' if verify tokens do not match
                HttpResponse::Forbidden().finish()
            }
        }
        // Responds with '403 Forbidden' if verify tokens do not match
        _ => HttpResponse::Forbidden().finish(),
    }
```

- https://github.com/rofrol/rust-shopping-bot
