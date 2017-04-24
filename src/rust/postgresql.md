>`std::marker::Sized` is not implemented for `postgres::types::ToSql`

add type annotation:

```rust
var data_type_id: i32 = row.get(0);
```

## Float

for `f32` use `real`

https://github.com/sfackler/rust-postgres

## Concatenate column

`u.first_name || ' ' || u.last_name`

- http://stackoverflow.com/questions/19942824/how-to-concatenate-columns-in-a-postgres-select
- http://stackoverflow.com/questions/43870/how-to-concatenate-strings-of-a-string-field-in-a-postgresql-group-by-query

## describe

- table `\d+ tablename`

## order by limit slow

http://stackoverflow.com/questions/6037843/extremely-slow-postgresql-query-with-order-and-limit-clauses

## count

http://stackoverflow.com/questions/4535782/select-count-of-rows-in-another-table-in-a-postgres-select-statement
