Async hyper, like nginx, will hopefully be inherently pretty resilient to this attack because it doesn't block any threads. But if you're using the currently very common rocket framework, you're using blocking hyper, which I suspect is extremely susceptible to HTTP slowdown attacks like slowloris, and AFAIK has not done much to mitigate it.

- https://www.reddit.com/r/rust/comments/6ymrn5/why_i_use_rust_as_a_webdeveloper/dmqqrpj/
- https://pl.wikipedia.org/wiki/Slowloris
