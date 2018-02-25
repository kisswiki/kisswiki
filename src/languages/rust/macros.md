- Show expaned macro https://github.com/dtolnay/cargo-expand

## What does rocket.rs use that makes it different from serde as far as custom derivations go?

Custom derive:

`#[derive(Serialize)]` <- you can write anything inside the ()s

Full on procedural macros, attribute style:

`#[get("/hello/<name>/<age>")]` <- you can write anything inside the

https://news.ycombinator.com/item?id=13378592
