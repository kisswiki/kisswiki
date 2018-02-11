- https://doc.rust-lang.org/book/second-edition/ch06-00-enums.html
- https://doc.rust-lang.org/book/second-edition/ch18-03-pattern-syntax.html
- http://xion.io/post/code/rust-patterns-ref.html

##

In fact, in Rust, match is designed to work quite well without taking ownership. In particular, the input to match is an L-value expression; this means that the input expression is evaluated to a memory location where the value lives. match works by doing this evaluation and then inspecting the data at that memory location.

(If the input expression is a variable name or a field/pointer dereference, then the L-value is just the location of that variable or field/memory. If the input expression is a function call or other operation that generates an unnamed temporary value, then it will be conceptually stored in a temporary area, and that is the memory location that match will inspect.)

https://blog.rust-lang.org/2015/04/17/Enums-match-mutation-and-moves.html