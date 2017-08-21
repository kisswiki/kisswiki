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

`import {prevStep, nextStep} from '~/js/actions/index.js';`

`jsonfig.json`:

```
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

```
  resolve: {
    root: path.resolve('src'),
    extensions: ['', '.js', '.jsx', '.json']
  },
```
