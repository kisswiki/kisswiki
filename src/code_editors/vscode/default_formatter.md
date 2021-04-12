Look at https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode

`ctrl-shift-p > search "open json"`

Add

```json
{
  "editor.defaultFormatter": null,
  "[javascriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

- https://stackoverflow.com/questions/49640469/how-do-you-determine-which-formatter-is-being-used-for-vs-code/67059875#67059875
