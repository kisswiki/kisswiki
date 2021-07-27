1. Install https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-typescript-tslint-plugin
2. In project root directory: `mkdir -p .vscode/ && code .vscode/settings.json`
3. Content of `settings.json`:

```json
{
  "[typescript]": {
    "editor.defaultFormatter": "vscode.typescript-language-features",
    "editor.codeActionsOnSave": {
      "source.fixAll.tslint": true
    }
  }
}
```

- https://github.com/microsoft/vscode/issues/67482
