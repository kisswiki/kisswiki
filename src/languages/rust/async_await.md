- [RustLatam 2019 - Without Boats: Zero-Cost Async IO - YouTube](https://www.youtube.com/watch?v=skos4B5x7qE)
- https://boats.gitlab.io/blog/post/await-decision-ii/
  - https://www.reddit.com/r/rust/comments/bu0r5n/update_on_await_syntax/
  - https://news.ycombinator.com/item?id=20030486
    - TCP client example https://news.ycombinator.com/item?id=20031824 https://github.com/rustasync/runtime/blob/master/examples/tcp-client.rs

##

Why not JS/C#/Python style `await foo()` is discussed here:

https://paper.dropbox.com/doc/Await-Syntax-Write-Up-t9NlOSeI4RQ8AINsaSSyJ

Main points against:

1. Interacts poorly with the ? operator for propagating errors. You'd need to do (await foo())?

2. Chains poorly. `await foo().bar().baz()`

- a. What are you awaiting? foo() or foo().bar().baz()

- b. What if you wanted to await foo().bar()? (await foo().bar()).baz() is messy.

- c. What if you wanted to chain promises? Like httpRequest.send().body() . In many libraries such as Python's requests, the first returns a future for a response with headers and only a later call waits until the body is returned. `await (await httpRequest.send()).body()`

Why not .await() or .await!():

https://boats.gitlab.io/blog/post/await-decision/


https://news.ycombinator.com/item?id=20032264
