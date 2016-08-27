## Ubuntu/Debian to Windows x86_64

`apt-get install gcc-mingw-w64-x86-64`

Edit ~/.cargo/config where where `$ARCH` is for example

```
[target.x86_64-pc-windows-gnu]
linker = "/usr/bin/x86_64-w64-mingw32-gcc"
ar = "/usr/bin/x86_64-w64-mingw32-gcc-ar"
```

Buil with

`cargo build --release --target "x86_64-pc-windows-gnu"`

- https://hypermansite.wordpress.com/2015/11/28/3/
- http://stackoverflow.com/questions/31492799/cross-compile-a-rust-application-from-linux-to-windows
