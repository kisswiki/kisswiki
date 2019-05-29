- https://hermanradtke.com/2015/06/22/effectively-using-iterators-in-rust.html
  - https://stackoverflow.com/questions/40862191/cannot-move-out-of-borrowed-content-when-iterating-the-loop
- [Karol Kuczmarski's Blog – Iteration patterns for Result & Option](http://xion.io/post/code/rust-iter-patterns.html)
- https://blog.guillaume-gomez.fr/articles/2017-03-09+Little+tour+of+multiple+iterators+implementation+in+Rust
- https://stackoverflow.com/questions/44662312/how-to-filter-a-vector-of-custom-structs-in-rust

## iterating over one field of a struct while modifying another field of a struct
After struggling to understand inner mutability, I finally solved this problem by wrapping both fields into a RefCell and using struct.field.borrow() and struct.field.borrow_mut(). This way you can technically mutate one field while not having a mutable reference to the whole struct.

https://www.reddit.com/r/rust/comments/6riwp2/learning_rust/dl5ipp9/

## iter vs into_iter

- https://stackoverflow.com/questions/34733811/what-is-the-difference-between-iter-and-into-iter
-
- https://thenewwazoo.github.io/clone.html
