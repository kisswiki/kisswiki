## index out of bounds: the len is 0 but the index is 0

```
error: proc-macro derive panicked
  --> src/main.rs:71:36
   |
71 |       let mut doc: DOMTree<String> = html!(
   |  ____________________________________^
72 | |                 <h1>"Hello Kitty"</h1>
73 | |                 <p class="official">
74 | |                     "She is not a cat. She is a human girl."
...  |
85 | |         </html>
86 | |     );
   | |_____^
   |
   = help: message: index out of bounds: the len is 0 but the index is 0
   = note: this error originates in a macro outside of the current crate (in Nightly builds, run with -Z external-macro-backtrace for more info)
```

Solution:

Wrap with tag like

```rust

let mut doc: DOMTree<String> = html!(
         <div>
            <h1>"Hello Kitty"</h1>
            <p class="official"></p>
         </div>
);
```    

## no rules expected the token `.`

```
115 |                 <h1>{text!("{}", context.name)}</h1>
    |                                         ^ no rules expected the token `.`
```

Destructure before:

```rust
let TemplateContext { name, items, .. } = context;
html!(
        <body>
            <h1>{text!("{}", name)}</h1>
            <h3>"Here are your items:"</h3>
            <ul>
               {
                items.iter().map(|item| html!(
                      <li>{text!("{}", item)}</li>
                ))
               }
            </ul>
        </body>
)
```

## no method named `into_iter` found for type `std::string::String` in the current scope

Use `text!` macro.

```rust
            <h1>{text!("{}", name)}</h1>
```
