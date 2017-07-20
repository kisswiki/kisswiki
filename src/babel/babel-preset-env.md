# babel-preset-env

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

- useBuiltIns: figure out how to remove polyfills that aren't actually used in the codebase #84 https://github.com/babel/babel-preset-env/issues/84#issuecomment-283679677
- transform-runtime is a separate Babel plugin. It transforms ES6/7/next calls to babel-polyfill libraries. You can disable some of this features using it's own configuration. https://github.com/babel/babel-preset-env/issues/84#issuecomment-285121863
- Instance methods such as "foobar".includes("foo") will not work since that would require modification of existing built-ins (Use babel-polyfill for 
that). https://github.com/babel/babel/tree/master/packages/babel-plugin-transform-runtime
- Discussion: useBuiltIns (usage only, not "entry" point method) #284 https://github.com/babel/babel-preset-env/issues/284
- https://github.com/babel/babel-preset-env#targetsuglify
- What is the best way to include babel polyfill using multiple entry points #122 https://github.com/babel/babel-loader/issues/122
- ['useBuiltIns' option force to import 'regenerator-runtime' #221[(https://github.com/babel/babel-preset-env/issues/221)

## deps

Nope. Some libraries have hard polyfills dependencies, for example, Promise. But almost all already compiled to ES5. Running babel on dependencies is a bad practice and most likely it will break something, makes sense only static analysis for getting a list of required polyfills.

## useBuiltIns

Need to account for 3rd party modules that require a polyfill if Babel doesn't run over them, and type info would help with instance methods

Would also be cool if it could check it was already loaded by another script. Currently errors on IE. Was testing 2 scripts loading on the same page and it errors. Need to keep them separate so a runtime check would help

https://twitter.com/left_pad/status/847911365645938690

new idea:

Make this the default behavior in 2.0 (useBuiltIns: true) which is "aggressive" in removing polyfills that aren't used in the files. Another option would be the current useBuiltIns which only removes polyfills already available in the environment. And lastly useBuiltIns: false which doesn't do anything.

https://github.com/babel/babel-preset-env/pull/241#issuecomment-291582622
