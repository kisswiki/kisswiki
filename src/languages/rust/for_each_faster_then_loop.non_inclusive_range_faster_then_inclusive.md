Because of lazy iteration, `0..num` is faster than `0..=num`

`zip` etc. are equally fast as `for_each` thanks to lazy iterator evaluation, and will be unrolled to one loop.

>To calculate the value of prediction, this code iterates through each of the 12 values in coefficients and uses the zip method to pair the coefficient values with the previous 12 values in buffer. Then, for each pair, we multiply the values together, sum all the results, and shift the bits in the sum qlp_shift bits to the right.

>Calculations in applications like audio decoders often prioritize performance most highly. Here, we’re creating an iterator, using two adaptors, and then consuming the value. What assembly code would this Rust code compile to? Well, as of this writing, it compiles down to the same assembly you’d write by hand. There’s no loop at all corresponding to the iteration over the values in coefficients: Rust knows that there are 12 iterations, so it “unrolls” the loop. Unrolling is an optimization that removes the overhead of the loop controlling code and instead generates repetitive code for each iteration of the loop.

>All of the coefficients get stored in registers, which means accessing the values is very fast. There are no bounds checks on the array access at runtime. All these optimizations that Rust is able to apply make the resulting code extremely efficient.

- https://doc.rust-lang.org/book/ch13-04-performance.html
- [Iterator of `slice` has poor performance than `for loop` · Issue #54928 · rust-lang/rust](https://github.com/rust-lang/rust/issues/54928)
- https://www.reddit.com/r/rust/comments/eiwhkn/comment/fcu4y8y
- https://veloren.net/devblog-50/
