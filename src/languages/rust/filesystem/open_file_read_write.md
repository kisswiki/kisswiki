```rust
use std::fs::OpenOptions;

let mut file = OpenOptions::new()
    .read(true)
    .write(true)
    .open("foo.txt");
```

you may also want to add `.create(true)`.

- https://stackoverflow.com/questions/50039341/open-file-in-read-write-mode-in-rust
- https://stackoverflow.com/questions/47956653/is-it-possible-to-use-the-same-file-for-reading-and-writing
