## format whole project

in rustfmt.toml:

`write_mode = "overwrite"`

`cargo fmt`


http://asquera.de/blog/2017-03-03/setting-up-a-rust-devenv/

## line exceeded maximum length

in rustfmt.toml:

`max_width = 140`

https://github.com/rust-lang-nursery/rustfmt/issues/1080#issuecomment-228605122

## error: toolchain 'stable-x86_64-pc-windows-msvc' does not have the binary `rustfmt.exe`

```
$ rustup run stable rustfmt --version
error: toolchain 'stable-x86_64-pc-windows-msvc' does not have the binary `rustfmt.exe`
```

Solution:

```
$ rustup component remove rustfmt-preview --toolchain=stable-x86_64-pc-windows-msvc
info: removing component 'rustfmt-preview'
warning: during uninstall component rustfmt-preview-x86_64-pc-windows-msvc was not found

$ rustup component add rustfmt-preview --toolchain=stable-x86_64-pc-windows-msvc
info: downloading component 'rustfmt-preview'
info: installing component 'rustfmt-preview'

$ rustup run stable rustfmt --version
rustfmt 0.99.1-stable (da17b689 2018-08-04)
```

- https://users.rust-lang.org/t/problem-with-rustfmt-on-stable/15165/7
- https://stackoverflow.com/questions/47945066/error-toolchain-stable-x86-64-apple-darwin-does-not-have-the-binary-rustfmt/53038397#53038397
