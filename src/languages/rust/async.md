We're addressing the cancellation issue for I/O in our 0.6 version by manually writing the state machines for all I/O code so a connection always knows where it left off and can resume optimistically. That's a huge refactor, and I wish it wasn't so necessary.

I feel like the messaging around async/await in Rust doesn't emphasize this footgun nearly well enough. As of writing, it's still a TODO chapter in the official async book. It's not really mentioned anywhere that I can easily find in the docs for futures, tokio (including https://tokio.rs/tokio/tutorial) or async-std (including http://book.async.rs) or std::future::Future.

The only time you're really going to read about cancellation is in blog posts like this or maybe the one of the futures RFCs. I think that's a huge disservice to everyone writing async code, especially when the design of the whole ecosystem assumes that the user knows about cancellation.

https://www.reddit.com/r/rust/comments/m8ixix/a_look_back_at_asynchronous_rust/grihd3k/

I've learned so much about async from reading your code, that it's become for me somewhat like the missing guide for the tricky issues in async, such as handling actix apps which may drop streams in the middle of reading framed messages from the database.

https://www.reddit.com/r/rust/comments/m8ixix/a_look_back_at_asynchronous_rust/grkk4ae/
