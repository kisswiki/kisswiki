```rust
extern crate rand;
use rand::Rng;
fn main(){
    let num = rand::thread_rng().gen_range(0, 100); // generate number between 0 and 99
    println!("{}", num);
}
```

- https://stackoverflow.com/questions/19671845/how-can-i-generate-a-random-number-within-a-range-in-rust/39233655#39233655
- https://stackoverflow.com/questions/52454677/how-to-generate-a-random-rust-integer-in-a-range-without-introducing-bias/52456488#52456488
