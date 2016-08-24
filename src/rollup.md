> what makes Rollup faster is what I called "scope-hoisting" (aka "module-inlining"), i.e. the fact that every module shares the same scope instead of being loaded dynamically from separate scopes.
This means that Rollup turns multiple modules into what you would have written if you were writing one big module, and you only pay the cost of variable initialization and lookup, rather than the cost of the dynamic module loader that runs whenever require() is called.
> Rollup will still generate the smallest bundles because of its 'scope hoisting' approach – see e.g. this 45% reduction after gzipping compared to Webpack without any tree-shaking.
> Rollup doesn't (yet) do automatic code-splitting
> Rollup generates smaller and faster bundles even without tree shaking. It's also faster at creating bundles
> https://www.reddit.com/r/javascript/comments/4yprc5/
