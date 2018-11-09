>The main difference is that a "side channel" of the TLS connection (the NPN or ALPN extensions) is used to negotiate HTTP/2. The upgrade to version 2 without the TLS wrapper failed; so many servers and/or middleboxes had issues with it, that all browser makers decided "HTTP/2 is going to be TLS only" (the current "encrypt all the things" push played a small part, but the main reason was the compatibility problems).
https://news.ycombinator.com/item?id=17105829

## Debugging

Wireshark or https://github.com/summerwind/h2a
