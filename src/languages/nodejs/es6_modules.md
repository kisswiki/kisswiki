- counter-proposal that present an alternative approach of declaring all files with ES6 modules in package.json https://github.com/dherman/defense-of-dot-js/blob/master/proposal.md
  - https://stackoverflow.com/questions/36901147/es2015-import-not-working-in-node-v6-0-0-with-with-harmony-modules-option/36925525#36925525
- https://github.com/babel/example-node-server
  - https://stackoverflow.com/questions/39436322/node-js-syntaxerror-unexpected-token-import
- https://medium.com/the-node-js-collection/an-update-on-es6-modules-in-node-js-42c958b890c
  - https://stackoverflow.com/questions/37132031/nodejs-plans-to-support-import-export-es6-es2015-modules
- https://medium.com/dev-channel/es6-modules-in-chrome-canary-m60-ba588dfb8ab7
- http://2ality.com/2017/05/es-module-specifiers.html
- why mjs extension http://2ality.com/2017/05/es-module-specifiers.html

## Checklist

- Convert all Node files to use the `.mjs` extension
- Change all `require()` and `module.exports` statements to `import` and `export` statements, respectively
- Run any Node files/applications using these modules under the `--experimental-modules` flag

- https://dev.to/geoff/import-local-json-in-nodejs-v85-experimental-modules
- http://2ality.com/2017/09/native-esm-node.html
## Unexpected token import

In Node 9, it is enabled behind a flag, and uses the .mjs extension.

`node --experimental-modules my-app.mjs`

https://stackoverflow.com/questions/39436322/node-js-syntaxerror-unexpected-token-import

## SyntaxError: The requested module does not provide an export named

I starts working if I do the destructuring after the import instead:

```javascript
import redux from "redux";
const { createStore } = redux;
```

https://github.com/reactjs/redux/issues/2614

## import json

```javascript
const require = (filepath, encoding = "utf8") =>
    JSON.parse(fs.readFileSync(filepath, { encoding }));

const { version } = require('./package.json');
```

https://dev.to/geoff/import-local-json-in-nodejs-v85-experimental-modules

## __dirname

`import.meta` is not supported as of latest node-9.10.1 https://github.com/nodejs/node/blob/v9.10.1/doc/api/esm.md

Also no such test https://github.com/nodejs/node/blob/master/test/es-module/test-esm-import-meta.mjs in 9.10.1.

Use this:

expose.js

```javascript
module.exports = {__dirname};
```

use.mjs

```javascript
import expose from './expose.js';
const {__dirname} = expose;
```

- https://stackoverflow.com/questions/46745014/alternative-for-dirname-in-node-when-using-the-experimental-modules-flag/46745166#46745166
- https://esdiscuss.org/topic/nodejss-filename-dirname-in-es6-modules
- https://blog.risingstack.com/whats-new-in-node-js-8-5/

## The Rules

### The Rules of ES Modules

- A file is ESM if and only if the extension is “mjs”
- A file is CJS if and only if the extension is “js”
- Only ESM is allowed to use export/import statements
- Only CJS is allowed to use import CJS using require

### The Rules of Interoperability

- CJS can import ESM, but only using await import()
- ESM can import CJS using the import statement, but only a default import

### The Rules of Migration

- require-ing a file with no extension resolves to a .js file.
- Importing a file with no extension resolves first to a .mjs file, and only if not found, to a .js file.
- Resolving bare imports is the same in CJS and MJS, except for which extension is used.

https://medium.com/@giltayar/native-es-modules-in-nodejs-status-and-future-directions-part-i-ee5ea3001f71