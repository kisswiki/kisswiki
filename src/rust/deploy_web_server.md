- build a statically-linked binary with musl https://blog.rust-lang.org/2016/05/13/rustup.html
- Deploying a Rust application https://www.clever-cloud.com/doc/docker/docker/

> it's not a very good process to use resources of the production system to build your project
> https://www.reddit.com/r/rust/comments/46z75s/deploying_a_web_server_written_in_rust/

<br>

> I think it is a mistake to deploy with the compiler (+other devtools). A better setup would be to have one container for building, and the copy the built executable (+dependencies) over to the container/image that will be deployed.
> https://www.reddit.com/r/rust/comments/2ea935/deploying_rust_apps_with_docker/cjxmhw2

<br>

> While you are strongly encouraged to repackage a smaller Docker image with your compiled app for production use, it may be useful to run your app in development
> https://github.com/fnichol/docker-rust
