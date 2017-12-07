.eslintrc:

```json
rules: {
  'import/no-extraneous-dependencies': [
      error,
      {
        devDependencies: [
          '.storybook/**',
          'stories/**' 
        ]
      }
    ]
}
```

https://github.com/storybooks/storybook/issues/1992#issuecomment-335001056