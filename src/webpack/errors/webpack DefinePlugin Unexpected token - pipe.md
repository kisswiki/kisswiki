webpack DefinePlugin Unexpected token |

When used like this

```javascript
    new webpack.DefinePlugin({
      'process.env': process.env
    })
```

Have to use it like this:

```javascript
    new webpack.DefinePlugin({
      'NODE_ENV': process.env.NODE_ENV
    })
```

- Maybe related https://github.com/webpack/webpack/issues/4000
