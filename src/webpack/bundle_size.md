```
npm install --save-dev webpack-bundle-analyzer
npx webpack --profile --json > stats.json
npx webpack-bundle-analyzer --help
```

- https://github.com/th0r/webpack-bundle-analyzer
- or this https://github.com/chrisbateman/webpack-visualizer
- https://medium.com/@mrbar42/how-i-reduced-the-size-of-my-webpack-bundle-by-1000-f4d74894c2e5
- https://github.com/babel/babel-preset-env#targetsuglify
- What is the best way to include babel polyfill using multiple entry points #122 https://github.com/babel/babel-loader/issues/122
- 'useBuiltIns' option force to import 'regenerator-runtime' #221 https://github.com/babel/babel-preset-env/issues/221

## transform-runtime

webpack.config.js

```
      {
        cacheDirectory: env.isDev,
        presets: [
          'react',
          ['env', {
            debug: true,
            modules: false, // Using webpack 2
            targets: {
              // browserlist var is shared with autoprefixer
              browsers: browserlist,
            },
            exclude: [
              // Leave regenerator to transform-runtime
              'transform-regenerator',
            ], 
          }],
        ],
        plugins: compact([
          'lodash',
          'transform-decorators-legacy',
          'transform-class-properties',
          'transform-export-extensions',
          'transform-object-rest-spread',
          env.isProduction && 'transform-react-remove-prop-types',
          env.isProduction && 'transform-react-constant-elements',
          env.isProduction && 'transform-react-inline-elements',
          env.isProduction && 'transform-dev-warning',
          ['transform-runtime', {
            // Don't use regenerator in dev builds. Hard to debug.
            regenerator: env.isProduction,
          }],
          env.isDev && 'react-hot-loader/babel',
          env.isDev && 'transform-react-jsx-self',
          env.isDev && 'transform-react-jsx-source',
        ]),
      }
```
      {
        cacheDirectory: env.isDev,
        presets: [
          'react',
          ['env', {
            debug: true,
            modules: false, // Using webpack 2
            targets: {
              // browserlist var is shared with autoprefixer
              browsers: browserlist,
            },
            exclude: [
              // Leave regenerator to transform-runtime
              'transform-regenerator',
            ], 
          }],
        ],
        plugins: compact([
          'lodash',
          'transform-decorators-legacy',
          'transform-class-properties',
          'transform-export-extensions',
          'transform-object-rest-spread',
          env.isProduction && 'transform-react-remove-prop-types',
          env.isProduction && 'transform-react-constant-elements',
          env.isProduction && 'transform-react-inline-elements',
          env.isProduction && 'transform-dev-warning',
          ['transform-runtime', {
            // Don't use regenerator in dev builds. Hard to debug.
            regenerator: env.isProduction,
          }],
          env.isDev && 'react-hot-loader/babel',
          env.isDev && 'transform-react-jsx-self',
          env.isDev && 'transform-react-jsx-source',
        ]),
      }
```

https://github.com/babel/babel-preset-env/issues/84#issuecomment-283679677

- Instance methods such as "foobar".includes("foo") will not work since that would require modification of existing built-ins (Use babel-polyfill for 
that). https://github.com/babel/babel/tree/master/packages/babel-plugin-transform-runtime
- transform-runtime is a separate Babel plugin. It transforms ES6/7/next calls to babel-polyfill libraries. You can disable some of this features using it's own configuration. https://github.com/babel/babel-preset-env/issues/84#issuecomment-285121863
