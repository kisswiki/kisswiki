- https://serde.rs/
- http://stackoverflow.com/documentation/rust/1170/serde
- http://siciarz.net/24-days-rust-serde/

## 

you should add some disclaimers to the zero-copy paragraphs that this can lead to loss of functionality: with JSON, and probably all non-binary formats, not all strings are decodable anymore.
For example, you cannot deserialize the shown User struct from {"fingerprint": "0x...", "location": "Menlo Park\nCA"}.
This is somewhat obvious for the more experienced Rust users, but I daresay not everyone who sees serde the first time. The inevitable "use Cow" advice will also need a caveat that it requires explicit #[serde(borrow)] annotation to have any effect.

https://www.reddit.com/r/rust/comments/66ijih/announcing_serde_100_zerocopy_deserialization_and/dgj2914/

## How can I add serde rename for whole file, for every struct which has serialize/deserialize?

13:20	oli_obk_	rofrol: you can't. The rename is parsed as part of the `derive(Serialize)`
13:20	oli_obk_	so it needs to be within the enum/struct
