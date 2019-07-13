Update dependencies

`cargo update`

Better:

`cargo install cargo-edit`

`cargo upgrade`

https://github.com/killercup/cargo-edit/pull/138

## Update dependencies for installed binaries

`cargo install -f crate` install single crate

For all binaries (cmake needed):

`cargo install cargo-update`

`cargo install-update -a -l` to list

`cargo install-update -a` to install

https://stackoverflow.com/questions/34484361/does-cargo-install-have-an-equivalent-update-command

## Pin version

- https://crates.io/crates/cargo-ensure-installed
  - https://github.com/rust-lang/cargo/issues/2082#issuecomment-356299297
