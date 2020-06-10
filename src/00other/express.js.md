## Routing

Static + catch all

```javascript
var express = require('express');

var app = express();
app.use('/public', express.static(__dirname + '/public'));

app.get('/*', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

var port = 8000;
app.listen(port, function() {
  console.log('Example app listening on port ' + port);
});
```

http://stackoverflow.com/questions/26349497/node-express-with-static-html-how-to-route-all-requests-to-index-html/26638143#26638143

```javascript
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
```

- https://expressjs.com/en/starter/hello-world.html
- https://gist.github.com/giacomorebonato/49919551d02fc82f6ef0e2ca0095aa6f

## No default engine was specified and no extension was provided

The res.render stuff will throw an error, if you're not using a view engine.

If you just want to serve json replace the `res.render('error', { error: err });` lines in your code with:

`res.json({ error: err })`

Comment out the res.render lines in your code and add in next(err); instead. If you're not using a view engine, the res.render stuff will throw an error.

https://stackoverflow.com/questions/23595282/error-no-default-engine-was-specified-and-no-extension-was-provided

## 400 response with json

```javascript
res.status(400).json(json_response);
```

https://stackoverflow.com/questions/26066785/proper-way-to-set-response-status-and-json-content-in-a-rest-api-made-with-nodej/37622663#37622663

## forbidden error

>I believe it's because of the relative path; the "../" is considered malicious. Resolve the local path first, then call res.sendfile. You can resolve the path with path.resolve beforehand.

```javascript
var path = require('path');
res.sendFile(path.resolve('temp/index.html'));
```

https://stackoverflow.com/questions/14594121/express-res-sendfile-throwing-forbidden-error/14594282#14594282