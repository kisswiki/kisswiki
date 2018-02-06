We were hoping to get some of those improvements in build times in 2.5, but they are pretty involved changes. Basically, the crux of the problem is that a lot of build tools try to figure out which set of files need to be type-checked and re-emitted. We want to provide an API so that tools don't need to do that on their own. Thankfully, 2.6 isn't too far away

https://www.reddit.com/r/programming/comments/6ubwt2/announcing_typescript_25_rc/dlrjqct/
