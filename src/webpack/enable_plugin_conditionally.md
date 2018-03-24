```javascript
    plugins: [
        new ExtractTextPlugin('styles.css'),
        (TARGET === 'build') && new webpack.optimize.UglifyJsPlugin({
            compress: {
                warnings: false
            },
            drop_console: true,
        }),
    ].filter(function(plugin) { return plugin !== false; })
```

https://stackoverflow.com/questions/36205819/webpack-how-can-we-conditionally-use-a-plugin/36215498#36215498