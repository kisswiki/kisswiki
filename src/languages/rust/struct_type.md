You're probably familiar with how one instantiates a struct that has fields:

```rust
struct Foo {
    a: i32
}
let f = Foo {a: 1};
```

Consider what happens when you define a struct that has no fields:

```rust
struct Foo;
let f = Foo;
```

If you choose to explicitly annotate the type there, that would turn into:

```rust
let f: Foo = Foo;
```

And items in the global scope aren't allowed to have their types inferred, so that's how you get there.

There's actually an interesting history here: Ancient (pre-1.0) Rust allowed both Foo{} and Foo for instantiating empty structs, but because of parser ambiguities the Foo{} form was removed for some years. Eventually the parser ambiguity was resolved, and in the eleventh hour before 1.0 an RFC (https://github.com/nox/rust-rfcs/blob/master/text/0218-empty-struct-with-braces.md#ancient-history) was accepted to make Foo{} legal again, in order to make things easier on macro authors (who otherwise would have needed to special-case their treatment of zero-field structs (this is also why we allow otherwise-useless one-element tuples)), and to minimize annoyance on people who are rapidly prototyping and may be wantonly removing or adding fields from structs ("prototyping" being the key word there; idiomatic Rust still prefers Foo).


https://www.reddit.com/r/rust/comments/940ewr/announcing_rust_128/e3ha6yj/

## initialize

Empty

```rust
struct Data;

let d = Data{};
```

Default

```rust
#[derive(Debug, Default)] // Derive is cool, I have no idea how it works!
struct Point {
    x: i32,
    y: i32,
    z: i32,
}

fn main() {
  let p1 = Point::default();
  let p2 = Point{ x: 34, ..Default::default() };
}
```

https://gist.github.com/ChrisWellsWood/84421854794037e760808d5d97d21421
