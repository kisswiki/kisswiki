>Early version of WebSockets exposed bugs in HTTP proxies, some of which were security problems: http://www.adambarth.com/papers/2011/huang-chen-barth-rescor... To fix these kinds of problems, the final version of WebSockets does not use a straightforward upgrade but instead has a kludgey handshake and content masking: https://en.wikipedia.org/wiki/WebSocket#Protocol_handshake https://trac.ietf.org/trac/hybi/wiki/FAQ
HTTP/2 doesn't have the same problems because it requires TLS+ALPN, but IIRC that "clean" solution was only arrived at after years of discussion and experimentation.
https://news.ycombinator.com/item?id=17106174

## Upgrade

> WebSockets, which are always implemented by upgrading an HTTP or HTTPS connection https://developer.mozilla.org/en-US/docs/Web/HTTP/Protocol_upgrade_mechanism

> All webSocket connections start with an HTTP request with a header that requests an upgrade to the webSocket protocol https://stackoverflow.com/questions/47085281/do-websocket-implementations-use-http-protocol-internally

> the WebSocket clients sends the HTTP request asking for a WebSocket connection https://stackoverflow.com/questions/26401893/who-is-sending-http-websocket-upgrade-requests

- https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers

## Failed to execute 'send' on 'WebSocket': Still in CONNECTING state

This error is raised because you are sending your message before the WebSocket connection is established.

You can solve it by doing this simply:

```javascript
conn.onopen = () => conn.send("Message");
```

https://stackoverflow.com/questions/23051416/uncaught-invalidstateerror-failed-to-execute-send-on-websocket-still-in-co/61697857#61697857

## client

```javascript
var ws = new WebSocket("wss://localhost:5000");
ws.onopen = function() {
  console.log("open");
  ws.send("client here")
}
ws.onmessage = function(e) {
  console.log("message: " + e.data);
}
```
