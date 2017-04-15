```rust
let f = File::create("plik").expect("Unable to create file");
let mut f = BufWriter::new(f);
f.write_all(&*upload.file).expect("Unable to write data");
```

- http://stackoverflow.com/questions/31192956/whats-the-de-facto-way-of-reading-and-writing-files-in-rust-1-x
- http://stackoverflow.com/questions/27390892/rust-convert-image-to-bytes-and-then-write-to-new-file
