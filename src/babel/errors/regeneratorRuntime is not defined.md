purpose of the preset is to support environments provided in targets. If you will change your browsers query to "last 2 Chrome versions", you can see that regeneratorRuntime is not present in your target file, so require("babel-polyfill") call is dispensable.

https://github.com/babel/babel-preset-env/issues/112
