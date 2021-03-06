## vscode - resolve relative modules

jsconfig.json

```json
{
  "compilerOptions": {
      "baseUrl": "frontend/src"
  }
}
```

https://github.com/Microsoft/TypeScript/issues/9667#issuecomment-232496336

## or with tilde to avoid amibiguity

```javascript
import {prevStep, nextStep} from '~/js/actions/index.js';
```

`jsonfig.json`:

```json
{
  "compilerOptions": {
    "experimentalDecorators": true,
    "baseUrl": "./",  // all paths are relative to the baseUrl
    "paths": {
        "~/*" : ["*"]   // resolve any `~/foo/bar` to `<baseUrl>/foo/bar`
    }
  },
  "exclude": [
      "node_modules"
  ]
}
```

for webpack >=2, in `webpack.config.js` (look at `resolve_relative.md`):

```javascript
  resolve: {
    alias:{
      '~': path.resolve( __dirname, 'src' )
    },
    extensions: ['*', '.js', '.jsx', '.json']
  },
```

For eslint look at `eslint the keyword import is reserved.md`.

>So using the prefix ~ at the start of the path tells the Webpack loader to resolve the import "like a module". https://stackoverflow.com/questions/39535760/what-does-a-tilde-in-a-css-url-do

- https://github.com/Microsoft/vscode/issues/14907#issuecomment-266879216
- https://github.com/Microsoft/TypeScript/issues/9667
- Webstorm should support https://youtrack.jetbrains.com/issue/WEB-25321
- https://github.com/bholloway/omit-tilde-webpack-plugin
