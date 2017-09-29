- https://webpack.js.org/plugins/extract-text-webpack-plugin/

## One css file

There will be one file `dist/style.css`.

```typescript
import * as webpack from 'webpack';
import * as path from 'path';
const ExtractTextPlugin = require('extract-text-webpack-plugin');

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
  module: {
    rules: [
      { test: /\.css$/,
        use: [ "style-loader", 'css-loader' ]
      },
      {
        test: /\.scss$/,
        use: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: ['css-loader', 'sass-loader'],
          publicPath: "/dist"
        })
      },
      {
        test: /\.tsx?$/,
        use: 'awesome-typescript-loader',
        exclude: /node_modules/
      }
    ]
  },
  resolve: {
    extensions: [ ".tsx", ".ts", ".js" ]
  },
  plugins: [
    new ExtractTextPlugin({
      filename: 'styles.css'
    }),
  ]
};

export default config;
```

## allChunks

In combination with the extract-text-webpack-plugin it’s possible to generate a native CSS output file.

With Code Splitting we can use two different modes:

- Create one css file per initial chunk (see Code Splitting) and embed stylesheets into additional chunks. (recommended)
- Create one css file per initial chunk which also contains styles from additional chunks.

The first mode is recommended because it’s optimal in regards to initial page loading time. In small apps with multiple entry points the second mode could be better because of HTTP request overheads and caching.

http://webpack.github.io/docs/stylesheets.html#separate-css-bundle

## extract at split points

- https://github.com/webpack-contrib/extract-text-webpack-plugin/issues/455
- https://stackoverflow.com/questions/42661898/extracting-one-css-file-per-webpack-chunk-require-ensure
- https://medium.com/@faceyspacey/45cb474cc332
- https://github.com/faceyspacey/webpack-flush-chunks
- https://github.com/faceyspacey/extract-css-chunks-webpack-plugin/issues/14#issuecomment-313799664
  - https://medium.com/faceyspacey/webpacks-import-will-soon-fetch-js-css-here-s-how-you-do-it-today-4eb5b4929852
    - https://medium.com/faceyspacey/announcing-react-universal-component-2-0-babel-plugin-universal-import-5702d59ec1f4

## Output CSS to different directory

```typescript
  plugins: [
    new ExtractTextPlugin('css/bootytwap4.css')
  ]
```

https://github.com/webpack/webpack/issues/1022#issuecomment-295988344

## Errors

### Module build failed: ReferenceError: window is not defined

Remove style-loader from ExtractTextPlugin.extract().use it should be on the fallback only

https://github.com/webpack-contrib/extract-text-webpack-plugin/issues/503#issuecomment-302228734

The #extract method should receive a loader that outputs css. What was happening was that it was receiving a style-loader which outputs javascript code, which is intended to be injected into a webpage. This code would try to access window.

You should not pass a loader string with style to #extract. However...if you set allChunks=false, then it will not build CSS files for non-initial chunks. Therefore it needs to know what loader to use to inject into the page.

https://stackoverflow.com/questions/28223040/window-not-defined-error-when-using-extract-text-webpack-plugin-react
