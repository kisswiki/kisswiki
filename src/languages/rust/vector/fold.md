```rust
fn main() {
    let z = (2..12).fold(vec![1u64, 1], |mut data, _| {
        let next = data[data.len()-2] + data[data.len()-1];
        data.push(next);
        data
    });
    println!("{:?}", z.last())
}
```

https://stackoverflow.com/questions/27760022/is-it-possible-to-use-a-fold-with-a-vec
