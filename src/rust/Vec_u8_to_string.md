```rust
let buf = &[0x41u8, 0x41u8, 0x42u8];
let s = String::from_utf8_lossy(buf);
```

http://stackoverflow.com/questions/19076719/how-do-i-convert-a-vector-of-bytes-u8-to-a-string/34709020#34709020


ote that a Vec<T> is more-or-less an owned, resizable wrapper around a [T]. That is, if you have a Vec<u8>, you can turn it into a &[u8], most easily by re-borrowing it (i.e. &*some_vec). You can also call any methods defined on &[T] directly on a Vec<T> (in general, this is true of things that implement the Deref trait).

http://stackoverflow.com/questions/28123923/how-do-i-print-a-vector-of-u8-as-a-string/28124260#28124260

Sometimes you may need to use the into_owned() method since it's clone on write.

http://stackoverflow.com/a/34709020/588759
