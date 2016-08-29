> `Box` won't leak, but `Rc` is just simple reference counting and can leak if you don't use weak pointers to break cycles.
> What's keeping you from having a cache and forgetting to expunge it? It's fair to say that you have to work a lot harder in Rust to get a memory leak, while it requires no effort in C/C++, though.
> https://news.ycombinator.com/item?id=9219832
