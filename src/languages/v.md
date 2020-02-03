Problem is that it's far to be close to what's being advertised. Especially there is no proper memory management and everything leaks everywhere. IMHO w/o garbage collection, you need at least some lifetime analysis like in Rust !

https://twitter.com/adriengnt/status/1220959899284320256


Woah! 300,000 RPS more than second place is amazing. What allowed them to separate like that amongst such a strong field?

It uses h2o's event loop and HTTP parser, though; those are not written in V.

The rest is probably just trading flexibility for performance.  For instance, they can only respond with write() -- can't mix with sendfile(), etc.

https://www.techempower.com/benchmarks/#section=test&runid=7f65c127-fad2-4a88-a6cb-5333c68362ef&hw=ph&test=plaintext&l=yyjfni-1j
