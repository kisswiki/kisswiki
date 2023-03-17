Test cors with curl:

```shell
$ curl -s -I -X OPTIONS -H "Origin: http://localhost:4000" -H 'Access-Control-Request-Method: GET' http://example.com/api/datasets | grep 'Access-Control-Allow-Origin'
Access-Control-Allow-Origin: *
```

- https://stackoverflow.com/questions/42803394/cors-credentials-mode-is-include
- https://50linesofco.de/post/2017-03-06-cors-a-guided-tour

## express.js

```javascript
var express = require('express')
var cors = require('cors')
var app = express()

app.use(cors())
```

- https://expressjs.com/en/resources/middleware/cors.html