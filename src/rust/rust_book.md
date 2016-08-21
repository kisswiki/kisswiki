## Functions

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

Return:

```rust
fun sum(x: i32, y: i32) -> i32 {
  x + y
}
```

or

```rust
fun sum(x: i32, y: i32) -> i32 {
  return x + y;
}
```

Backtrace:

```
$ RUST_BACKTRACE=1 cargo run
```

function pointers:

```rust
let f = sum;
```

## Primitive types

```rust
let x = 42; // type i32
let y = 0.1 // type f64
```
