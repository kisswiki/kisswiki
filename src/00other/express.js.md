## Routing

Static + catch all

```javascript
var express = require('express');

var server = express();
server.use('/public', express.static(__dirname + '/public'));

server.get('/*', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

var port = 8000;
server.listen(port, function() {
  console.log('server listening on port ' + port);
});
```

http://stackoverflow.com/questions/26349497/node-express-with-static-html-how-to-route-all-requests-to-index-html/26638143#26638143

## No default engine was specified and no extension was provided

The res.render stuff will throw an error, if you're not using a view engine.

If you just want to serve json replace the `res.render('error', { error: err });` lines in your code with:

`res.json({ error: err })`

Comment out the res.render lines in your code and add in next(err); instead. If you're not using a view engine, the res.render stuff will throw an error.

https://stackoverflow.com/questions/23595282/error-no-default-engine-was-specified-and-no-extension-was-provided
