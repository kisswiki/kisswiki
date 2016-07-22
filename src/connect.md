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
