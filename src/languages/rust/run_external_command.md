```rust
let cmd = Command::new("ls")
        .current_dir(&Path::new("../client"))
        .arg("-l")
        .arg("-a")
        .output()
        .expect("ls command failed to start");
let out = cmd.output

let s = String::from_utf8_lossy(&*out);
```

- http://stackoverflow.com/questions/21011330/in-rust-how-do-i-invoke-a-system-command-and-capture-its-output
- http://stackoverflow.com/questions/19076719/how-do-i-convert-a-vector-of-bytes-u8-to-a-string/34709020#34709020
- https://github.com/rust-lang/rust-by-example/blob/master/src/file.rs
- https://hoverbear.org/2014/09/07/command-execution-in-rust/
