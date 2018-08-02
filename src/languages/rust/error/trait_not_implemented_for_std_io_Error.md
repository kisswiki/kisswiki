## rust trait not implemented for `std::io::Error`

I got this error specifically:

```
the trait `std::convert::From<fs_extra::error::Error>` is not implemented for `std::io::Error`
```

This gave me a clue:

  
>Error handling in Rust can be clumsy if you can't use the question-mark operator. To achieve happiness, we need to return a Result which can accept any error. All errors implement the trait std::error::Error, and so any error can convert into a Box<Error>. https://stevedonovan.github.io/rust-gentle-intro/6-error-handling.html


- https://stackoverflow.com/questions/29958807/how-to-implement-an-error-wrapper-for-all-existing-errors/30311605#30311605
  - https://blog.burntsushi.net/rust-error-handling/#the-real-try-macro-operator


The final code:

```rust
use std::path::Path;

extern crate fs_extra;
use fs_extra::*;

fn main() -> Result<(), Box<std::error::Error>> {
    let file_in = Path::new("./test_file.txt");
    let file_out = Path::new("./test_out.txt");
    file::write_all(&file_in, "content1")?;
    let options = file::CopyOptions::new();
    file::copy(&file_in, &file_out, &options)?;
    Ok(())
}
```

https://github.com/webdesus/fs_extra/issues/12#issuecomment-409920871
