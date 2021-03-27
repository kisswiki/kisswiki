- [Why I rewrote my Rust keyboard firmware in Zig: consistency, mastery, and fun](https://kevinlynagh.com/rust-zig/)
  - https://news.ycombinator.com/item?id=26374268

top-level consts are order-independent

const

try - if statement can fail

function can return error or value or nothing

!void - returns anyerror or void

void - returns nothing

```zig
pub fn main() !void {
// this is
// multiline comment

const multiline_string_literal =
// this is
// multiline string literal
}
}
```

## autorun

```bash
cargo install watchexec
watchexec -w src/main.zig -r 'zig build-exe src/main.zig && main'
```
