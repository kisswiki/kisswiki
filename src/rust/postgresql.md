>`std::marker::Sized` is not implemented for `postgres::types::ToSql`

add type annotation:

```rust
var data_type_id: i32 = row.get(0);
```

## Float

for `f32` use `real`

https://github.com/sfackler/rust-postgres
