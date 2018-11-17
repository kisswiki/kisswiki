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

```
extern crate actix;
extern crate actix_web;
extern crate env_logger;
extern crate futures; // 0.1.25
extern crate tokio; // 0.1.17
use futures::future::ok as fut_ok;
use futures::Future;
use tokio::runtime::Builder;

use std::sync::{Arc, Mutex};
extern crate serde_json;

type Error = ();

fn questions_data(
    val: i32,
) -> Box<Future<Item = serde_json::Value, Error = actix_web::error::Error>> {
    let f = std::fs::read_to_string("auth_token").unwrap();
    let token = f.trim();
    use actix_web::{client, HttpMessage};
    use std::time::Duration;
    Box::new(
        client::ClientRequest::get(
            "https://jsonplaceholder.typicode.com/todos/".to_owned() + &val.to_string(),
        )
        .header(
            actix_web::http::header::AUTHORIZATION,
            "Bearer ".to_owned() + token,
        )
        .finish()
        .unwrap()
        .send()
        .timeout(Duration::from_secs(30))
        .map_err(actix_web::error::Error::from) // <- convert SendRequestError to an Error
        .and_then(|resp| {
            resp.body().limit(67_108_864).from_err().and_then(|body| {
                let resp: serde_json::Value = serde_json::from_slice(&body).unwrap();
                fut_ok(resp)
            })
        }),
    )
}

fn main() {
    let num_workers = 8;

    let mut core = Builder::new().core_threads(num_workers).build().unwrap();

    let results = Arc::new(Mutex::new(Vec::new()));
    for n in 1..100 {
        let res = results.clone();
        core.spawn(questions_data(n).map(move |n| {
            res.lock().unwrap().push(n);
        }));
    }
    core.shutdown_on_idle().wait().unwrap();
    let data = results.lock().unwrap();
    println!("{:?}", *data);
}
```
