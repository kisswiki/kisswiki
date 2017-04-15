- minimum rustc version https://github.com/SergioBenitez/Rocket/pull/256
- If you install rocket 0.2, use examples from https://github.com/SergioBenitez/Rocket/blob/v0.2/examples

## Multipart form

Rocket currently doesn't provide built-in support for multipart forms

You should be able to adapt the https://github.com/abonander/multipart pretty easily here. I can't vouch for it, however, as I haven't tried it myself.

- https://github.com/SergioBenitez/Rocket/issues/106
- http://stackoverflow.com/questions/43424982/how-to-use-rocket-and-abonander-multipart-in-rust-language
- https://www.reddit.com/r/rust/comments/65ikab/help_with_rocket_abonandermultipart/

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
