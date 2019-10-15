## C++ build tools

Download from https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019

https://github.com/rust-lang/rustup.rs/pull/2056

## rustup update hangs or rust-docs

`Windows Security > Virus & threat protection > Virus & threat protection settings > Add or remove exclusions > Add an  exclusion > Folder > ~/.rustup` https://github.com/rust-lang-nursery/rustup.rs/issues/763#issuecomment-407481780

`rustup toolchain remove nightly`  https://github.com/rust-lang-nursery/rustup.rs/issues/501#issuecomment-222177690

`rm -rf ~/.rustup/tmp` - this maybe optional, but I was getting errors that something from tmp cannot be renamed https://github.com/rust-lang-nursery/rustup.rs/issues/1245

`rustup install nightly`

### Ubuntu WSL

Do similar but path should be like `C:\Users\user\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc`

https://medium.com/@leandrw/speeding-up-wsl-i-o-up-than-5x-fast-saving-a-lot-of-battery-life-cpu-usage-c3537dd03c74
