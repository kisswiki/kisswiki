deserialize_with, Visitor pattern

I have JSON like this:

```json
{
    "fieldNames": ["MyInt", "MyFloat", "MyString"],
    "fieldValues": [5, 10.0, "hello"],
}
```

I want to deserialize into a struct like this:

```rust
#[derive(Deserialize)]
struct MyStruct {
    my_int: u64,
    my_float: f64,
    my_string: String,
}
```

- https://stackoverflow.com/questions/47405416/deserializing-key-and-value-lists-as-struct-from-json-using-serde
