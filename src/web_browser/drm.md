You don't "build" Widevine. Google distributes a binary (libwidevinecdm.so) which implements a standard API that works with both Chrome and Chromium. The "master" DRM secret key is obfuscated and distributed in libwidevinecdm.so itself.

Which is why the Arch package just extracts it from Chrome and then puts it in the right place for Chromium.

Because you would need to get a widevine license from google. Mozilla was able to do that, but I know at least one chromium fork had it's application for a license rejected. It technically is possible to copy the widevine library from a chrome install to use with chromium, but non technical people won't know how to do that.

https://news.ycombinator.com/item?id=20052623
