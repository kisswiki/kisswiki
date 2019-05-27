```rust
let shader = r#"
    #version 330

    in vec4 v_color;
    out vec4 color;

    void main() {
        color = v_color;
    };
"#;
```

If you have sequences of double quotes and hash symbols within your string, you can denote an arbitrary number of hashes as a delimiter:

```rust
let crazy_raw_string = r###"
    My fingers #"
    can#"#t stop "#"" hitting
    hash##"#
"###;
```

- http://stackoverflow.com/questions/29483365/what-is-the-syntax-for-a-multiline-string-literal
- http://stackoverflow.com/questions/15265198/how-do-i-write-a-multi-line-string-in-rust
- https://doc.rust-lang.org/book/strings.html
