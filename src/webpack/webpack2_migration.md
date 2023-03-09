- https://webpack.js.org/guides/migrating/
- https://medium.com/@u_glow/things-i-learned-while-upgrading-to-webpack-2-418b99965cbf

## yarn

`yarn upgrade-interactive`

and select `webpack` and all `*-loader`. Might not present everything. In that case upgrade one-by-one:

`yarn upgrade url-loader`

## add -loader

like:
- `loader: 'babel'` -> `'babel-loader'`,
- `loader: 'url?limit=10000'` -> `loader: 'url-loader', options: { limit: 10000 }`

## url-loader

`name` option isn't in documentation, because probably it will be passed to `file-loader`.

## Can't resolve

add `'node_modules'` to `resolve`:

```
  resolve: {
    modules: [project.paths.client(), 'node_modules'],
    extensions: ['*', '.js', '.jsx', '.json'],
  },
```

- https://github.com/webpack/webpack/issues/3397#issuecomment-330082803

## exclue can't be null

`exclude should be one of these ...`

## options.includePaths.push is not a function

`includePaths: project.paths.client('styles'),`

change to

`includePaths: [project.paths.client('styles')],`

## PostCSS Loader Previous source map found, but options.sourceMap isn't set

No need to use css-loader when there is postcss-loader?

## relative paths to fonts in sass/scss

I fixed this by adding two more loader before sass-loader:

`'css-loader', 'resolve-url-loader', 'sass-loader'`

- https://github.com/webpack-contrib/sass-loader/issues/409#issuecomment-287114705
- https://github.com/webpack-contrib/sass-loader#problems-with-url
- https://github.com/webpack-contrib/url-loader/issues/61#issuecomment-330098540

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

## recommended to use options instead of query

- https://medium.com/@u_glow/things-i-learned-while-upgrading-to-webpack-2-418b99965cbf
- https://github.com/webpack-contrib/extract-text-webpack-plugin/issues/353

## Stop Babel from compiling ES2015 modules

```
// before
"presets": ["es2015"]

// after
"presets": [
  ["es2015", { "modules": false }]
]
```

For babel-preset-env:

```
      {
        test: /.jsx?$/,
        exclude: /node_modules/,
        use: [{
          loader: 'babel-loader',
          options: {
            presets: [
              ['env', {
                targets: {
                  browsers: ['last 2 Chrome versions']
                },
                "modules": false,
              }],
              'react',
            ],
            plugins: [
              ['transform-object-rest-spread',
                {
                  useBuiltIns: true
                }
              ],
              'react-html-attrs',
            ]
          }
        }],
      },
```
