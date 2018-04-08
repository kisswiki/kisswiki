## cons

the core issue is that you have code which may be run in a futures context, but is not required to be. When you are run within a future, you want to extract data from its context.

FWIW, I'm not aware of any approach to this problem that does not ultimately layer on thread-local storage (or some equivalent new language feature).

- https://github.com/rust-lang-nursery/futures-rs/issues/937

The removal of the implicit context is not great for quite a few things sadly at this point.

you need implicit “magic” to implement things like tracing or debug features such a sentry. There is nonway around it unless everyhing passes a context manually around and that is a pipe dream and also quite slow.

- https://www.reddit.com/r/rust/comments/8ac85w/futures_02_is_here/dwylsfk/