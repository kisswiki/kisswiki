## rustup update hangs or rust-docs

`Windows Defender > Virus & threat protection > Virus & threat protection settings > Add or remove exclusions > Add an  exclusion > Folder > ~/.rustup` https://github.com/rust-lang-nursery/rustup.rs/issues/763#issuecomment-407481780

`rustup toolchain remove nightly`  https://github.com/rust-lang-nursery/rustup.rs/issues/501#issuecomment-222177690

`rm -rf ~/.rustup/tmp` - this maybe optional, but I was getting errors that something from tmp cannot be renamed https://github.com/rust-lang-nursery/rustup.rs/issues/1245

`rustup install nightly`
