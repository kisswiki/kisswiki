> Unlike let, you must declare the types of function arguments. This does not work:

```rust
fn print_sum(x, y) {
    println!("sum is: {}", x + y);
}
```

> Rust functions return exactly one value, and you declare the type after an ‘arrow’, which is a dash (-) followed by a greater-than sign (>)

```rust

```

> Expressions return a value, and statements do not.

```rust
let mut y = 5;
let x = (y = 6); // x == ()
```
