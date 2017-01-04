## Connect vs Express

> Express 4 no longer depends on Connect, and removes all built-in middleware from its core, except for the express.static function. This means that Express is now an independent routing and middleware web framework, and Express versioning and releases are not affected by middleware updates.
> - https://expressjs.com/en/guide/migrating-4.html

> ExpressJS and connect are parallel projects. Connect is just a middleware framework, with a nice use function. Express does not depend on Connect
> - http://stackoverflow.com/questions/5284340/what-is-node-js-connect-express-and-middleware

- http://stackoverflow.com/questions/5284340/what-is-node-js-connect-express-and-middleware
- https://github.com/atlantanodejs/site-app/wiki/Connect-vs-Express
- https://github.com/senchalabs/connect

## Rewrite URL

> Placing this middleware after the static middleware will have no effect other than rewriting req.url for subsequent middlewares
> - https://ninja.sg/spa-router-fallback/

> use a rewrite middleware that is inserted prior to app.use(express.static(..))
> - http://stackoverflow.com/a/22968287

- https://github.com/tinganho/connect-modrewrite
- https://github.com/bripkens/connect-history-api-fallback
- https://github.com/joehewitt/express-rewrite
- https://github.com/kapouer/express-urlrewrite

## Live reload

- https://github.com/intesso/connect-livereload
- http://stackoverflow.com/questions/31022819/using-connect-livereload-in-an-express-node-app
- https://github.com/napcs/node-livereload

## To sort

- http://stackoverflow.com/questions/21602540/how-to-support-virtual-directories-on-nodejs-connect-module
- http://stackoverflow.com/questions/16579404/url-rewriting-with-expressjs
- http://stackoverflow.com/questions/29035684/how-do-i-do-url-rewriting-in-express-js-4
- http://stackoverflow.com/questions/13446030/rewrite-url-path-using-node-js
- http://stackoverflow.com/questions/21242817/connect-modrewrite-to-rewrite-url
- http://stackoverflow.com/questions/36098136/nodejs-express-url-rewrite
- http://stackoverflow.com/questions/17080494/using-grunt-server-how-can-i-redirect-all-requests-to-root-url
- Allow serving one file for all urls (single page app mode) https://github.com/BrowserSync/browser-sync/issues/204#issuecomment-60410751
- http://stackoverflow.com/questions/24586568/node-js-connect-modrewrite-combined-with-express
- http://stackoverflow.com/questions/10865480/mod-rewrite-to-index-html-breaks-relative-paths-for-deep-urls
- http://stackoverflow.com/questions/24474914/can-i-tell-browser-sync-to-always-use-one-html-file-for-html5mode-links
- https://blog.avisi.nl/2014/04/10/why-you-should-use-browsersync/
- https://github.com/gulpjs/gulp/blob/master/docs/recipes/server-with-livereload-and-css-injection.md
- http://stackoverflow.com/questions/24100357/html-reloading-using-browsersync-in-gulp
- https://github.com/Va1/browser-sync-webpack-plugin
- Incorrect image paths https://github.com/gruntjs/grunt-contrib-cssmin/issues/35
- http://stackoverflow.com/questions/30373218/handling-relative-urls-in-a-node-js-http-server
- http://stackoverflow.com/questions/21529979/gulp-js-rewrite-urls-embedded-in-css-while-concatenating


http://stackoverflow.com/questions/23665993/gulp-js-livereload-with-express-server

```
//gulpfile.js:
var gulp = require('gulp');
var nodemon = require('gulp-nodemon');
var server = require('gulp-express');
var lr = require('tiny-lr')();

gulp.task('default', function () {
    nodemon({
      script: 'server.js'
    })
    .on('restart', function () {
        console.log('restarted!')
    });

    lr.listen(35729);

    gulp.watch('server/**/*', function(){
      var fileName = require('path').relative('3000', event.path);
      lr.changed({
        body: {
          files: [fileName]
        }
      });
    });
});
```
