`alt+c` was binded to `gitlens.showQuickCommitFileDetails` and I could not type `ć`.

Solution:

Go to `Preferences > Default Keybindings > Shift+Cmd+O > type 'alt+c' to find command

https://code.visualstudio.com/docs/getstarted/keybindings

Then go to `Preferences > Keyboard Shortcuts`, find command, i.e. showQuickCommitFileDetails and click edit icon, change shortcut. You will get something like that in `keybindings.json`:

```json
[
    {
        "key": "alt+cmd+c",
        "command": "gitlens.showQuickCommitFileDetails",
        "when": "editorTextFocus && gitlens:enabled"
    },
    {
        "key": "alt+c",
        "command": "-gitlens.showQuickCommitFileDetails",
        "when": "editorTextFocus && gitlens:enabled"
    }
]
```

- https://github.com/redhat-developer/vscode-java/issues/348
- https://github.com/Microsoft/vscode/issues/14241
- https://github.com/Microsoft/vscode/issues/9205