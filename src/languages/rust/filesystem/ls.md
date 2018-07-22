```rust
let output = Command::new("ls")
	.arg("..")
	.output()
	.expect("'ls' command failed to start");

println!("status: {}", output.status);
println!("stdout: {}", String::from_utf8_lossy(&output.stdout));
println!("stderr: {}", String::from_utf8_lossy(&output.stderr));
```

## fs_extra

```rust
extern crate fs_extra;

use fs_extra::dir::{ls, DirEntryAttr, DirEntryValue};
use std::collections::HashSet;

fn to_string_dir_entry_attr(key: &DirEntryAttr) -> &'static str {
    match key {
        DirEntryAttr::Name => "Name",
        DirEntryAttr::Ext => "Ext",
        DirEntryAttr::FullName => "FullName",
        DirEntryAttr::Path => "Path",
        DirEntryAttr::DosPath => "DosPath",
        DirEntryAttr::FileSize => "FileSize",
        DirEntryAttr::Size => "Size",
        DirEntryAttr::IsDir => "IsDir",
        DirEntryAttr::IsFile => "IsFile",
        DirEntryAttr::Modified => "Modified",
        DirEntryAttr::Accessed => "Accessed",
        DirEntryAttr::Created => "Created",
        DirEntryAttr::BaseInfo => "BaseInfo",
    }
}

fn to_string_dir_entry_value(key: &DirEntryValue) -> String {
    match key {
        DirEntryValue::String(v) => format!("{}", v),
        DirEntryValue::Boolean(v) => format!("{}", v),
        DirEntryValue::SystemTime(v) => format!("{:?}", v),
        DirEntryValue::U64(v) => format!("{}", v),
    }
}

fn main() -> std::io::Result<()> {
    let mut config = HashSet::new();
    config.insert(DirEntryAttr::FullName);
    config.insert(DirEntryAttr::Size);
    config.insert(DirEntryAttr::BaseInfo);

    let result = ls(".", &config);

    let result_u = &result.unwrap();
    for (key, value) in &result_u.base {
        println!(
            "{}: \"{}",
            to_string_dir_entry_attr(key),
            to_string_dir_entry_value(value)
        );
    }

    for item in &result_u.items {
        println!("row");
        for (key, value) in item {
            println!(
                "{}: \"{}",
                to_string_dir_entry_attr(key),
                to_string_dir_entry_value(value)
            );
        }
    }

    Ok(())
}
```

https://github.com/webdesus/fs_extra
