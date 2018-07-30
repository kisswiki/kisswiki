- https://serde.rs/
- http://stackoverflow.com/documentation/rust/1170/serde
- http://siciarz.net/24-days-rust-serde/

## 

you should add some disclaimers to the zero-copy paragraphs that this can lead to loss of functionality: with JSON, and probably all non-binary formats, not all strings are decodable anymore.
For example, you cannot deserialize the shown User struct from {"fingerprint": "0x...", "location": "Menlo Park\nCA"}.
This is somewhat obvious for the more experienced Rust users, but I daresay not everyone who sees serde the first time. The inevitable "use Cow" advice will also need a caveat that it requires explicit #[serde(borrow)] annotation to have any effect.

https://www.reddit.com/r/rust/comments/66ijih/announcing_serde_100_zerocopy_deserialization_and/dgj2914/

## rename

- https://serde.rs/attr-rename.html
- https://serde.rs/container-attrs.html

## How can I add serde rename for whole file, for every struct which has serialize/deserialize?

13:20	oli_obk_	rofrol: you can't. The rename is parsed as part of the `derive(Serialize)`
13:20	oli_obk_	so it needs to be within the enum/struct

## decode json

```rust
serde_json::from_str(data)?;
```

https://github.com/serde-rs/json

## cons

- Opaque Error Type https://github.com/serde-rs/json/issues/285

>If the test were written as Error::InvalidValue { unexpected: Float(f64::NAN), expected: "NaN" } it certainly would've. And named arguments would've prevented the mistake in the first place I suppose! As I've expressed previously, I'm just not much of a fan of serde's approach to errors, how they generally just devolve into Message(String). https://github.com/reem/rust-ordered-float/pull/21/files#r110762253
