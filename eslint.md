## Presets

- https://github.com/airbnb/javascript/blob/master/linters/.eslintrc
- https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb

Shareable configs are simply npm packages that export a configuration object. To start, create a Node.js module like you normally would. Make sure the module name begins with eslint-config-, such as eslint-config-myconfig. Create a new index.js file and export an object containing your settings.

You can also omit the eslint-config- and it will be automatically assumed by ESLint.

http://eslint.org/docs/developer-guide/shareable-configs

Disable rules from preset:

```
{
  'extends': 'airbnb',
  'rules': {
    'indent': [2, 'tab', { 'SwitchCase': 1, 'VariableDeclarator': 1 }],
    'react/prop-types': 0,
    'react/jsx-indent-props': [2, 'tab'],
  }
}
```

http://stackoverflow.com/questions/27732209/turning-off-eslint-rule-for-a-specific-line

## Ignore

ESLint ignores node_modules by default https://github.com/eslint/eslint/issues/3788#issuecomment-140232261

https://github.com/eslint/eslint/blob/master/.eslintignore

http://stackoverflow.com/questions/32184532/eslintignore-not-working-in-sibling-directory

## fix indent

Looks like indent's auto-fix only knows how to remove or add indent characters. It doesn't seem to detect that, for example, if tabs are expected but a file has spaces, then the whole space range should be replaced with the whole expected tab range. https://github.com/eslint/eslint/issues/4274

## React

http://stackoverflow.com/questions/30294870/how-to-config-eslint-for-react-on-atom-editor
