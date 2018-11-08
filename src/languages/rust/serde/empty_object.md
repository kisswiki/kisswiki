
```rust
#[derive(Debug, Serialize, Deserialize)]
struct RequestObj {
    filter: Filter,
}

#[derive(Debug, Serialize, Deserialize)]
struct Filter {
    #[serde(flatten)]
    other: Map<String, serde_json::Value>,
}
```

Above is better than

```rust
#[derive(Debug, Serialize, Deserialize)]
struct RequestObj {
    #[serde(skip_serializing_if = "Map::is_empty")]
    filter: Map<String, serde_json::Value>,
}
```

because there will be no filter field.

https://stackoverflow.com/questions/46993079/how-do-i-change-serdes-default-implementation-to-return-an-empty-object-instead
