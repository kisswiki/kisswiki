- [From Require.js & Grunt to Webpack. Heres how](https://blog.serverdensity.com/the-journey-to-webpack/)
- http://www.2ality.com/2015/12/webpack-tree-shaking.html
- http://www.2ality.com/2015/04/webpack-es6.html
- http://www.zsoltnagy.eu/using-es6-modules-with-webpack/
- https://www.twilio.com/blog/2015/08/setting-up-react-for-es6-with-webpack-and-babel-2.html
- https://medium.com/webpack/webpack-http-2-7083ec3f3ce6#.ubovetdbx

## speed https://www.facebook.com/groups/217169631654737/permalink/1006902786014747/

- sprawdź czy w babelu masz cacheDirectory: true
- excluduj/includuj tylko potrzebne foldery. Czyli co najmniej miej exclude: /(node_modules|bower)/
- bez sensu aby webpack niepotrzebnie parsował niezbudowane node'owe biblioteki. Uzyj 'noParse' (aby webpack nie szukał np. 'require' w kodzie biblioteki) w kombinacji z 'resolve' (aby wskazać na już dystrybucyjny plik a nie tez z package.json -> main
- użyj szybszych source-map przy developemencie - devtool: 'cheap-module-inline-source-map'
- używaj watch w webpacku

## HTML Webpack Plugin

This is a webpack plugin that simplifies creation of HTML files to serve your webpack bundles. This is especially useful for webpack bundles that include a hash in the filename which changes every compilation. You can either let the plugin generate an HTML file for you, supply your own template using lodash templates or use your own loader.

- https://github.com/ampedandwired/html-webpack-plugin
- example https://github.com/MichalZalecki/connect-rxjs-to-react/blob/master/webpack/webpack.config.js
- http://www.jonathan-petitcolas.com/2016/01/23/webpack-html-plugin-in-a-nutshell.html
- http://stackoverflow.com/questions/34620628/htmlwebpackplugin-injects-relative-path-files-which-breaks-when-loading-non-root
- https://github.com/jaketrent/html-webpack-template
