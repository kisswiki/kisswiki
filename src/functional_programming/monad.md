Lately I’ve been working again on my Category Theory formalization in Coq, and just now proved, in a completely general setting, the following statement:

Monads are monoid (objects) in the (monoidal) category of endofunctors (which is monoidal with respect to functor composition).

The proof, using no axioms, is [here](https://github.com/jwiegley/category-theory/blob/db6a58855268ea771218e191820ac617740c1778/Monad/Monoid.v#L19).

http://www.newartisans.com/2017/05/monads-are-monoids/

##

Meh, monad's in haskell are pretty and all, but having to shoehorn everything into a monad transformer stack is painful, and also not particularly performant. I'm sure they could be made more-so in Rust (like everything else) and an opt in abstraction to carry around a computational "context" would be cool, but it aint a showstopper by any means. imho

https://www.reddit.com/r/rust/comments/8pocvk/do_you_think_rust_will_grow_like_go_did_in_the/e0fjpj9/