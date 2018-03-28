```rust
        match event {
            Event::Quit {..} | Event::KeyDown { keycode:Some(Keycode::Escape), .. }  => {
                break 'running
            },
            _ => {}
        }
```

What does the single pipeline between the Events mean?

"Or". That arm is matching two distinct patterns.


The double dots are something new to me as well, the only place I've seen them before is in for loops.

In a structure or tuple pattern, they mean "and the rest". This must be explicit so that if you write an exhaustive pattern (i.e. match all fields in a structure), and then someone adds a new field to the structure, the compiler can help you track down where you need to update patterns.

The double dots are used for elision: they match any numbers of members of the enum/struct.

```rust
KeyDown {
    keycode,
    keymod,
    repeat,
    ..
}
```

- https://github.com/ggez/ggez/blob/9ce5c1722bf0552e2af129dca23717e1f12f020a/src/event.rs#L216
- https://www.reddit.com/r/rust/comments/6jepxy/syntax_related_questions/
- https://www.reddit.com/r/rust/comments/3tq5au/how_to_match_an_enums_that_are_stored_in_an_array/
- https://learning-rust.github.io/docs/a10.control_flows.html#match