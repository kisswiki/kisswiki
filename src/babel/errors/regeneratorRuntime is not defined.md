purpose of the preset is to support environments provided in targets. If you will change your browsers query to "last 2 Chrome versions", you can see that regeneratorRuntime is not present in your target file, so require("babel-polyfill") call is dispensable.

- https://github.com/babel/babel-preset-env/issues/112#issuecomment-269762964
- https://stackoverflow.com/questions/33527653/babel-6-regeneratorruntime-is-not-defined
- https://stackoverflow.com/questions/33641593/babel-6-async-await-unexpected-token/35758396
- https://stackoverflow.com/questions/35816634/unexpected-token-while-using-async-await-with-babel
