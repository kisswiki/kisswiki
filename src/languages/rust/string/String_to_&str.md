You can also easily go from a String to a &str:

`&String` types turn into `&str` if the method call needs it

```rust
let my_str: &str = &my_string;
```

if you want to explicitly specify a `&str` type.

https://mgattozzi.github.io/2016/05/26/how-do-i-str-string.html