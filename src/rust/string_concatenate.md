
- https://github.com/hoodie/concatenation_benchmarks-rs
  - https://www.reddit.com/r/rust/comments/48fmta/seven_ways_to_concatenate_strings_in_rust_the/
- https://www.rosettacode.org/wiki/String_concatenation#Rust

## Concatenate &str

```rust
let first_name = "Herman";
let last_name = first_name.to_owned() + " Gonzalez";
```

## we have:

```
&str
String
&String
Cow<'a, str>
Chars<'a>
Bytes<'a>
impl Iterator<Item = char>
impl Iterator<Item = u8>
Vec<char>
&[char]
Vec<u8>
&[u8]
```

https://www.reddit.com/r/rust/comments/67x46l/announcing_rust_117/dgu7stw/


The new edition of the book uses String/&str to teach ownership and borrowing, and goes into these kinds of things in-depth: https://doc.rust-lang.org/beta/book/second-edition/ch04-00-understanding-ownership.html

## join

The nicest I have seen is using the join method on an array:

```rust
fn main() {
    let a = "Hello";
    let b = "world";
    let result = [a, b].join("\n");

    print!("{}", result);
}
```

http://stackoverflow.com/questions/30154541/how-do-i-concatenate-strings/41688369#41688369

## concat

`[a, b].concat()` is stable, and it generalizes to multiple strings: `[a, b, c, d].concat()`.

It also has the advantage over `format!()` that concat computes the exact size needed beforehand, so it allocates an exact sized string and does copying very efficiently.

The only problem is the type inference issue. You may have to force the operands to be &str.

concat is to `format!()` what String::from is to `.to_string()`, in a way :)

See also concat's sibling `.join(separator: &str)`.

https://users.rust-lang.org/t/what-is-right-ways-to-concat-strings/3780/14
