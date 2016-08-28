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

<br>

> What benefit would Docker images have over the existing upstream distribution or distro packaging? The Rust compiler doesn't have any particularly complicated dependencies, either installing the binaries directly from rust-lang.org or installing packages from your distro (if your distro has packages yet) should work fine.
> Container images are great for daemons with possibly complicated dependency sets that might have conflicting version requirements with other packages and can benefit from isolation from other packages that containerization gives, but seem like a pretty heavyweight solution for just installing a compiler.
> https://news.ycombinator.com/item?id=10711255

<br>

> One benefit: one could install latest version of Rust on any distribution. Debian stable for instance usually lags behind (with good reason, but still...)
> The installer from https://www.rust-lang.org works fine on Debian stable. Right now, you can just use the upstream rustup.sh script for platforms that don't yet have it packaged (like Debian stable), or install from your distro for those that do (or use rustup.sh on those as well if you like).

<br>

> If I don't like having Rust around, with containers I can just remove it
> rustup.sh has an --uninstall flag that should remove everything cleanly
> Should. It wouldn't be the first script to have a bug.
> https://news.ycombinator.com/item?id=10720239

<br>

> good for testing services like travis
> travis could also test statically compiled binary
> but with container you also test with your binary will build in isolated environment
> https://docs.travis-ci.com/user/docker/
