Add the following to `package.json`:

```
    "engines": {
    "node": ">=10.0.0",
    "npm": ">=6.0.0"
    },
```

Add the following to `.npmrc` (same directory as `package.json`):

```
engine-strict=true
```

- https://stackoverflow.com/questions/29349684/how-can-i-specify-the-required-node-js-version-in-package-json/50798589#50798589
