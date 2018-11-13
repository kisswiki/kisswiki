Don't use this method: `curl -sSf https://static.rust-lang.org/rustup.sh | sh` from https://www.rust-lang.org/en-US/downloads.html.

## quickstart

```bash
rustup self update
rustup update
rustup update stable
# show toolchain for current directory and list installed toolchains
rustup show
# show available targets
rustup target list
rustup default nightly
rustup self uninstall
rustup toolchain uninstall # or rustup toolchain remove
rustup help toolchain
```

```bash
$ rustup install nightly-2018-01-13
$ rustup run nightly-2018-01-13 rustc --version
rustc 1.25.0-nightly (51b0b3734 2018-01-12)
$ rustup override set nightly-2018-01-13
$ rustup override unset
```

Instead of `rustup override` you can create `rustup-toolchain` file with content:

`nightly-2018-01-13`

https://github.com/rust-lang-nursery/rustup.rs/

`rustc --print sysroot`

https://stackoverflow.com/questions/47418823/compiling-x64-with-rust-on-windows

##

Use this instead from https://github.com/rust-lang-nursery/rustup.rs

`curl https://sh.rustup.rs -sSf | sh`

Then add binaries to your $PATH:

```
echo . \$HOME/.cargo/env >> ~/.bashrc
. ~/.bashrc
```

- Taking Rust everywhere with rustup https://blog.rust-lang.org/2016/05/13/rustup.html

## Tab completion

```
rustup completions bash > ~/rustup.bash-completion
echo "source ~/rustup.bash-completion" >> ~/.bash_profile
source ~/.bash_profile
```

Doesn't work with `rustup.exe`, use `rustup <TAB>`.

https://github.com/rust-lang-nursery/rustfmt

## could not rename component file

Check if you have enough storage space.

>When rustup update fails in No space left on device, no errors reported. https://github.com/rust-lang-nursery/rustup.rs/issues/1463
