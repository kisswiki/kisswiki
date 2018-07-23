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

## append(false) on Windows

`.write(true).append(false)` does not seem to work on Windows. User

```rust
    file.set_len(0)?;
    file.write_all(out.as_bytes())?;
```

- https://www.reddit.com/r/rust/comments/912h4l/stdfsopenoptionsnewwritetrueappendfalse_does_not/
- https://github.com/nox/rust-rfcs/blob/master/text/1252-open-options.md#append-mode
