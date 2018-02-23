```rust
let string = "line one
line two";

let string = "one line \
    written over \
    several";

let shader = r#"
    #version 330

    in vec4 v_color;
    out vec4 color;

    void main() {
        color = v_color;
    };
"#;
```

https://stackoverflow.com/questions/29483365/what-is-the-syntax-for-a-multiline-string-literal