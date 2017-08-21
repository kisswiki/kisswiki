`npm i -D babel-eslint`

.eslintrc

```json
{
  "parser": "babel-eslint",
  "rules": {
    "strict": 0
  }
}
```

No need for 

- https://github.com/yannickcr/eslint-plugin-react/issues/447#issuecomment-317688181
- https://stackoverflow.com/questions/36002226/parsin-error-the-keyword-import-is-reserved-sublimelinter-contrib-eslint/41190209#41190209
- https://stackoverflow.com/questions/38844405/webpack-eslint-loader-issues-when-resolving-paths
