>`std::marker::Sized` is not implemented for `postgres::types::ToSql`

add type annotation:

```rust
var data_type_id: i32 = row.get(0);
```
