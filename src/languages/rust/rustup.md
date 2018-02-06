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
```

https://github.com/rust-lang-nursery/rustup.rs/

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
