Julia has four different ways of defining a function, and just as many variations on how a for loop looks. One can define a type to be a struct, mutable struct, abstract type and primitive type (all the former possibly parametric). Types can be placed in the type hierarchy as either concrete types, abstract types, union types or unionall types. The representation of types (i.e. type of types) can be either DataType, Union, UnionAll, or Bottom.

This complexity is not completely redundant as such, but it sure is a mouthful to learn, and it's not clear to me this design is the cleanest. Surely, it feels like, [this did not need to be so complicated](https://github.com/JuliaLang/julia/issues/29368).

https://viralinstruction.com/posts/defense/
