- http://dchambers.github.io/articles/redux-flow-tutorial/
- https://flowtype.org/blog/2016/07/01/New-Unions-Intersections.html
- http://facebook.github.io/jest/blog/2016/06/22/jest-13.html

> Flow doesn't support default values in destructuring right now: https://github.com/facebook/flow/issues/183
> -- https://github.com/facebook/flow/issues/2135#issuecomment-235697091

## flow vs typescript

I don't want to start a holy war on this, as it's generally accepted that Flow's type system and inference is superior. I believe TypeScript is a generally better solution despite this, for other reasons. This is just the list I can come up with offhand:
Upsides for TypeScript:

- bigger community
- more definitions (This cannot be overstated; the gap is wide)
- great IDE tooling and support via language service
- great compiler

Downsides for Flow:
- less definitions
- smaller community
- .flowconfig is difficult to get right, and often requires hacks to pass type checking
- dodgy IDE support
- type discovery is more difficult

https://news.ycombinator.com/item?id=15295951
