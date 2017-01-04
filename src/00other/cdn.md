but there's no guarantee that it will be in the browsers cache, and if it's not then there's the overhead of a DNS lookup and new TCP connection (possibly involving TLS negotiation) to a new host.

Based on studies from Facebook (and previously Yahoo!) it appears responses don't remain in the cache for very long

https://code.facebook.com/posts/964122680272229/web-performance-cache-efficiency-exercise/

CDNs have their own issues which enter in the balance:
- privacy
- another SPOF for the websites using them
- another DNS + HTTP connection to perform for the clients when there is a cach miss (relevant for mobile + terrible connections)
- do we have data about the actual cache hit rate when using CDNs? (first download + cache duration + multiple versions can seriously mitigate the benefits of CDNs)
On browsing sessions which are relevant to real browsing usage.
- did I miss other cons for CDNs?

These points seem enough to think that CDNs aren't enough to solve all the issues mentioned in the post. It's worth seeing the big picture and mentioning CDNs though.
