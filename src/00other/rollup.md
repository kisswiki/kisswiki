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

- http://rollupjs.org/guide/
- http://javascriptplayground.com/blog/2016/02/better-bundles-rollup/
- https://github.com/eventualbuddha/babelrc-rollup

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

Note: rollup-plugin-babel devDepends on babel-preset-es2015-rollup, so we still need to install it.

## format

> iife – A self-executing function, suitable for inclusion as a <script> tag
> https://github.com/rollup/rollup/wiki/JavaScript-API

## starer kit

- Couldn't make it work https://github.com/yamafaktory/babel-react-rollup-starter
- https://github.com/duske/rollup-quickstart
- https://github.com/lazamar/Rollup.js-Quick-Start-Kit

## react

- https://github.com/rollup/rollup/issues/437
- https://github.com/systemjs/builder/pull/205

## 2017-05-30

rollup.config.js

```
// https://stackoverflow.com/questions/43567972/how-to-set-up-ramda-in-rollup-with-babel-to-use-es6-import
// options.globals:
// https://github.com/rollup/rollup/issues/1299#issuecomment-278377990
// https://github.com/rollup/rollup/wiki/JavaScript-API#globals
import commonjs from 'rollup-plugin-commonjs';
import resolve from 'rollup-plugin-node-resolve';

export default {
    entry: 'index.js',
    dest: 'bundle.js',
    format: 'iife',
    sourceMap: 'inline',
    external: ['react', 'react-dom'],
    globals: {
        'react': 'React',
        'react-dom': 'ReactDOM'
    },
    plugins: [
        resolve({
            jsnext: true,
            browser: true,
            main: true,
            preferBuiltins: false
        }),
        commonjs({
            include: 'node_modules/**'
        })
    ]
};
```
