## connect-livereload

>connect-livereload only inserts the script into the html (so that you don't need a browser plugin).
>
>you still need a separate livereload server, try node-livereload 
>
>-- http://stackoverflow.com/questions/31022819/using-connect-livereload-in-an-express-node-app

connect-livereload didn't work for me with express routes. Only for `/`.

So I have to use this:

```javascript
if(process.env.NODE_ENV == 'development') {

  var toReplace = `
<script>
  document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] +
  ':35729/livereload.js?snipver=1"></' + 'script>')
</script>
`

  app.use(function (req, res, next) {
    var write = res.write;
    res.write = function (chunk) {
      if (~res.getHeader('Content-Type').indexOf('text/html')) {
        chunk instanceof Buffer && (chunk = chunk.toString());
        chunk = chunk.replace(/(<\/body>)/, toReplace + "$1");
        res.setHeader('Content-Length', chunk.length);
      }
      write.apply(this, arguments);
    };
    next();
  });
}
```

http://stackoverflow.com/questions/9896628/connect-or-express-middleware-to-modify-the-response-body/33881887#33881887

## browser-sync

>It's different than browsersync in that it isn't ridiculously huge. browser-sync has about 252 dependencies in its tree, and requires you to compile fsevents, bufferutil, and utf-8-validate.
>
>It is different from live-reload in that for live-reload you need to add a browser extension or a snippet of code to your html pages, which you don't need to in live-server.
>
>-- https://github.com/tapio/live-server/issues/100#issuecomment-198150493
