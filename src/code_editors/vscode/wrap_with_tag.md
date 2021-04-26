To get the exact command for emmet: `Cmd+P > type: emmet wrap > click gear icon > click + icon or press Enter`

Now to open `kebindings.json`: `Cmd+P > type: open key json > select: Open Keyboard Shorcuts (JSON)`

```json
{
  "key": "alt+w",
  "command": "editor.emmet.action.wrapWithAbbreviation",
  "when": "editorHasSelection && editorTextFocus"
}
```

https://stackoverflow.com/questions/40155875/how-to-do-tag-wrapping-in-vs-code/48999397#48999397
