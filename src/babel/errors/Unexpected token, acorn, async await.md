webpack 1 is using acorn 3.0(package.json). acorn starts supporting async from version 4.0.0.

In acorn 4.0 doc

Support for async/await syntax when ecmaVersion is >= 8.
webpack 2 is using acorn 4.0 and specifying ecmaVersion: 2017.

I think using webpack 2 is the right way to solve the problem.

https://github.com/babel/babel-preset-env/issues/66#issuecomment-266230687
