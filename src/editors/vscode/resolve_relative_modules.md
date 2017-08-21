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

## or with tilde to avoid amiguity

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

`webpack.config.js`:

```javascript
  resolve: {
    root: path.resolve(__dirname, './src'),
    extensions: ['', '.js', '.jsx', '.json']
  },
```

>So using the prefix ~ at the start of the path tells the Webpack loader to resolve the import "like a module". https://stackoverflow.com/questions/39535760/what-does-a-tilde-in-a-css-url-do

- https://github.com/Microsoft/vscode/issues/14907#issuecomment-266879216
- https://github.com/Microsoft/TypeScript/issues/9667
- Webstorm should support https://youtrack.jetbrains.com/issue/WEB-25321
- https://github.com/bholloway/omit-tilde-webpack-plugin
