> Complexity kills. It sucks the life out of developers, it makes products difficult to plan, build, and test. - Ray Ozzie
> -- https://twitter.com/CodeWisdom/status/796421851996160005

>Complexity is the single major difficulty in the successful development of large-scale software systems.
> -- https://raw.githubusercontent.com/papers-we-love/papers-we-love/master/design/out-of-the-tar-pit.pdf

##

I had more or less the same navigation problem in a large Java codebase, where “action at a distance” effect is created by inheritance. In Java, the problem is easier (as you can syntactically follow the specific chain of superclasses, instead of impls being anywhere in a trait-or-type defining crate), the solution is much better (IJ is pretty close to ideal with respect to semantic understanding), and still, at lest for me personally, there’s a big mental overhead to piece together spatially disjoint fragments of code into a straight-line sequence of steps that actually happens at runtime.

I do think it is an unsolved problem in language design to combine expressive power of polymorphism with cognitive simplicity of straight-line non-generic code that just does things, one after another.

Practically, I solve it by not using traits, interfaces, inheritance, closures, etc, unless absolutely necessary (chiefly at the boundary between separately linked or at least separately developed components), but I feel that that’s an unorthodox position, and that the no-action default in Rust is to make much more things generic&indirect.

https://lobste.rs/s/v4a2hs/creator_ghostty_talks_zig_over_go#c_znpdzo
