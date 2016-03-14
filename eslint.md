## Presets

- https://github.com/airbnb/javascript/blob/master/linters/.eslintrc
- https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb

## Ignore

ESLint ignores node_modules by default https://github.com/eslint/eslint/issues/3788#issuecomment-140232261

https://github.com/eslint/eslint/blob/master/.eslintignore

## fix indent

Looks like indent's auto-fix only knows how to remove or add indent characters. It doesn't seem to detect that, for example, if tabs are expected but a file has spaces, then the whole space range should be replaced with the whole expected tab range. https://github.com/eslint/eslint/issues/4274
