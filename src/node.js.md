- https://github.com/nodejs/node/blob/master/ROADMAP.md
- https://nodejs.org/dist/latest-v5.x/docs/api/
- timezone http://stackoverflow.com/questions/8083410/how-to-set-default-timezone-in-node-js
- http.request behind proxy https://www.facebook.com/groups/257881290932879/permalink/976790065708661/
- local Node/Browser development with Chrome DevTools https://github.com/Jam3/hihat
- cheatsheet https://gist.github.com/LeCoupa/985b82968d8285987dc3
- http://stackoverflow.com/questions/28094192/difference-between-response-setheader-and-response-writehead

## ES6

- https://kangax.github.io/compat-table/es6/
- https://nodejs.org/en/docs/es6/

## Portable

```
mkdir -p ~/installed/node.js
cd ~/installed/node.js
curl -O -J -L https://nodejs.org/dist/v4.4.4/win-x64/node.exe

```

https://codyswartz.us/wp/finds/node-js-stand-alone-portable-with-npm

## Example

```javascript
require('http').createServer(function (request, response) {
  response.writeHead(200, {'Content-Type': 'text/plain'});
  response.end('Hello worldn\n');
}).listen(8124);
```

- https://gist.github.com/LeCoupa/985b82968d8285987dc3
- https://www.sitepoint.com/creating-a-http-server-in-node-js/

## CORS

```javascript
require('http').createServer(function (request, response) {
  response.writeHead(200, {
    'Content-Type': 'text/plain'
    ,'Access-Control-Allow-Origin': '*'
  });
  response.end('/img/Alea_1.png');
}).listen(8124);
```

- http://stackoverflow.com/questions/18642828/origin-http-localhost3000-is-not-allowed-by-access-control-allow-origin/18643177#18643177
- http://stackoverflow.com/questions/18310394/no-access-control-allow-origin-node-apache-port-issue/34396145#34396145
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS
- https://nodejs.org/api/http.html

## json

```javascript
require('http').createServer(function (request, response) {
  response.writeHead(200, {
    'Content-Type': 'application/json'
    ,'Access-Control-Allow-Origin': '*'
  });
  var r = Math.floor(1 + Math.random() * 6);
  var o = {
    'data': {
      'image_url': '/img/Alea_' + r + '.png'
    }
  }
  response.end(JSON.stringify(o));
}).listen(8124);
```

http://stackoverflow.com/questions/5892569/responding-with-a-json-object-in-nodejs-converting-object-array-to-json-string/9806180#9806180

## Exec

node-cross-spawn

- http://stackoverflow.com/questions/27688804/how-do-i-debug-error-spawn-enoent-on-node-js/35561971#35561971
- https://github.com/IndigoUnited/node-cross-spawn
