`unique_ptr` is called `Box`

`weak_unique_ptr` in C++ and Rust are just raw pointers and references.

Note that in C++ there is no zero-cost way for a weak_unique_ptr to know whether its unique_ptr has been freed or not. In Rust, raw pointers do not know this either but references do know this and enforce this statically.

https://www.reddit.com/r/programming/comments/7zbi6s/why_writing_a_doubly_linked_list_in_safe_rust_is/dunzhkq/

Who knows what's in a `RefCell<T>` - there might be a new `T` in place of an old one we're expecting - isn't that like dangling pointers? https://www.reddit.com/r/rust/comments/7zsy72/writing_a_doubly_linked_list_in_rust_is_easy/dur4ne0/
