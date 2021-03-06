```rust
// if let Value::Array(val) = v {
//     println!("{}", val.len());
// }

// when reusing v
if let &Value::Array(ref val) = &v {
    println!("{}", val.len());
}

if v.is_array() {
    println!("{}", v.as_array().unwrap().len());
}
```

Your enum owns the strings that are passed in and so destructuring them will attempt to capture them by value (and move it out of the enum).

You can fix this by using ref p while destructuring to capture by reference.. stopping the move.

https://stackoverflow.com/questions/36490526/destructuring-while-iterating-through-a-vecenumstring

- https://doc.rust-lang.org/book/second-edition/ch18-03-pattern-syntax.html
- https://doc.rust-lang.org/book/second-edition/ch06-03-if-let.html
- non-reference pattern used to match a reference (see issue #42640) https://github.com/rust-lang/rust/issues/42640
- https://stackoverflow.com/questions/37267060/reference-to-parameters-within-an-enum
- https://stackoverflow.com/questions/9109872/access-enum-values-in-rust/33723601#33723601
- https://stackoverflow.com/questions/36590549/matching-on-a-reference-to-an-enum
- https://users.rust-lang.org/t/how-do-i-get-rid-of-this-pattern-of-extracting-a-value-from-an-enum/12555