main.rs:

```rust
mod hello;

fn main() {
    hello::print_hello();
}
```

hello.rs:

```rust
pub fn print_hello() {
    println!("Hello, world!");
}
```

https://stackoverflow.com/questions/26388861/how-to-include-module-from-another-file-from-the-same-project