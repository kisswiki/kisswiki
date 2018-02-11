- https://iot.mozilla.org/gateway/

Yes, this reminds me of the Mozilla IoT gateway from yesterday, which seemed like it pulled exactly that rat-tail of requirements behind it. Something like:
- We'd like to make an IoT gateway that you can use from a browser.

- To get access to necessary APIs, we have to provide it via HTTPS.

- The get HTTP we need a certificate. Because no one is going to pay for it, we'll use Let's Encrypt.

- To get a Let's Encryt cert, we need a verifyable hostname on the public internet. Ok, let's offer subdomains on mozilla-iot.com.

- To verify that hostname, Let's Encrypt needs to talk to the gateway. Ok, let's provide a tunnel to the gateway.

- Now the gateway is exposed to the internet and could be hacked. So we need to continously update it to close vulnerabilities.

So in the end all your IoT devices are reachable from the internet. But hey, you can use Firefox to turn your lights on!

https://news.ycombinator.com/item?id=16334241