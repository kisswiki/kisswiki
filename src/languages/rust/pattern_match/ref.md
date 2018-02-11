- https://doc.rust-lang.org/book/second-edition/ch06-00-enums.html
- https://doc.rust-lang.org/book/second-edition/ch18-03-pattern-syntax.html

##

the ampersand operator is simply part of the pattern that we match against. And just like with `Some` and friends, there is an obvious symmetry here: if `&` was used to create the value, it needs to be used when unpacking it.

Unlike the ampersand, `ref` is not something we match against. It doesn’t affect what values match the pattern it’s in, and what values don’t.

The only thing it changes is how parts of the matched value are captured by the pattern’s bindings:

- by default, without `ref`, they are moved into the `match` arms
- with `ref`, they are borrowed instead and represented as references

Looking at our example, the `n` binding in `Some(n)` is of type `String`: the actual field type from the matched structure. By contrast, the other `n` in `Some(ref n)` is a `&String` — that is, a reference to the field.

One is a move, the other one is a borrow.

`ref` annotates pattern bindings to make them borrow rather than move. It is not a part of the pattern as far as matching is concerned.

### Used together

To finish off, let’s untangle the confusing example from the beginning of this post:

```rust
for &(ref name, ref value) in &query_params {
    println!("{}={}", name, value);
}
```

Since we know `ref` doesn’t affect whether or not the pattern matches, we could just as well have something like `&(a, b)`. And this should be quite a bit easier to read: it clearly denotes we expect a reference to a 2-tuple of simple objects. Not coincidentally, such tuples are items from the vector we’re iterating over.

Problem is, without the `ref`s we will attempt to move those items into the loop scope. But due to the way the vector is iterated over (`&query_params`), we’re only borrowing each item, so this is actually impossible. In fact, it would be a classic attempt to move out of a borrowed context.

It is also wholly unnecessary. The only thing this loop does is printing the items out, so accessing them through references is perfectly fine.

And this is exactly what the `ref` operator gives us. Adding the keyword back, we will switch from moving the values to just borrowing them instead.

### To sum up

- `&` denotes that your pattern expects a reference to an object. Hence `&` is a part of said pattern: `&Foo` matches different objects than `Foo` does.
- `ref` indicates that you want a reference to an unpacked value. It is not matched against: `Foo(ref foo)` matches the same objects as `Foo(foo)`.

http://xion.io/post/code/rust-patterns-ref.html

##

In fact, in Rust, match is designed to work quite well without taking ownership. In particular, the input to match is an L-value expression; this means that the input expression is evaluated to a memory location where the value lives. match works by doing this evaluation and then inspecting the data at that memory location.

(If the input expression is a variable name or a field/pointer dereference, then the L-value is just the location of that variable or field/memory. If the input expression is a function call or other operation that generates an unnamed temporary value, then it will be conceptually stored in a temporary area, and that is the memory location that match will inspect.)

https://blog.rust-lang.org/2015/04/17/Enums-match-mutation-and-moves.html

##

Rust is smart enough to see that your `_ =>` arm of the match statement does not actually borrow the value, so you can do

```rust
fn new<Str>(language: Str) -> Location
where
    Str: Into<String>,
{
    Location {
        language: {
            let s = language.into();
            match &*s {
                "canada" => "ca".to_owned(),
                "uk" => "uk2".to_owned(),
                _ => s,
            }
        },
    }
}

https://stackoverflow.com/questions/48494127/use-of-moved-value-when-matching-on-a-value-that-implements-intostring