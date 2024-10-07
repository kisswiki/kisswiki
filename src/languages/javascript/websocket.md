- Sockette allows you to reuse instances, avoiding the need to redeclare all event listeners. automatically reconnect if the connection is lost! https://github.com/lukeed/sockette

## Websockets and expess.js

### Socket.io is for very old browsers. > IE10 supports Websockets. Use https://github.com/websockets/ws

- https://stackoverflow.com/questions/10112178/differences-between-socket-io-and-websockets/38558531#38558531
- https://www.reddit.com/r/webdev/comments/fcuyb2/ws_vs_socketio/
- https://www.npmtrends.com/socket.io-vs-websocket-vs-ws

### ws or wss

```javascript
new WebSocket(location.origin.replace(/^http/, 'ws') + "/whatever")
```

https://stackoverflow.com/questions/16090530/how-to-point-a-websocket-to-the-current-server#comment96150448_16090583

or

```javascript
new WebSocket((document.location.protocol === 'https:' ? 'wss' : 'ws') + '://' + document.location.hostname);
```

https://github.com/Maxim-Mazurok/nodejs-ws-chat/blob/4b546718193a0e66117bb5c7d28e91de55d9d8cb/public/index.html#L26

### Examples

First use example from https://github.com/websockets/ws#usage-examples.

To have websockets server running on the same port as your http server, try these two:

- https://github.com/websockets/ws#external-https-server
- https://github.com/websockets/ws#multiple-servers-sharing-a-single-https-server

To use express.js you need to pass express.js instance to http.createServer

https://stackoverflow.com/questions/60230333/error-connecting-to-websockets-nodejs-express-server/60230640#60230640

```javascript
const express = require('express');
const WebSocket = require('ws');
const http = require('http');

const app = express();
const port = 8080;

const server = http.createServer(app);

app.get('/', function(req, res, next) {
    return res.send('Hello World!');
});

const wss = new WebSocket.Server({ server });

wss.on('connection', function connection(ws) {
    ws.on('message', function incoming(message) {
        console.log('received: %s', message);
    });
    ws.send('something from server');
});

server.listen(port, function(err) {
    if (err) {
        throw err;
    }
    console.log(`listening on port ${port}!`);
});
```

I have added `handleUpgrade` in my code. I don't know yet if it's needed:

```javascript
const server = http.createServer(app);
server.listen(port, () =>
  console.log(`USCC API server listening on port ${port}`)
);

const wsServer = new ws.Server({ noServer: true });
wsServer.on('connection', socket => {
  socket.on('message', message => {
    console.log(message);
    socket.send(message);
  });
  socket.on("error", (err) => {
    console.log(err.stack);
  });
});

server.on('upgrade', (request, socket, head) => {
  wsServer.handleUpgrade(request, socket, head, socket => {
    wsServer.emit('connection', socket, request);
  });
});
```

Note: First I used this example:

```javascript
const express = require('express');
const ws = require('ws');

const app = express();

// Set up a headless websocket server that prints any
// events that come in.
const wsServer = new ws.Server({ noServer: true });
wsServer.on('connection', socket => {
  socket.on('message', message => console.log(message));
});

// `server` is a vanilla Node.js HTTP server, so use
// the same ws upgrade process described here:
// https://www.npmjs.com/package/ws#multiple-servers-sharing-a-single-https-server
const server = app.listen(3000);
server.on('upgrade', (request, socket, head) => {
  wsServer.handleUpgrade(request, socket, head, socket => {
    wsServer.emit('connection', socket, request);
  });
});
```

from https://masteringjs.io/tutorials/express/websockets, but when pasted code to bigger application, it wasn't working without `http.createServer(app)`.

### https

```shell

openssl genrsa -out client-key.pem 2048
openssl req -new -key client-key.pem -out client.csr
openssl x509 -req -in client.csr -signkey client-key.pem -out client-cert.pem
```

https://stackoverflow.com/questions/34835859/node-js-https-example-error-unknown-ssl-protocol-error-in-connection-to-localh/35053638#35053638

```javascript
const port = 8888;
const https = require('https');
const express = require('express');
const websocket = require('ws');
const app = express();

app.use( express.static('public') );
app.get('/curl', (req, res) => res.send('Hello World'));

var options = {
  key: fs.readFileSync('key.pem'),
  cert: fs.readFileSync('')
};

const httpsServer = https.createServer( credentials, app );
const wss = new websocket.Server({ server: httpsServer });

httpsServer.listen( port, function listening(){
    console.log( 'listening on ' + port );
});
```

https://stackoverflow.com/questions/52562695/expressjs-routes-websockets-share-port/52563668#52563668

### Links

- https://codeburst.io/why-you-don-t-need-socket-io-6848f1c871cd
- https://blog.kevinchisholm.com/javascript/node-js/websocket-server-five-minutes/
- access the WebSocketServer from any endpoint by assigning it (or any of its properties) to app.locals https://stackoverflow.com/questions/22429744/how-to-setup-route-for-websocket-server-in-express/57426017#57426017
- https://developer.mozilla.org/en-US/docs/Web/API/WebSocket
- https://github.com/facundofarias/awesome-websockets#nodejs
- https://www.websocket.org/echo.html

## bun

- https://bun.sh/docs/api/websockets
- https://bun.sh/guides/websocket/simple
