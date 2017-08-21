webpack 2 removed everything but modules as a way to resolve paths. This means root will not work.

https://gist.github.com/sokra/27b24881210b56bbaff7#resolving-options

The example configuration starts with:

```json
{
  modules: [path.resolve(__dirname, "app"), "node_modules"]
  // (was split into `root`, `modulesDirectories` and `fallback` in the old options)
}
```

modulesDirectories is still used by webpack-dev-server, even with webpack 2, which makes this very confusing

- https://stackoverflow.com/questions/27502608/resolving-require-paths-with-webpack/36574982#36574982
- http://moduscreate.com/es6-es2015-import-no-relative-path-webpack/

## Alternative is to alias `~`:

```
  resolve: {
    alias:{
      '~': path.resolve( __dirname, 'src' )
    },
    extensions: ['', '.js', '.jsx', '.json']
  },
```

- https://stackoverflow.com/questions/27502608/resolving-require-paths-with-webpack/36574982#comment60353452_35047907
