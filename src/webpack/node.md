```javascript
const path = require('path');
const nodeExternals = require('webpack-node-externals');

const webpackConfig = {
  entry: ['./app'], // file extension after index is optional for .js files
  output: {
    path: path.join(__dirname, '/'),
    filename: 'app.bundle.js'
  },
  devtool: 'source-map',
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: ['style-loader', 'css-loader', 'sass-loader']
      },
      { test: /\.css$/,
        use: [
          "style-loader",
          "css-loader"
        ]
      },
      {
        test: /.jsx?$/,
        use: [{
          loader: 'babel-loader',
          options: {
            presets: [
              ['env', {
                targets: {
                  node: ['8.4.0']
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
            ]
          }
        }],
      }
    ]
  },
  target: 'node',
  externals: [nodeExternals()],
  node: {
    __dirname: true
  },
};

module.exports = webpackConfig;
```

I had problem with uglifyjs on heroku:

```
remote:        ERROR in app.bundle.js from UglifyJs
remote:        Invalid assignment [app.bundle.js:359,76]
remote:        npm ERR! code ELIFECYCLE
remote:        npm ERR! errno 2
remote:        npm ERR! generator-umow@4.3.0 postinstall: `webpack --config webpack.config.backend.js`
remote:        npm ERR! Exit status 2
remote:        npm ERR!
remote:        npm ERR! Failed at the generator-umow@4.3.0 postinstall script.
remote:        npm ERR! This is probably not a problem with npm. There is likely additional logging output above.
remote:        
remote:        npm ERR! A complete log of this run can be found in:
remote:        npm ERR!     /app/.npm/_logs/2017-09-04T15_48_18_453Z-debug.log
```

Config that I used:

```javascript
if (PROD) {
  webpackConfig.plugins.push(
    new webpack.optimize.UglifyJsPlugin({
      compressor: {
        warnings: false,
      },
    })
  );
}
```
