- https://mgattozzi.com/hyper-async
- https://blog.guillaume-gomez.fr/articles/2017-02-22+Rust+asynchronous+HTTP+server+with+tokio+and+hyper
- http://www.arewewebyet.org/
- https://gsquire.github.io/static/post/rest-in-rust/

## url router / match / extract

- https://github.com/gsquire/reroute
  - https://gsquire.github.io/static/post/rest-in-rust/
- https://www.reddit.com/r/rust/comments/4btgi0/regexset_router_for_hyper/
- https://github.com/rust-lang/regex#usage-match-multiple-regular-expressions-simultaneously
- Similar to and inspired by reroute, but potentially faster (no unnecessary string allocations, no hashmaps, and method-first-matching). https://github.com/kardeiz/rs-router
- https://github.com/marad/hyper-router
- https://crates.io/keywords/router
  - contributors such as alexcrichton, wycats https://github.com/http-rs/route-recognizer
    - example with hyper 0.13 https://github.com/zzzdong/lieweb/blob/32217eb93fb97ad6b7dda90ee564a516b462c4de/src/request.rs
  - hyper example https://github.com/trek-rs/path-tree/blob/master/examples/hello.rs
  - hyper example https://github.com/gsquire/reroute/blob/master/examples/simple.rs
  - https://github.com/trek-rs/radix-tree
  - https://github.com/Jon-Davis/http_tools
  - compile routes at build time https://github.com/couchand/wayfinder
  - hyper 0.12 https://github.com/kardeiz/reset-router
  - using hyper's support for futures 0.1 https://github.com/dac-gmbh/hyperdrive
  - hyper 0.12? https://github.com/alleycat-at-git/http_router
- regex example https://www.reddit.com/r/rust/comments/7ovgzx/how_to_parse_complex_urls_in_hyper_server/dse95yy/
