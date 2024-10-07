>Early version of WebSockets exposed bugs in HTTP proxies, some of which were security problems: http://www.adambarth.com/papers/2011/huang-chen-barth-rescor... To fix these kinds of problems, the final version of WebSockets does not use a straightforward upgrade but instead has a kludgey handshake and content masking: https://en.wikipedia.org/wiki/WebSocket#Protocol_handshake https://trac.ietf.org/trac/hybi/wiki/FAQ
HTTP/2 doesn't have the same problems because it requires TLS+ALPN, but IIRC that "clean" solution was only arrived at after years of discussion and experimentation.
https://news.ycombinator.com/item?id=17106174

## Upgrade

> WebSockets, which are always implemented by upgrading an HTTP or HTTPS connection

- https://developer.mozilla.org/en-US/docs/Web/HTTP/Protocol_upgrade_mechanism
- https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers
