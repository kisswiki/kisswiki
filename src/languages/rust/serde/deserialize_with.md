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

## extracting value from key in object

This helped me:

```rust
    use Value::Object;
    if let &Object(ref map1) = v1 {
```

https://git.brn.li/SWW13/i3status-rust/commit/5e9758f983d605179850cc126e71f0773ed9c8bd


```rust
#[derive(Debug, Serialize, Deserialize)]
struct Audience {
    #[serde(deserialize_with = "deserialize_expression_field")]
    expression: Expression,
    id: String,
}

fn deserialize_expression_field<'de, D>(de: D) -> Result<Expression, D::Error>
where
    D: serde::Deserializer<'de>,
{
    use serde_json::Value::Object;
    let deser_result: serde_json::Value = serde::Deserialize::deserialize(de)?;
    println!("{}", &deser_result);
    match deser_result {
        Object(ref map) if map.contains_key("and") => {
            Ok(Expression::And(serde_json::from_str::<String>(&map.get("and").unwrap().to_string()).unwrap()))
        }
        Object(ref map) if map.contains_key("or") => {
            Ok(Expression::Or(serde_json::from_str::<String>(&map.get("or").unwrap().to_string()).unwrap()))
        }
        _ => Err(serde::de::Error::custom("Unexpected value")),
    }
}

#[derive(Debug, Serialize, Deserialize)]
enum Expression {
    #[serde(rename = "and")]
    And(String),
    #[serde(rename = "or")]
    Or(String),
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn deserialize_request() {
        extern crate serde;
        let j = r#"{
  "audience_ids": null,
  "audiences": [
    {
      "expression": {
        "or": "or something"
      },
      "id": "SomeId"
    },
    {
      "expression": {
        "and": "and something"
      },
      "id": "SomeId2"
    }
  ]
}"#;

        let de = serde_json::from_str::<RequestObj>(j).unwrap();
        let se = serde_json::to_string_pretty(&de).unwrap();

        assert_eq!(j, se);
    }
}
```

and run with

`cargo test deserialize_request`
