People can definitely write bad code in any language, however Rust relentlessly forces you towards single-ownership(unless you're using RefCell) which is a really good thing.
reply
	

The thing is nightmare Rust code is usually obvious - the dev is using a lot of unsafe{} blocks, or Cell, or is spewing out a really complex type signature.

With C++, the nightmares are just really obscured pointer manipulation that can work but have infinite edge case failure states that cause endless undefined behavior.

In Rust, if it compiles, it is at least constrained to only break what the dev explicitly broke, it doesn't break everything.
reply

Note that Cell is entirely safe and not problematic. It is RefCell that can cause problems.

https://news.ycombinator.com/item?id=15048762
