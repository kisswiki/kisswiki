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

## Links

- https://serde.rs/impl-deserialize.html
- https://serde.rs/deserialize-struct.html
- https://stackoverflow.com/questions/47405416/deserializing-key-and-value-lists-as-struct-from-json-using-serde
- function signature https://github.com/serde-rs/serde/issues/1157#issuecomment-364417718
- https://stackoverflow.com/questions/41151080/deserialize-a-json-string-or-array-of-strings-into-a-vec
- visitor example: str or map https://github.com/serde-rs/serde/issues/515#issuecomment-241564537
- https://docs.rs/serde-aux/0.3.0/serde_aux/fn.deserialize_number_from_string.html
- example with T https://www.reddit.com/r/rust/comments/6zem95/hey_rustaceans_got_an_easy_question_ask_here/dmy86r3/
- https://noyez.gitlab.io/post/2018-08-28-serilize-this-or-that-into-u64/
- enum https://stackoverflow.com/questions/44331037/how-can-i-distinguish-between-a-deserialized-field-that-is-missing-and-one-that
- one of the fields is a stringified json https://users.rust-lang.org/t/need-help-with-serde-deserialize-with/18374
- using Cow https://www.reddit.com/r/rust/comments/8uio88/why_exactly_wont_serde_derive_this_enum/
- tag https://stackoverflow.com/questions/53018165/can-serde-deserialize-json-to-one-of-a-set-of-types-depending-on-the-value-of-a
- https://stackoverflow.com/questions/52733047/how-to-borrow-a-field-for-serialization-but-create-it-during-deserialization
- null: Option or deserialize_with https://stackoverflow.com/questions/44205435/how-to-deserialize-a-json-file-which-contains-null-values-using-serde
- string into number https://stackoverflow.com/questions/44836327/is-there-is-a-simpler-way-to-convert-a-type-upon-deserialization
- `Implement serde::Deserialize` for your own type to allow reusing it https://stackoverflow.com/questions/46753955/how-to-transform-fields-during-deserialization-using-serde
- https://github.com/cmsd2/serde-deserialize-with-example/blob/master/src/lib.rs
- https://users.rust-lang.org/t/deserializing-enum-json-field-with-serde-with-multiple-types/5424/2
- check if field is a string https://stackoverflow.com/questions/33323891/conditionally-decoding-json-based-on-a-field-in-the-json
- implement Serialize and Deserialize for the type to practice https://www.reddit.com/r/rust/comments/7yzn25/trying_to_implement_serialize_deserialize_with/
- tag and content example https://stackoverflow.com/questions/48641541/deserializing-toml-into-vector-of-enum-with-values
- untagged or by hand https://stackoverflow.com/questions/37561593/how-can-i-use-serde-with-a-json-array-with-different-objects-for-successes-and-e
- streaming parser https://www.reddit.com/r/rust/comments/83a7iv/memoryefficient_parsing_of_a_large_amount_of_json/
- https://stackoverflow.com/questions/48288988/how-do-i-write-a-serde-visitor-to-convert-an-array-of-arrays-of-strings-to-a-vec
- https://stackoverflow.com/questions/38037235/handling-mixed-object-arrays-in-serde
- helper enum that faithfully matches the structure of the input data, deserialize to that first and rearrange into the structure you prefer https://github.com/serde-rs/serde/issues/1350#issuecomment-436631872
- untagged in a single deserializer is 30~40% slower than creating a deserializer and attempting a parse for each variant for each record https://github.com/serde-rs/serde/issues/1381
- resursive string or map https://stackoverflow.com/questions/33895090/serialize-json-in-a-recursive-struct
- deserialize string with known names and unkown as Other https://github.com/serde-rs/json/issues/290#issuecomment-293144073
- one field determines the other and flatten https://github.com/serde-rs/serde/issues/761
- an enum for the three possibilities: Missing, Null, Value(T) https://stackoverflow.com/questions/44331037/how-can-i-distinguish-between-a-deserialized-field-that-is-missing-and-one-that
- https://stackoverflow.com/questions/31907814/selecting-a-subset-of-keys-from-a-json-array
- There's no concept of a None without a corresponding Some type. The compiler needs to know how much space to allocate for the value for either case https://stackoverflow.com/questions/45665121/deserializing-an-optional-struct-field-with-a-generic-type-leads-to-semantic-wei
- Visitor example https://stackoverflow.com/questions/35134684/deserialize-to-struct-with-an-enum-member
- https://stackoverflow.com/questions/39383809/how-to-transform-fields-during-serialization-using-serde
- update specific fields of an arbitrary input file without touching any keys or values that my program does not know about - you can use #[serde(flatten)] to capture all the unrecognized keys and values you don't care about to create a "catch-all" field https://stackoverflow.com/questions/51002462/how-can-i-use-serdes-custom-deserialization-to-update-a-subset-of-arbitrary-i
- serialize type name https://stackoverflow.com/questions/46612327/using-serde-to-get-a-types-name-as-string-when-the-type-is-only-serialize
- serialize string while also returning it's size https://stackoverflow.com/questions/36159031/add-value-of-a-method-to-serde-serialization-output
- https://serde.rs/enum-representations.html
- Currently there is no way for Serde to provide Serialize and Deserialize impls that work for every array size. This is blocked on const generics which is being worked on and will hopefully land in nightly later in 2018 https://stackoverflow.com/questions/48782047/binary-deserialization-of-u8-128

