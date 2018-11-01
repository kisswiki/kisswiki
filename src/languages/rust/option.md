## Converting Option to Result

- https://www.reddit.com/r/rust/comments/9kqifi/best_practice_unwrapping_an_option/
- https://stackoverflow.com/questions/37890405/is-there-a-way-to-simplify-converting-an-option-into-a-result-without-a-macro

## ok_or vs ok_or_else

```diff
- .ok_or(Error::new(ErrorKind::Other, "Decode error"));
+ .ok_or_else(|| Error::new(ErrorKind::Other, "Decode error"));
```

With `ok_or_else` (and the same goes for other `*_or_else` functions), because the closure is not evaluated if the variant is `Some`.

https://stackoverflow.com/questions/45547293/why-should-i-prefer-optionok-or-else-instead-of-optionok-or

`foo.unwrap_or(String::new())`

this can instead be written:

`foo.unwrap_or_else(String::new)`

https://github.com/rust-lang-nursery/rust-clippy/wiki#or_fun_call

- https://doc.rust-lang.org/std/option/enum.Option.html#method.ok_or
- https://doc.rust-lang.org/std/option/enum.Option.html#method.ok_or_else
