https://webpack.js.org/guides/migrating/

## Update npm package

Change every `webpack*` in `package.json` to `*`. Then:

`npm update webpack`

https://stackoverflow.com/questions/16073603/how-do-i-update-each-dependency-in-package-json-to-the-latest-version/36892853#36892853

## Unexpected token, acorn

Look at `Unexpected token, acorn, async await.md`;

## configuration.resolve.extensions[0] should not be empty

Change this:

`extensions: ['', 'js', 'ts']`

to this:

`extensions: ['*', 'js', 'ts']`

- https://github.com/webpack/webpack/issues/3043#issuecomment-249314455
- https://stackoverflow.com/questions/42068939/webpack-2-cannot-resolve-empty-extensions

## options/query provided without loader (use loader + options)

You need to edit your config because Webpack 2 has changed its schema for declaring loaders.

Refactor this part:

```json
{
    test: /\.html$/,
    exclude: /node_modules/,
    use: 'file-loader',
    query: {
      name: '[name].[ext]',
    },
},
```
to this:

```json
{
    test: /\.html$/,
    exclude: /node_modules/,
    use: [
        {
            loader: 'file-loader',
            query: {
                name: '[name].[ext]'
            }
        }
    ]
},
```

- https://github.com/webpack/webpack/issues/3645#issuecomment-269765612
- https://stackoverflow.com/questions/41393146/error-options-query-provided-without-loader-webpack-2-2-0-rc-3
