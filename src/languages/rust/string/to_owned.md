to_owned() is great for generic code, but outside of generics, to_string() is better.

- https://github.com/rust-lang/rust/pull/26176#issuecomment-110813608
- `create a String directly.md`
- https://www.reddit.com/r/rust/comments/4l71qw/how_do_i_convert_a_str_to_string_the_beginning_in/d3mc6jy/?context=3
- https://doc.rust-lang.org/beta/std/borrow/trait.ToOwned.html