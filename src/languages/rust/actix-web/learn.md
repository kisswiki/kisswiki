I just went through this process and also come from a Python background. Actix-web is NOTHING like most Python web frameworks, and due to Python’s GIL, actix can do things that are impossible in Python. At best it’s like tornado + celery. My advice in no particular order:

1. Understand what Actors are and thus what the framework is trying to do, especially HTTPMessage.
2. Get reasonably proficient with the Future combinators, closures, and the idea of returning them and/or spawning them onto a thread pool.
3. Modern async Python has “async” and “await”. The equivalent doesn’t (yet) exist in stable Rust. Further there isn’t really a “yield” equivalent. Thus you’ll need to write all your request handlers differently where they generally build and return a impl Future.
4. The actix and actix web APIs are under very active development (aka unstable). Triple check exactly which version you are running and make sure you’re reading the corresponding source.
5. Yes, your going to need to read the raw source code especially the test suites and examples. Make sure you read the right release tag! The documentation and book are incomplete and totally insufficient for more than a toy project.
6. Understand the difference between `send`, `try_send`, and `do_send`. It’s very important.
7. Manage your expectations. Django and Python are very mature projects. Rust and Actix are very bleeding edge. It will likely take you roughly 3x longer to implement the same service in actix-web. But it’s worth it because you’ll get better at Rust and it’s REALLY FAST!

https://www.reddit.com/r/rust/comments/8v3p2a/resources_to_understand_actixweb/

##

- https://gill.net.in/posts/auth-microservice-rust-actix-web-diesel-complete-tutorial-part-3/
- https://blog.approveapi.com/tutorials/rust-actix-web-approveapi-magic-login-link/
- https://blog.sentry.io/2018/12/04/safe-web-services-actix-sentry
- [Rust Validates Auth Web Microservices with Actix-Web - Complete Tutorial Part 2](https://bzdww.com/article/48977/)
- https://www.jamesbaum.co.uk/blether/creating-authentication-middleware-actix-rust-react/
