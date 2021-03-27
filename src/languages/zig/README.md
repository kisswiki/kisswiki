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
