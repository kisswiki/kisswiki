something wrong with build.rs

```bash
$ rustup install nightly-2017-12-23
$ rustup override set nightly-2017-12-23
$ rustc --version rustc 1.24.0-nightly (5165ee9e2 2017-12-22)
$ juniper/juniper_rocket (master)$ cargo run --example rocket_server
error: failed to run custom build command for `rocket v0.3.6`
Installed version is: 1.24.0-nightly (2017-12-22). Minimum required: 1.25.0-nightly (2018-01-12).
version here github.com/SergioBenitez/Rocket/blob/v0.3.6/codegen/build.rs
1.24.0-nightly
```

package on cargo is different than on https://github.com/SergioBenitez/Rocket/blob/v0.3.6 ?

- https://github.com/rofrol/rustup-helpers/blob/master/setup_specific_rust_nightly.sh
- https://github.com/SergioBenitez/Rocket/pull/256/files
- https://github.com/SergioBenitez/Rocket/blob/v0.3.6/codegen/build.rs
- https://mozilla.logbot.info/rocket/20180209#c14273676