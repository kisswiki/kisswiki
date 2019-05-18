## tuple

```rust
match (tup.0.as_slice(), tup.1.as_slice()) {
    ("foo", "bar") => print!("foobar"),
    _ => print!("Unknown"),
}
```

- https://stackoverflow.com/questions/27078250/match-string-tuple-in-rust
