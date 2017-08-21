`npm i -D babel-eslint eslint-import-resolver-webpack`

.eslintrc

```json
{
  "parser": "babel-eslint",
  "rules": {
    "strict": 0,
  },
  "extends": ["eslint:recommended", "plugin:react/recommended"],
  "settings": {
    "import/resolver": "webpack"
  }
}
```

`.eslintrc` and `webpack.config.js` should be on the same level. Couldn't get it working with `.eslintrc.js` and `path` like here https://github.com/benmosher/eslint-plugin-import/issues/352#issuecomment-236821515

No need for:

```json
"parserOptions": {
"ecmaVersion": 6,
"sourceType": "module",
"ecmaFeatures": {
    "jsx": true
}
```


- https://github.com/yannickcr/eslint-plugin-react/issues/447#issuecomment-317688181
- https://stackoverflow.com/questions/36002226/parsin-error-the-keyword-import-is-reserved-sublimelinter-contrib-eslint/41190209#41190209
- https://stackoverflow.com/questions/38844405/webpack-eslint-loader-issues-when-resolving-paths
