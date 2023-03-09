- https://philipwalton.com/articles/loading-polyfills-only-when-needed/
  - https://github.com/babel/babel-preset-env
  - Promises, Fetch, and Symbol minify/gzip down to 8KB... Unless you have some very specific circumstances. I don't see the point of this. https://www.reddit.com/r/javascript/comments/54x67y/loading_polyfills_only_when_needed/
- https://philipwalton.com/articles/the-dark-side-of-polyfilling-css/
- https://github.com/financial-times/polyfill-service

##

A good general rule is this:

- If it’s new syntax, you can probably transpile it
- If it’s a new object or method, you can probably polyfill it
- If it’s something clever that the browser does outside of your code, you’re probably SOL

But I’m afraid that my peach table belies some gray areas.

https://hackernoon.com/polyfills-everything-you-ever-wanted-to-know-or-maybe-a-bit-less-7c8de164e423