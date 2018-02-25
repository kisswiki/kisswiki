`str::to_string()` method is the canonical way of creating a `String` from an `&'static str` (a string literal).

Also note that since [Rust gained impl specialization](https://github.com/rust-lang/rfcs/pull/1210), `str::to_string` is no slower than `str::to_owned` or its ilk.

As of Rust 1.9, str::to_string, str::to_owned, String::from, str::into all have the same performance characteristics

- https://stackoverflow.com/questions/31331356/how-to-create-a-string-directly

- `.to_string()` if you want a simple conversion and show you’re making a `String`
- `.to_owned()` if you want a simple conversion and to show you’re taking ownership of it.
- `String::from()` a more explicit way to say what you’re doing
- `String::push_str()` if you need to append to a `String`
- `format!()` if you have predefined text that you wanted formatted in a specific way and don’t care about the speed cost
- `.into()` if you want a simple conversion and don’t care about the ambiguity of it

`.to_string()` or `String::from()` are good choices since they emphasize what they’re doing more so than `.to_owned()` or any of the other methods.

- https://mgattozzi.github.io/2016/05/26/how-do-i-str-string.html