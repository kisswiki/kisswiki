I wish the QUIC design was datagram-first... so many client/server implementations don't implement the datagram extension properly because it's... well an extension, and for most applications, reliable sequencing should be eschewed in favor of client-side reassembly. IMO QUIC was far too influenced by the legacy of how HTTP works when there was an opportunity to leapfrog a generation of bad decisions.

https://news.ycombinator.com/item?id=27312442

## Links

- https://www.fastly.com/blog/why-fastly-loves-quic-http3
