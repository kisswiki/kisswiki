- build a statically-linked binary with musl https://blog.rust-lang.org/2016/05/13/rustup.html
- Deploying a Rust application https://www.clever-cloud.com/doc/docker/docker/
- https://www.distelli.com/docs/tutorials/build-and-deploy-rust-application
- http://www.arewewebyet.org/topics/deploy/
- https://github.com/fnichol/docker-rust
- https://github.com/Scorpil/docker-rust

## Use docker or install compiler on production machine?

> it's not a very good process to use resources of the production system to build your project
> https://www.reddit.com/r/rust/comments/46z75s/deploying_a_web_server_written_in_rust/

<br>

> I think it is a mistake to deploy with the compiler (+other devtools). A better setup would be to have one container for building, and the copy the built executable (+dependencies) over to the container/image that will be deployed.
> https://www.reddit.com/r/rust/comments/2ea935/deploying_rust_apps_with_docker/cjxmhw2

<br>

> While you are strongly encouraged to repackage a smaller Docker image with your compiled app for production use, it may be useful to run your app in development
> https://github.com/fnichol/docker-rust

## Binary size

https://lifthrasiir.github.io/rustlog/why-is-a-rust-executable-large.html#takeaway

## Musl and stack overflow

> It's probably stack overflow. Unfortunately musl libc has small stack (80kib) but rust usually relies on large stack (order of megabytes). I could not find easy way to change the stack size previously.
> https://github.com/tailhook/vagga/issues/116#issuecomment-154092087
