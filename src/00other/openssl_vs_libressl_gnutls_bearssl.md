Awesomeness

Totally secure until the next major flaw, that isn't present in LibreSSL, is found.

linner

Seems to work for me at least. One thing I hate about OpenSSL is how intertwined everything is. Even if I "no-xxxx" and disable every single feature, static linking to the library produces huge binaries. Sometimes I just need a tiny part of the library and for whatever reason the linker can't strip out the fluff. I'm using -fdata-sections -ffunction-sections -Wl,--gc-sections too.

kpedersen

The LibreSSL fork was actually planned long before heartbleed through growing annoyances. It was the custom memory allocator that was also [the final straw](https://www.zdnet.com/article/heartbleed-was-not-the-final-straw-for-openbsd-to-create-libressl/), not the commonly cited heartbleed.

I must admit, reading through the two codebases it is much clearer what LibreSSL is now doing. They also stripped out a load of niche features and cruft (which usually I am against for backwards compatibility) but for security this is a good idea.

linner

Also LibreSSL seems to be missing features from modern OpenSSL like BLAKE, SHA3, other stuff? I wonder how the performance compares being based on such an old code base.

kpedersen

They do backport a few security related things (and also the original OpenSSL shares many of their improvements too). They seem a little reserved when it comes to brand new features though again some do get cleaned up and integrated but not all.

As for performance, they don't tend to focus on that so much. OpenBSD in general runs with a number of security related overheads (such as salting / cleaning memory (thus the annoyance at the custom memory allocator!), SMT, locking, etc) so the overhead of their LibreSSL is probably negligible in comparison.

For performance, I highly recommend BearSSL (https://bearssl.org/) or some of the embedded alternatives.

RahulSundaram

GNUTLS is LGPL which is generally acceptable considering things like glibc. The bigger problem with alternative implementations in general including LibreSSL is that they are just not as supported leaving a large support burden to people adopting them. Linux distributions have largely abandoned it, see https://lwn.net/Articles/841664/ After Heartbleed, Linux Foundation boosted funding for OpenSSL and they have done some major improvements including with this release, the shift to Apache license, taking away a good portion of the criticisms against it.

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1277599-openssl-3-0-officially-released?p=1277649#post1277649
