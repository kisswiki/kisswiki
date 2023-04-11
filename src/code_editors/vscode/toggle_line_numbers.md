Using [Settings Cycler](https://marketplace.visualstudio.com/items?itemName=hoovercj.vscode-settings-cycler), you can set this up manually by putting

```json
"settings.cycle": [{
        "id": "lineNumbers",
        "values":[
            {
                "editor.lineNumbers": "off",
                "editor.folding": false,
                "editor.glyphMargin": false
            },
            {
                "editor.lineNumbers": "on",
                "editor.folding": true,
                "editor.glyphMargin": true

            }
        ]
    }],
```

in your settings.json (Ctrl+,) file, and

```json
{
  "key": "ctrl+l",
  "command": "settings.cycle.lineNumbers",
  "when": "editorFocus"
}
```

https://github.com/Microsoft/vscode/issues/52735#issuecomment-399714565
