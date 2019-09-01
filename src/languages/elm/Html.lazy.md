Html.lazy works by memoization, meaning that you’re using less CPU power at the cost of more memory usage. It’s also worth nothing that while reference equality is very cheap, it’s still something that is being done in addition to running the view function in the case where the arguments fails the equality test.

For view functions which are likely passed different arguments each time they’re called, you’re just wasting memory and adding overhead.

For view functions which are likely to be given the same argument every time they’re called, but are cheap to run, you’re using more memory for little benefit.

Html.lazy is an optimization and like all optimization, it involves trade offs.

Lazy should only be used when it’s known to have a good effect, and that is pretty hard for a compiler to know.

https://discourse.elm-lang.org/t/any-disadvantage-in-always-using-html-lazy/4086/17


It can also be useful to use lazy in long lists of items. In the TodoMVC app, it is all about adding entries to your todo list. You could conceivably have hundreds of entries, but they change very infrequently. This is a great candidate for laziness! By switching viewEntry entry to lazy viewEntry entry we can skip a bunch of allocation that is very rarely useful. So the second tip is try to use lazy nodes on repeated structures where each individual item changes infrequently.

https://guide.elm-lang.org/optimization/lazy.html

Also https://guide.elm-lang.org/optimization/keyed.html
