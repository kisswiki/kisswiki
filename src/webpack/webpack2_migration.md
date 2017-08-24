https://webpack.js.org/guides/migrating/

## Update npm package

Change every `webpack*` in `package.json` to `*`. Then:

`npm update webpack`

https://stackoverflow.com/questions/16073603/how-do-i-update-each-dependency-in-package-json-to-the-latest-version/36892853#36892853

## Unexpected token, acorn

webpack 1 is using acorn 3.0(package.json). acorn starts supporting async from version 4.0.0.

In acorn 4.0 doc

Support for async/await syntax when ecmaVersion is >= 8.
webpack 2 is using acorn 4.0 and specifying ecmaVersion: 2017.

I think using webpack 2 is the right way to solve the problem.

https://github.com/babel/babel-preset-env/issues/66#issuecomment-266230687
