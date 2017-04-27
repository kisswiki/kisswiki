- http://stackoverflow.com/questions/26643688/how-to-split-a-string-in-rust

## Remove duplicates

```rust
use std::collections::BTreeSet;
let tags = "one two three".split_whitespace().collect::<BTreeSet<_>>();
```
