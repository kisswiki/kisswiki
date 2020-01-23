- https://doc.rust-lang.org/std/vec/struct.Vec.html
- https://doc.rust-lang.org/book/vectors.html
- Rust likes to be more general than that; mapping is done over iterators, rather than over solely vectors or slices. http://stackoverflow.com/questions/30026893/using-map-with-vectors

## Example

``` rust
let names = vec!["John".to_owned(), "Smith".to_owned()];
```

http://xion.io/post/code/rust-move-out-of-container.html

## Access last n elements of a vector

```rust
&rust_vec[rust_vec.len()-10..]
```

https://www.reddit.com/r/learnrust/comments/eo1qh5/neater_way_to_access_the_last_n_elements_in_a_vec/fe7pay1/
