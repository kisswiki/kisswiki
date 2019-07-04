## dns over https and esni

https://torrentfreak.com/encrypted-dns-and-sni-make-pirate-site-blocking-much-harder-190702/

How to setup for cloudflare https://1.1.1.1/dns/

`Firefox > about:config > network.security.esni.enabled > true`

I have restarted the Firefox but only TLS 1.3 passed the test https://www.cloudflare.com/ssl/encrypted-sni/.

After turning off/on wire connection, DNSSEC test passed.

After `network.trr.mode 2` and Firefox restart all tests passed https://blog.cloudflare.com/encrypt-that-sni-firefox-edition/
