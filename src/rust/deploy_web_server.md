- build a statically-linked binary with musl https://blog.rust-lang.org/2016/05/13/rustup.html

> it's not a very good process to use resources of the production system to build your project
> https://www.reddit.com/r/rust/comments/46z75s/deploying_a_web_server_written_in_rust/

<br>

> I think it is a mistake to deploy with the compiler (+other devtools). A better setup would be to have one container for building, and the copy the built executable (+dependencies) over to the container/image that will be deployed.
> https://www.reddit.com/r/rust/comments/2ea935/deploying_rust_apps_with_docker/cjxmhw2
