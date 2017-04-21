## 

you should add some disclaimers to the zero-copy paragraphs that this can lead to loss of functionality: with JSON, and probably all non-binary formats, not all strings are decodable anymore.
For example, you cannot deserialize the shown User struct from {"fingerprint": "0x...", "location": "Menlo Park\nCA"}.
This is somewhat obvious for the more experienced Rust users, but I daresay not everyone who sees serde the first time. The inevitable "use Cow" advice will also need a caveat that it requires explicit #[serde(borrow)] annotation to have any effect.

https://www.reddit.com/r/rust/comments/66ijih/announcing_serde_100_zerocopy_deserialization_and/dgj2914/?utm_content=permalink&utm_medium=front&utm_source=reddit&utm_name=rust
