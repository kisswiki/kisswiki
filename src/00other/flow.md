- http://dchambers.github.io/articles/redux-flow-tutorial/
- https://flowtype.org/blog/2016/07/01/New-Unions-Intersections.html
- http://facebook.github.io/jest/blog/2016/06/22/jest-13.html

> Flow doesn't support default values in destructuring right now: https://github.com/facebook/flow/issues/183
> -- https://github.com/facebook/flow/issues/2135#issuecomment-235697091

## flow vs typescript

flow_vs_typescript.md

## install

`create-react-app` has `babel` preset `react-app`, which already includes plugin `transform-flow-strip-types`,
the same as in https://www.npmjs.com/package/babel-preset-flow

https://flow.org/en/docs/install/

## types

- https://flow.org/en/docs/types/

## "Required module not found" when requiring a .scss file via Webpack

in .flowconfig

```
[options]
module.file_ext=.css
module.name_mapper.extension='css' -> 'empty/object'
module.file_ext=.scss
module.name_mapper.extension='scss' -> 'empty/object'
```

Could be shortened to `https://gist.github.com/lambdahands/d19e0da96285b749f0ef`

- https://gist.github.com/lambdahands/d19e0da96285b749f0ef
- https://github.com/facebook/flow/issues/338

## css modules

- https://gist.github.com/lambdahands/d19e0da96285b749f0ef
