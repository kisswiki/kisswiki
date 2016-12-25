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
