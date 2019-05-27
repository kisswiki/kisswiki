Currying is converting a single function of n arguments into n functions with a single argument each. Given the following function:

`function f(x,y,z) { z(x(y));}`

When curried, becomes:

`function f(x) { lambda(y) { lambda(z) { z(x(y)); } } }`

In order to get the full application of `f(x,y,z)`, you need to do this:

`f(x)(y)(z);`

Many functional languages let you write f x y z. If you only call `f x y` or `f(x)(y)` then you get a partially-applied function—the return value is a closure of `lambda(z){z(x(y))}` with passed-in the values of x and y to `f(x,y)`.

https://stackoverflow.com/questions/218025/what-is-the-difference-between-currying-and-partial-application/218055#218055

>In lambda calculus and functional programming, currying is defined as taking a function that takes multiple arguments and converting it into a sequence of functions that each take a single argument.
>The act of applying arguments to the functions in this way is called partial function application.
>Elm actually supports currying by default
https://becoming-functional.com/partial-function-application-in-elm-ee4931228af4

>Partial application occurs when we call a function and pass it a fewer number of parameters than the number of parameters that that function expects.
https://medium.com/@ajdin.imsirovic/understanding-currying-in-elm-f47d85d1786

- http://veryfancy.net/blog/curried-form-in-elm-functions/
- http://2ality.com/2011/09/currying-vs-part-eval.html
