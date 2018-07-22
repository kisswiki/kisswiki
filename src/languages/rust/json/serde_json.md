- https://stackoverflow.com/questions/30292752/how-do-i-parse-a-json-file
- http://technosophos.com/2018/06/12/from-go-to-rust-json-and-yaml.html
- https://tutorialedge.net/rust/rust-working-with-json-tutorial/
- https://stackoverflow.com/questions/49717966/how-to-deserialize-a-strongly-typed-json-dictionary-in-serde

## uknown json structure to primitive types

```rust
&serde_json::Value::Number(ref item_val) => req = req.arg(item_val.as_f64().expect("f64 value")),
```

https://users.rust-lang.org/t/solved-serde-json-deserialize-unknown-json-structure-to-primitive-types/9369/2

## deserialize to serde_json::Value

```rust
    let data_json: serde_json::Value =
        serde_json::from_str(&data).expect("JSON was not well-formatted");
    println!("data_json: \n{}", serde_json::to_string_pretty(&data_json).unwrap());
```

https://stackoverflow.com/questions/30292752/how-do-i-parse-a-json-file

## untyped JSON values

- https://github.com/serde-rs/json#operating-on-untyped-json-values
- https://www.packtpub.com/mapt/book/application_development/9781785880254/11/ch11lvl1sec106/parsing-unstructured-json

## full path to the thing that errored out

https://github.com/serde-rs/json/issues/285

## nested

I highly recommend using a 2-step approach: use Serde to read the input plain and then use the conversion protocols Rust gives you to construct your CreateUser out of it. Don't parse directly into your command structures!

This also give you the ability to insert validations between the two steps.

I've implemented an example for you:

https://play.rust-lang.org/?gist=21301d9a85a23f88439ada011f0cee2f&version=stable

https://users.rust-lang.org/t/converting-nested-json-to-flat-structure-using-serde-json/15272/3

## pretty print

```rust
#[macro_use]
extern crate serde_json;

fn main() {
    let obj = json!({"foo":1,"bar":2});
    println!("{}", serde_json::to_string_pretty(&obj).unwrap());
}
```

https://stackoverflow.com/questions/42722169/generate-pretty-indented-json-with-serde/49087292#49087292

## pretty print with custom indentation

```rust
    let obj = json!({"foo":1,"bar":2});

    let buf = Vec::new();
    let formatter = serde_json::ser::PrettyFormatter::with_indent(b"    ");
    let mut ser = serde_json::Serializer::with_formatter(buf, formatter);
    obj.serialize(&mut ser).unwrap();
    println!("{}", String::from_utf8(ser.into_inner()).unwrap());
```

https://stackoverflow.com/questions/42722169/generate-pretty-indented-json-with-serde/49087292#49087292

## preserve insertion order

Use indexedmap https://github.com/bluss/indexmap

`cargo add indexedmap`

In Cargo.toml

```toml
[dependencies.indexmap]
version = "1.0.1"
features = ["serde-1"]
```

https://github.com/serde-rs/serde/issues/269

## sort HashMap keys when serializing

https://stackoverflow.com/questions/42723065/how-to-sort-hashmap-keys-when-serializing-with-serde

## from file

```rust

    let deserialized_camera: SomeDataType =
        serde_json::from_reader(json_file).expect("error while reading json");
```

https://github.com/serde-rs/serde/issues/1195#issuecomment-376438893
