## One by one

```rust
use std::fmt;

enum Suit {
    Heart,
    Diamond,
    Spade,
    Club
}

impl fmt::Display for Suit {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
       match *self {
           Suit::Heart => write!(f, "♥"),
           Suit::Diamond => write!(f, "♦"),
           Suit::Spade => write!(f, "♠"),
           Suit::Club => write!(f, "♣"),
       }
    }
}

fn main() {
    let s = Suit::Heart;
    println!("{}", s);
}
```
 
https://stackoverflow.com/questions/28024373/is-there-a-way-to-print-enum-values
