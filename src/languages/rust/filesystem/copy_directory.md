Use https://crates.io/crates/fs_extra

```rust
extern crate fs_extra;
use fs_extra::dir::copy;
use fs_extra::dir::CopyOptions;

let src = "templates/hello_world/src";
let dst = "quick3";
copy(&src, &dst, &options);
```

https://stackoverflow.com/questions/26958489/how-to-copy-a-folder-recursively-in-rust/42144177#42144177

## Reading Directories chapter

Jim Blandy, Jason Orendorff - Programming Rust - Fast, Safe Systems Development - O'Reilly Media (2017)


```rust
use std::fs;
use std::io;
use std::path::Path;


/// Copy the existing directory `src` to the target path `dst`.
fn copy_dir_to(src: &Path, dst: &Path) -> io::Result<()> {
    if !dst.is_dir() {
        fs::create_dir(dst)?;
    }
    for entry_result in src.read_dir()? {
        let entry = entry_result?;
        let file_type = entry.file_type()?;
        copy_to(&entry.path(), &file_type, &dst.join(entry.file_name()))?;
    }
    Ok(())
}

/// Copy whatever is at `src` to the target path `dst`.
fn copy_to(src: &Path, src_type: &fs::FileType, dst: &Path) -> io::Result<()> {
    if src_type.is_file() {
        fs::copy(src, dst)?;
    } else if src_type.is_dir() {
        copy_dir_to(src, dst)?;
    } else {
        return Err(io::Error::new(
            io::ErrorKind::Other,
            format!("don't know how to copy: {}", src.display()),
        ));
    }
    Ok(())
}
```
