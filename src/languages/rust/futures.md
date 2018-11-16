## cons

the core issue is that you have code which may be run in a futures context, but is not required to be. When you are run within a future, you want to extract data from its context.

FWIW, I'm not aware of any approach to this problem that does not ultimately layer on thread-local storage (or some equivalent new language feature).

- https://github.com/rust-lang-nursery/futures-rs/issues/937

The removal of the implicit context is not great for quite a few things sadly at this point.

you need implicit “magic” to implement things like tracing or debug features such a sentry. There is nonway around it unless everyhing passes a context manually around and that is a pipe dream and also quite slow.

- https://www.reddit.com/r/rust/comments/8ac85w/futures_02_is_here/dwylsfk/


## Links

- https://docs.rs/future-by-example

## Examples

###

```rust
extern crate futures; // 0.1.25
extern crate tokio_core; // 0.1.17
use futures::{future::ok as fut_ok, stream, Stream};
use tokio_core::reactor::Core;

fn main() {
    let num_workers = 8;
    let mut core = Core::new().unwrap();

    let nums = stream::iter_ok::<_, ()>(1..100).map(move |n| {
        println!("producing future {}", n);
        fut_ok(n)
    });

    let future = nums.buffered(num_workers).for_each(|n| {
        println!("realized future {}", n);
        Ok(())
    });

    core.run(future).unwrap();
}
```

https://www.reddit.com/r/rust/comments/7yxyfr/how_come_this_stream_snippet_doesnt_consume_8/
