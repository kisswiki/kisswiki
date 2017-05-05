```rust
#[post("/share/<block_id>", data = "<users_share>")]
fn share_block(block_id: i32, users_share: JSON<UsersShare>) -> Accepted<()> {
    Accepted::<()>(None)
}
```

- https://github.com/SergioBenitez/Rocket/issues/99
- https://rocket.rs/guide/responses/
- https://api.rocket.rs/rocket/response/status/struct.Accepted.html
