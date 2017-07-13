>The error message comes from the JS support in VS Code (see [js] in the error message). ESlint errors are prefixed with [eslint].

create a [jsconfig.json file](https://code.visualstudio.com/Docs/languages/javascript#_javascript-project-jsconfigjson) at the root of your project with the contents:

```json
{
  "compilerOptions": {
      "experimentalDecorators": true
  }
}
```

https://github.com/Microsoft/vscode/issues/28097
