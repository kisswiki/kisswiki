They are both just ways to lie to the compiler. Cell is a way to pretend that a value is immutable and then treat it as mutable. It uses unsafe to mutate the insides. This is needed for cases when the compiler cannot prove that a value is mutated safely.

RefCell is a runtime borrow-checker. It's a struct of a T and an additional borrow counter. The borrow counter is either the number of borrows, or 0xFFFFFFFF when there is a mutable reference. When we use the method borrow(), the borrow count increases, and the returned Ref has a pointer to the RefCell's borrow count to decrease it on delete. Same for borrow_mut() and RefMut except that it sets the borrow count to 0 and 0xFFFFFFFF respectively.

- https://www.reddit.com/r/rust/comments/755a5x/i_have_finally_understood_what_cell_and_refcell/
- https://doc.rust-lang.org/stable/book/ch15-05-interior-mutability.html

##

People can definitely write bad code in any language, however Rust relentlessly forces you towards single-ownership(unless you're using RefCell) which is a really good thing.
reply
	

The thing is nightmare Rust code is usually obvious - the dev is using a lot of unsafe{} blocks, or Cell, or is spewing out a really complex type signature.

With C++, the nightmares are just really obscured pointer manipulation that can work but have infinite edge case failure states that cause endless undefined behavior.

In Rust, if it compiles, it is at least constrained to only break what the dev explicitly broke, it doesn't break everything.
reply

Note that Cell is entirely safe and not problematic. It is RefCell that can cause problems.

https://news.ycombinator.com/item?id=15048762
