## extracting value from key in object

This helped me:

```rust
    use Value::Object;
    if let &Object(ref map1) = v1 {
```

- https://git.brn.li/SWW13/i3status-rust/commit/5e9758f983d605179850cc126e71f0773ed9c8bd
- https://users.rust-lang.org/t/deserializing-enum-json-field-with-serde-with-multiple-types/5424/2


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
