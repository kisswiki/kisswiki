## Connect vs Express

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
- https://github.com/kapouer/express-urlrewrite

## Live reload
