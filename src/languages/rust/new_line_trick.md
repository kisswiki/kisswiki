```rust
fn main() {
	let world = gives_string().split(" ").next();

	println!("{:?}", world);
}

fn gives_string() -> String {
	String::from("hello world")
}
```

This will fail because the String is temporary, and we're trying to get a reference to it (via split), and so it would be deallocated at the end of the line, being a use-after-free. This, however, compiles:

```rust
fn main() {
    let world = gives_string();
    let world = world.split(" ").next();

    println!("{:?}", world);
}

fn gives_string() -> String {
    String::from("hello world")
}
```

We're shadowing 'world', but the underlying String now lives to the end of main, so everything works, no more use-after free.

I think before I'd want a good real-world example of where doing the multi-line thing goes wrong before I'd want to make an argument that this is why postfix is better.

https://news.ycombinator.com/item?id=20032931
