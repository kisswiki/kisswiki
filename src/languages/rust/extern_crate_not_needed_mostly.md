- https://doc.rust-lang.org/nightly/edition-guide/rust-2018/module-system/path-clarity.html

## proc_macro macro_use

In the 2018 edition, procedural macros are items like anything else, so you must bring them into scope:

```rust
use serde::{Serialize, Deserialize};
```

- https://stackoverflow.com/questions/56496851/edition-2018-use-or-not-use-extern-crate-name/56496895#56496895
- https://stackoverflow.com/questions/49113368/how-do-i-fix-cannot-find-derive-macro-in-this-scope/49113656#49113656
