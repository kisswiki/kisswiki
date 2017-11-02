Clean Code (which isn't about Functional Programming at all). In the last chapter about smells and heuristics, Robert C. Martin has this to say about scope and naming:

"The length of a name should be related to the length of the scope. You can use very short variable names for tiny scopes, but for big scopes you should use longer names.

"Variable names like i and j are just fine if their scope is five lines long."

http://blog.ploeh.dk/2015/08/17/when-x-y-and-z-are-great-variable-names/

##

Descriptive variable names are a code smell.

More precisely, if you can name your variables after more descriptive things than f, a, b, and so on, then your code is probably monomorphic.
Monomorphic code is much more likely to be incorrect than polymorphic code, because for every type signature, there are many more possible implementations.

Thus, descriptive variable names are a code smell, indicating your code is overly monomorphic and more likely to be broken.

http://degoes.net/articles/insufficiently-polymorphic
