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
