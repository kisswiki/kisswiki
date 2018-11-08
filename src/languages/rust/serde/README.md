- https://serde.rs/
- http://stackoverflow.com/documentation/rust/1170/serde
- http://siciarz.net/24-days-rust-serde/
- https://riptutorial.com/rust/topic/1170/serde

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
- Deserialize string or array or object and concatenate text https://github.com/serde-rs/serde/issues/1333

## TOREAD

- https://users.rust-lang.org/t/serde-deserialize-string-field-in-json-to-a-different-type/12942/7
- https://github.com/serde-rs/json/issues/67
- https://github.com/serde-rs/serde/pull/739
- https://github.com/serde-rs/json/issues/181
- https://stackoverflow.com/questions/47611825/mismatched-types-when-trying-to-parse-json-from-curl-with-serde-json
- https://stackoverflow.com/questions/53018165/can-serde-deserialize-json-to-one-of-a-set-of-types-depending-on-the-value-of-a
- https://stackoverflow.com/questions/37870428/convert-two-types-into-a-single-type-with-serde
- https://docs.rs/serde/1.0.80/serde/de/trait.Visitor.html
- https://stackoverflow.com/questions/49717966/how-to-deserialize-a-strongly-typed-json-dictionary-in-serde
- https://medium.com/sean3z/building-a-restful-crud-api-with-rust-1867308352d8
- https://stackoverflow.com/questions/51890312/parsing-json-with-multiple-representation-in-the-same-attribute
- https://www.reddit.com/r/rust/comments/7hsstl/best_way_to_represent_certain_json_objects_in/
- https://stackoverflow.com/questions/46074324/parsing-an-object-inside-an-object-with-serde-json
- https://stackoverflow.com/questions/33251881/rust-serde-json-deserialization-examples
- https://stackoverflow.com/questions/42392935/how-do-i-deserialize-into-trait-not-a-concrete-type
- https://stackoverflow.com/questions/47821224/how-can-i-do-key-agnostic-deserialization-of-json-objects
- https://stackoverflow.com/questions/35134684/deserialize-to-struct-with-an-enum-member?rq=1
- https://stackoverflow.com/questions/41042767/is-it-possible-to-flatten-sub-object-fields-while-parsing-with-serde-json?noredirect=1&lq=1
- https://stackoverflow.com/questions/51276896/how-do-i-use-serde-to-serialize-a-hashmap-with-structs-as-keys-to-json
- https://stackoverflow.com/questions/44302604/how-to-deserialize-a-subfield-of-a-struct-from-the-original-structs-json-with-s
- https://stackoverflow.com/questions/44331037/how-can-i-distinguish-between-a-deserialized-field-that-is-missing-and-one-that
- https://stackoverflow.com/questions/37561593/how-can-i-use-serde-with-a-json-array-with-different-objects-for-successes-and-e/42034863#42034863
- https://stackoverflow.com/questions/33925368/how-can-i-disable-the-unused-attribute-warning-when-using-serde-library
- https://stackoverflow.com/questions/53015098/how-do-i-perform-additional-database-queries-when-serializing-a-value-with-serde
- https://stackoverflow.com/questions/41718854/how-to-convert-serde-jsonvalue-into-concrete-type-implementing-deserialize-tra?rq=1
- https://stackoverflow.com/questions/46167642/can-i-implement-the-same-trait-multiple-times-in-different-ways-for-a-single-str
- https://stackoverflow.com/questions/47020123/skipping-serialization-of-a-variant-if-its-value-is-empty-custom-serialization
- https://stackoverflow.com/questions/44301748/how-can-i-deserialize-an-optional-field-with-custom-functions-using-serde?rq=1
- https://stackoverflow.com/questions/51988630/how-can-i-get-serde-to-allocate-strings-from-an-arena-during-deserialization
- https://stackoverflow.com/questions/51649398/implementing-a-generic-length-delimited-hex-deserializer-in-serde?rq=1
- https://stackoverflow.com/tags/serde/hot?filter=all
- https://stackoverflow.com/questions/51698283/deserialize-potentially-empty-string-using-serde/51708628
- https://stackoverflow.com/questions/52562539/how-to-ensure-at-compile-time-that-a-type-will-serialize-into-a-json-array
- https://stackoverflow.com/questions/44331037/how-can-i-distinguish-between-a-deserialized-field-that-is-missing-and-one-that?rq=1
- https://stackoverflow.com/questions/48419142/how-to-avoid-serde-needing-the-default-trait-for-a-field-that-skips-serializatio?rq=1
- https://stackoverflow.com/questions/48817194/how-can-i-deserialize-a-value-into-a-struct-with-that-value-and-a-phantomdata-in?rq=1
- https://stackoverflow.com/questions/44836327/is-there-is-a-simpler-way-to-convert-a-type-upon-deserialization?noredirect=1&lq=1
- https://stackoverflow.com/questions/49538627/how-do-i-customize-a-deserialize-implementation-for-certain-input-types-but-not?rq=1
- https://stackoverflow.com/questions/49717966/how-to-deserialize-a-strongly-typed-json-dictionary-in-serde?rq=1
- https://stackoverflow.com/questions/29105612/how-to-decode-json-object-with-rust-keyword-attribute-name
- https://stackoverflow.com/questions/52796222/how-to-pass-an-array-of-objects-to-webassembly-and-convert-it-to-a-vector-of-str?rq=1
- https://stackoverflow.com/questions/49552876/how-do-i-create-a-generic-struct-that-can-be-serialized-with-serde-and-retain-ty
- https://stackoverflow.com/questions/52611244/how-can-i-deserialize-a-type-where-all-the-fields-are-default-values-as-a-none-i
- https://stackoverflow.com/questions/49983101/serialization-of-large-struct-to-disk-with-serde-and-bincode-is-slow?noredirect=1&lq=1
- https://stackoverflow.com/questions/47020123/skipping-serialization-of-a-variant-if-its-value-is-empty-custom-serialization?rq=1
- https://stackoverflow.com/questions/41718854/how-to-convert-serde-jsonvalue-into-concrete-type-implementing-deserialize-tra
- https://stackoverflow.com/questions/49983101/serialization-of-large-struct-to-disk-with-serde-and-bincode-is-slow
- https://stackoverflow.com/questions/41151080/deserialize-a-json-string-or-array-of-strings-into-a-vec?rq=1
- https://stackoverflow.com/questions/44302604/how-to-deserialize-a-subfield-of-a-struct-from-the-original-structs-json-with-s?rq=1
- https://stackoverflow.com/questions/36061560/can-i-take-a-byte-array-and-deserialize-it-into-a-struct
- https://stackoverflow.com/questions/44468386/how-do-i-map-a-c-struct-with-padding-over-32-bytes-using-serde-and-bincode?rq=1
- https://stackoverflow.com/questions/49312600/how-do-i-serialize-or-deserialize-an-arct-in-serde
- https://stackoverflow.com/questions/43973225/is-there-a-way-to-convert-a-serde-map-into-a-value
- https://stackoverflow.com/questions/34399461/what-is-the-idiomatic-way-to-encode-an-iterator-with-serde-json
- https://stackoverflow.com/questions/50021897/how-to-implement-serdeserialize-for-a-boxed-trait-object
- https://stackoverflow.com/questions/46469334/deserialize-json-array-into-tuple-and-give-it-type-tags
- https://doc.servo.org/serde/de/trait.DeserializeSeed.html
- https://www.reddit.com/r/rust/comments/7hasv6/mixed_valuestruct_deserialization_with_serde_json/
- https://gallery.rustr.org/rust-serialization.html#with-serde
- https://users.rust-lang.org/t/using-serde-to-deserialize-a-vec-u8-into-a-struct-fails/10766
- https://stackoverflow.com/questions/39146584/how-do-i-create-a-rust-hashmap-where-the-value-can-be-one-of-multiple-types
- https://users.rust-lang.org/t/how-to-iterate-over-json-objects-with-hierarchy/19632/2
- https://internals.rust-lang.org/t/small-but-painful-annoyances-when-writing-rust-code/5347
- https://riptutorial.com/rust/example/17862/process-an-array-of-values-without-buffering-them-into-a-vec
- https://stackoverflow.com/questions/45059538/how-to-deserialize-into-a-enum-variant-based-on-a-key-name
- https://stackoverflow.com/questions/52034764/how-do-i-serialize-an-enum-without-including-the-name-of-the-enum-variant
- https://rustit.be/blog/rust-serde-deserialization-of-an-enum-variant.html
- https://stackoverflow.com/questions/49604190/how-do-i-configure-serde-to-use-an-enum-variants-discriminant-rather-than-name
- https://users.rust-lang.org/t/serde-json-flatten-nested-internally-tagged-enums/13178/2
- https://riptutorial.com/rust/example/5651/serialize-enum-as-string
- https://noyez.gitlab.io/post/2018-08-28-serilize-this-or-that-into-u64/
- https://noyez.gitlab.io/post/2018-08-14-short-serde-deserialize-exapmle/
- https://github.com/serde-rs/json/issues/144
- https://stackoverflow.com/questions/53123256/is-there-a-way-to-tell-serde-to-use-a-struct-field-as-a-maps-key
- https://github.com/serde-rs/serde/commit/d4ea4a7eef12eb9dfaf6bfc0c7cf84e0ac8ff9ab
- https://github.com/serde-rs/serde/issues/415
- https://www.reddit.com/r/rust/comments/81we47/serializing_awkward_data_with_serde/
- http://zork.net/~st/jottings/Serializing_awkward_data_with_serde.html
- https://www.reddit.com/r/rust/comments/86fxir/new_in_serde_1034_a_flatten_attribute_to_share/
- https://users.rust-lang.org/t/how-to-insert-the-contents-of-a-json-object-into-a-struct-containing-vectors/13830/4
- https://stackoverflow.com/questions/47245397/how-to-collate-an-array-of-json-objects-by-a-property-into-a-struct-containing-v
- https://zsiciarz.github.io/24daysofrust/book/vol2/day8.html
- https://www.oreilly.com/library/view/mastering-rust/9781785885303/d965fbe4-8aa4-444d-913f-57d5fae1b675.xhtml
- https://www.oreilly.com/library/view/rust-standard-library/9781788623926/63082928-fe1b-4203-9bdb-887d13c11bb1.xhtml
- https://tutorialedge.net/rust/rust-working-with-json-tutorial/
- https://stackoverflow.com/questions/33323891/conditionally-decoding-json-based-on-a-field-in-the-json
- https://stackoverflow.com/questions/46753955/how-to-transform-fields-during-deserialization-using-serde
- https://stackoverflow.com/questions/39383809/how-to-transform-fields-during-serialization-using-serde
- https://stackoverflow.com/questions/48288988/how-do-i-write-a-serde-visitor-to-convert-an-array-of-arrays-of-strings-to-a-vec?noredirect=1&lq=1
- https://stackoverflow.com/questions/49538627/how-do-i-customize-a-deserialize-implementation-for-certain-input-types-but-not?noredirect=1&lq=1
- https://stackoverflow.com/questions/53018165/can-serde-deserialize-json-to-one-of-a-set-of-types-depending-on-the-value-of-a
- https://stackoverflow.com/questions/41042767/is-it-possible-to-flatten-sub-object-fields-while-parsing-with-serde-json
- https://github.com/serde-rs/serde/issues/177
