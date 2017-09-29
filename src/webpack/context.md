
https://webpack.js.org/configuration/entry-context/#context

for example context can be `src`, like in above:

webpack.config.ts

```typescript
import * as webpack from 'webpack';
import * as path from 'path';

const HtmlWebpackPlugin = require('html-webpack-plugin');

interface Config extends webpack.Configuration {
  resolve: webpack.NewResolve,
  module: {
    rules: webpack.NewUseRule[]
  }
}

const sourcePath = path.join(__dirname, './src');

const config: webpack.Configuration = {
  context: sourcePath,
  entry: './index.tsx',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: 'index.html'
    })
  ]
};

export default config;
```
