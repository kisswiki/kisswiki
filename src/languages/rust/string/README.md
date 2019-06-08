> String owns its contents, while &str is only borrowing them.
If you are dynamically creating a string and returning it, you generally need to use a String. If you are returning a slice of some previously-existing string, you may be able to return &str.
&str does not own any storage; it's just a view into some other data, usually a static string literal or some String variable.
> -- https://www.reddit.com/r/rust/comments/2y2bd6/convention_for_returning_strings_str_or_string/

## String to &str

```rust
let name = "Herman".to_string();
let person = Person::new(name.as_ref());
```

http://hermanradtke.com/2015/05/06/creating-a-rust-function-that-accepts-string-or-str.html

##

http://stackoverflow.com/questions/26536871/convert-a-string-of-numbers-to-an-array-vector-of-ints-in-rust

## trim left

``` rust
let s = "~~~~sqeeze me";
let result = s.trim_left_matches('~');
-- Result : “sqeeze me”
```

http://wdv4758h.github.io/string.rs/strip-trim
