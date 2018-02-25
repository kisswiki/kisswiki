`str::to_string()` method is the canonical way of creating a `String` from an `&'static str` (a string literal).

Also note that since [Rust gained impl specialization](https://github.com/rust-lang/rfcs/pull/1210), `str::to_string` is no slower than `str::to_owned` or its ilk.

As of Rust 1.9, str::to_string, str::to_owned, String::from, str::into all have the same performance characteristics

- https://stackoverflow.com/questions/31331356/how-to-create-a-string-directly

- `to_string()`
- `to_owned()`
- `String::from()`
- `String::push_str()`
- `format!()`
- `into()`

`.to_string()` or `String::from()` are good choices since they emphasize what they’re doing more so than `.to_owned()` or any of the other methods.

- https://mgattozzi.github.io/2016/05/26/how-do-i-str-string.html