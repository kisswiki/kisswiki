## vscode in suggestion list for one characters places upper case letter as first entry

Workaround: `"editor.snippetSuggestions": "top",` in settings https://stackoverflow.com/questions/58892183/how-to-make-snippet-suggestion-case-sensitive-in-vscode#comment104050578_58892183

- [Single-char-prefix snippet suggestion is not case sensitive · Issue #139796 · microsoft/vscode](https://github.com/microsoft/vscode/issues/139796)
- [Make snippet selection case sensitive · Issue #8070 · microsoft/vscode](https://github.com/microsoft/vscode/issues/8070)
- [suggestion score - allow first character to be a weak match · Issue #53715 · microsoft/vscode](https://github.com/microsoft/vscode/issues/53715)
- [Single-char-prefix snippet suggestion is not case sensitive · Issue #139796 · microsoft/vscode](https://github.com/microsoft/vscode/issues/139796)

## log current variable

Install https://marketplace.visualstudio.com/items?itemName=geddski.macros

open settings.json

```
  "macros": {
    "logCurrentVariable": [
      "editor.action.addSelectionToNextFindMatch",
      "problems.action.copy",
      "editor.action.clipboardCopyAction",
      {
        "command": "editor.action.insertSnippet",
        "when": "editorTextFocus",
        "args": {
          "snippet": "console.log('==== $CURRENT_HOUR:$CURRENT_MINUTE:$CURRENT_SECOND $TM_FILENAME $CLIPBOARD', $CLIPBOARD);$0"
        }
      }
    ]
  }
```

open keybindings.json

```json
{
  "key": "ctrl+shift+;",
  "command": "macros.logCurrentVariable"
}
```

https://stackoverflow.com/questions/44826623/vs-code-snippet-to-console-log-selection-beneath-current-line/72831527#72831527
