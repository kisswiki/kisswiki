## format on save and eslint with prettier

https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode

```
  "editor.formatOnSave": true,
  "prettier.eslintIntegration": true
```

>prettier-eslint-code is: Please use the following package: prettier-vscode (ext install prettier-vscode). This package is deprecated and won't be maintained anymore.

https://hackernoon.com/configure-eslint-prettier-and-flow-in-vs-code-for-react-development-c9d95db07213


## without prettier

- https://stackoverflow.com/questions/41150726/vs-code-space-before-function-parentheses

So I have gotten around this issue a little bit by turning on:
`"eslint.autoFixOnSave": true`

https://github.com/Microsoft/TypeScript/issues/12234#issuecomment-266077638

## overwrite rules

https://stackoverflow.com/questions/35737094/how-to-configure-the-eslint-extension-in-vscode

## jsx

```jsx
<a href='https://flexport.com'
  // eslint-disable-next-line react/jsx-no-target-blank
  target='_blank'>foo</a>
```

https://github.com/eslint/eslint/issues/7030#issuecomment-243973102
