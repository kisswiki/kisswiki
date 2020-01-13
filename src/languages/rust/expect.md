```rust
zip.start_file(name, options)
    .expect(format!("processing file '{}' failed.", name).as_str());
```

If you run clippy on that, it'll suggest using the following:

```rust
zip.start_file(name, options)
    .unwrap_or_else(|| panic!("processing file '{}' failed.", name));
```

This is better because it won't perform the string formatting in the non-error case.

https://www.reddit.com/r/rust/comments/ekpqp7/hey_rustaceans_got_an_easy_question_ask_here_22020/fe6252y/
