- https://www.rosettacode.org/wiki/Read_entire_file#Rust
- https://stackoverflow.com/questions/31192956/whats-the-de-facto-way-of-reading-and-writing-files-in-rust-1-x
- https://doc.rust-lang.org/rust-by-example/std_misc/file.html
- https://doc.rust-lang.org/rust-by-example/std_misc/fs.html
- Read::read_to_string is the shortest https://stackoverflow.com/questions/27474923/cleaner-way-to-get-the-contents-of-a-file-as-string-in-rust

## in a thread poool

I'd recommend using futures-fs to do the file reading in a thread pool. This prevents disk access from blocking the event loop.

https://www.reddit.com/r/rust/comments/71af0h/streaming_body_in_hyper/