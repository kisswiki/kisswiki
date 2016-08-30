> what makes Rollup faster is what I called "scope-hoisting" (aka "module-inlining"), i.e. the fact that every module shares the same scope instead of being loaded dynamically from separate scopes.
This means that Rollup turns multiple modules into what you would have written if you were writing one big module, and you only pay the cost of variable initialization and lookup, rather than the cost of the dynamic module loader that runs whenever require() is called.
> Rollup will still generate the smallest bundles because of its 'scope hoisting' approach – see e.g. this 45% reduction after gzipping compared to Webpack without any tree-shaking.
> we may be able to treeshake CommonJS modules in future
> Rollup doesn't (yet) do automatic code-splitting
> Rollup generates smaller and faster bundles even without tree shaking. It's also faster at creating bundles
> Until Webpack does 'scope-hoisting' – i.e. putting modules in a single scope, rather than wrapping them in functions and including an inline module loader – it will generate bundles that are larger and slower to initialise than Rollup bundles
> We tried days to migrate simple Webpack projects and gave up eventually. npm dependencies will cause problems, despite the plugins.
> These are good reads. I think issues like these will be resolved soon (it looks like fixes for most of the issues are already underway), but that's absolutely worth considering right now.
> I'm using rollup for libs, webpack for apps
> https://www.reddit.com/r/javascript/comments/4yprc5/how_to_bundle_javascript_with_rollup_stepbystep/

## quick start

`rollup src/main.js --output bundle.js # or rollup main.js -o bundle.js`

> You could also do rollup src/main.js > bundle.js, but as we'll see later, this is less flexible if you're generating sourcemaps.
> http://rollupjs.org/guide/

## config

rollup.config.js

```
export default {
  entry: 'src/main.js',
  format: 'cjs',
  dest: 'bundle.js' // equivalent to --output
};
```

Run

`rollup -c # or rollup -c rollup.config.js`

> A config file is written in JavaScript and is more flexible than the raw CLI.
> http://rollupjs.org/guide/

## babel

`npm i -D rollup-plugin-babel`

Note: rollup-plugin-babel depends on babel-preset-es2015-rollup, so no need to think about the latter.

## format

> iife – A self-executing function, suitable for inclusion as a <script> tag
> https://github.com/rollup/rollup/wiki/JavaScript-API
