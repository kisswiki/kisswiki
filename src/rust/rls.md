- follow the instructions on https://github.com/rust-lang-nursery/rls

## vscode setting window.openFoldersInNewWindow can't be on

https://github.com/rust-lang-nursery/rls/pull/296

## RUST_SRC_PATH environment variable must be set to point to the src directory of a rust checkout

I needed to install src for specific rust version, e.g.

rustup component add rust-src --toolchain nightly-2017-04-16-x86_64-pc-windows-msvc

and then I got ~/.rustup/toolchains/nightly-2017-04-16-x86_64-pc-windows-msvc/lib/rustlib/src sources.

https://github.com/saviorisdead/RustyCode/issues/204#issuecomment-299710562
