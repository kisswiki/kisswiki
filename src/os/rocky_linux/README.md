## nginx

`dnf module enable nginx:mainline` failed for me https://docs.rockylinux.org/guides/web/nginx-mainline/

Using these instead:

- https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-rocky-linux-9
- https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-rocky-linux-9
  - look at certbot.md
- https://www.digitalocean.com/community/tutorials/nginx-reverse-proxy-node-angular

## rust, ripgrep, clap

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

`cargo install ripgrep`

```
dnf install gcc # linker cc not found
cargo install fd-find`
```

- https://rustup.rs/
- https://www.redhat.com/sysadmin/install-rust-linux
- https://ostechnix.com/how-to-fix-rust-error-linker-cc-not-found-on-linux/

## do not install rust with dnf

rust and cargo from dnf are too old, and later I couldn't `cargo install clap` https://docs.rockylinux.org/books/nvchad/additional_software/#ripgrep. Also `rustup` wasn't installed.

I was getting:

error: failed to select a version for the requirement `clap = "^4.0.22"`

`dnf remove rust cargo`

Remarks

- clap 4.0.22 wasn't yanked
  - https://github.com/rust-lang/crates.io-index/blob/74f2a16cc6bbdfe665463da00d4ef63eb89a8973/cl/ap/clap#L313
  - https://www.reddit.com/r/rust/comments/if9eaa/comment/g2m6trn/
- local registry wasn't corrupt `rm -rf ~/.cargo/registry` https://blog.illixion.com/2021/10/fix-failed-to-select-a-version-cargo/
- didn't help `cargo install --locked fd-find` https://github.com/rust-lang/cargo/issues/9091#issuecomment-763858781
- this helped: You probably need to update your rust version to 1.60 or higher. https://www.reddit.com/r/rust/comments/whzy5g/comment/ij9gs04/
