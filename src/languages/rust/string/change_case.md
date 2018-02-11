```rust
extern crate inflector;
use inflector::Inflector;

let capitalized = "some string".to_title_case();
```

- Snake, kebab, train, camel, sentence, class, and title cases as well as ordinalize, deordinalize, demodulize, deconstantize, foreign key, table case, and pluralize/singularize are supported as both traits and pure functions acting on &str and String types. https://github.com/whatisinternet/Inflector
- https://stackoverflow.com/questions/38406793/why-is-capitalizing-the-first-letter-of-a-string-so-convoluted-in-rust/38406885#38406885