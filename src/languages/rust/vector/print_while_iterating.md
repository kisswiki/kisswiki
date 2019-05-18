```rust
#![allow(unused)]
#![allow(dead_code)]
fn main() {
    let a = vec![1, 2, 3];
    let b = a.iter().map(|x| {println!("{}", *x); *x});
    let a: Vec<i32> = b.collect();
}
```

- https://play.rust-lang.org/?gist=a3607c1819fd0531c69897dbb5967878&version=stable&mode=debug&edition=2015
- https://users.rust-lang.org/t/closure-in-map-printing-a-vector/21109
