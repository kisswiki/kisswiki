```rust
let f = File::create("plik").expect("Unable to create file");
let mut f = BufWriter::new(f);
f.write_all(&*upload.file).expect("Unable to write data");
```

- http://stackoverflow.com/questions/31192956/whats-the-de-facto-way-of-reading-and-writing-files-in-rust-1-x
- http://stackoverflow.com/questions/27390892/rust-convert-image-to-bytes-and-then-write-to-new-file
- https://doc.rust-lang.org/std/io/trait.Write.html#method.write_all
- https://doc.rust-lang.org/std/io/struct.BufWriter.html
- https://doc.rust-lang.org/std/vec/struct.Vec.html
- https://www.reddit.com/r/rust/comments/4ml1fw/want_to_use_stdioreadwrite_for_my_vecu8/
