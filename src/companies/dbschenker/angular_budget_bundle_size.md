Increase budget https://stackoverflow.com/questions/53995948/warning-in-budgets-maximum-exceeded-for-initial

## Analyze bundle size

```shell
npm i -D webpack-bundle-analyzer
npx ng build --stats-json
npx webpack-bundle-analyzer dist/my-project-name/stats.json
```

- https://blog.bitsrc.io/6-tools-and-techniques-to-analyze-webpack-bundle-size-817337f8cf91
- https://stackoverflow.com/a/58538445/588759
