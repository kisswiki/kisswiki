>The error message comes from the JS support in VS Code (see [js] in the error message). ESlint errors are prefixed with [eslint].

create a [jsconfig.json file](https://code.visualstudio.com/Docs/languages/javascript#_javascript-project-jsconfigjson) at the root of your project with the contents:

```json
{
  "compilerOptions": {
      "experimentalDecorators": true
  },
  "exclude": [
      "backend/node_modules",
      "frontend/node_modules"
  ]
}
```

- https://github.com/Microsoft/vscode/issues/28097
- https://stackoverflow.com/questions/29953293/is-there-a-way-to-turn-on-es6-es7-syntax-support-in-vscode
- To enable project-wide JavaScript/TypeScript language features, exclude large folders with source files that you do not work on. https://github.com/Microsoft/vscode/issues/9594
  - https://stackoverflow.com/questions/29953293/is-there-a-way-to-turn-on-es6-es7-syntax-support-in-vscode/36858407#36858407
