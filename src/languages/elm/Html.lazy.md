Html.lazy works by memoization, meaning that you’re using less CPU power at the cost of more memory usage. It’s also worth nothing that while reference equality is very cheap, it’s still something that is being done in addition to running the view function in the case where the arguments fails the equality test.

For view functions which are likely passed different arguments each time they’re called, you’re just wasting memory and adding overhead.

For view functions which are likely to be given the same argument every time they’re called, but are cheap to run, you’re using more memory for little benefit.

Html.lazy is an optimization and like all optimization, it involves trade offs.

Lazy should only be used when it’s known to have a good effect, and that is pretty hard for a compiler to know.

https://discourse.elm-lang.org/t/any-disadvantage-in-always-using-html-lazy/4086/17
