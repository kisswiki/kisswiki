- minimum rustc version https://github.com/SergioBenitez/Rocket/pull/256
- If you install rocket 0.2, use examples from https://github.com/SergioBenitez/Rocket/blob/v0.2/examples
- https://matthias-endler.de/2017/rust-url-shortener/
- http://neikos.me/Using_Stainless_with_Rocket.html
- https://www.todobackend.com/

## Multipart form

Rocket currently doesn't provide built-in support for multipart forms

You should be able to adapt the https://github.com/abonander/multipart pretty easily here. I can't vouch for it, however, as I haven't tried it myself.

- https://github.com/SergioBenitez/Rocket/issues/106
- http://stackoverflow.com/questions/43424982/how-to-use-rocket-and-abonander-multipart-in-rust-language
- https://www.reddit.com/r/rust/comments/65ikab/help_with_rocket_abonandermultipart/
- https://github.com/abonander/multipart/issues/57
- https://github.com/abonander/multipart/issues/59

## RawStr

- https://rocket.rs/news/2017-02-06-version-0.2/#whats-next
- https://github.com/SergioBenitez/Rocket/issues/43

## Form

Match any `enctype == "text/plain"`

```rust
#[post("/upload", format = "text/plain", data = "<data>")]
fn upload(data: Data) -> io::Result<Plain<String>> {
    data.stream_to_file("upload.txt")
        .map(|n| Plain(n.to_string()))
}
```

Match any `enctype`

```rust
#[post("/upload2", data = "<data>")]
fn upload2(data: Data) -> io::Result<Plain<String>> {
    data.stream_to_file("upload.txt")
        .map(|n| Plain(n.to_string()))
}
```

## Static file serving

- https://github.com/SergioBenitez/Rocket/tree/master/examples/static_files
- https://github.com/SergioBenitez/Rocket/tree/v0.2/examples/static_files
- https://github.com/SergioBenitez/Rocket/issues/239
- Missing documentation for a static https://github.com/SergioBenitez/Rocket/issues/258


## Every 6th and 7th request takes around 6 sec - sync issues

Increase number of workers in Rocket.toml:

```toml
[global]
workers = 64
```

https://rocket.rs/guide/overview/#configuration

## Error: expected &str, found enum `std::option::Option`

Don't use names `__v`, `__k`, `__e` for struct field names.

https://github.com/SergioBenitez/Rocket/issues/265

## Handlebars no_escape

`{{{ content }}}`

https://github.com/SergioBenitez/Rocket/issues/51#issuecomment-269108429

## CORS

No easy way at the moment.
You need to wrap each response individually.

- https://github.com/SergioBenitez/Rocket/issues/25#issuecomment-271065434

## How can I have different error for /* and for /api/*

A: you should just return a Result<T, E>

Q: For clients accesing /api I would like to return error with json

You can return Result<T, JSON<E>>

Or what have you.

You can return a custom status code and catch that

Result<Option, E>

## Codegen

`ROCKET_CODEGEN_DEBUG=1 cargo build`

https://api.rocket.rs/rocket_codegen/index.html

## Deploy/Hosting

Documentation on deploying Rocket 🚀 to Heroku (and other similar ☁️ environments) https://github.com/SergioBenitez/Rocket/issues/171

## Websockets and philosophy

18:22	lakin	There are more than just technical roadblocks though. Websockets don't have anything like HTTP for parameters or paths, etc. It's just string messages in, string messages out. In order to get what I want with type-safe dispatch to defined methods - I'll have to add that on top of websockets.
18:22	lakin	Not sure that Rocket wants to make decisions like that for the user.
18:23	Sergio	We don't make many decisions at all. We use provide a framework for decisions. 
18:23	Sergio	For instance, we don't know what data the HTTP body will contain. 
18:23	Sergio	So we provide a trait to parse and validate it, and some common implementations of that trait. We could trivially do the same for websockets. 

## multi-valued select elements

https://github.com/SergioBenitez/Rocket/issues/205
