## Ubuntu

## pngquant` binary doesn't seem to work correctly

Works on WSL Ubuntu.

```bash
$ sudo apt-get install -y build-essential libpng-dev
$ cargo install hyperfine
```

https://github.com/imagemin/pngquant-bin/issues/64#issuecomment-389048977

## Benchmark Webpack

Windows

`hyperfine 'sh node_modules/.bin/webpack --progress --bail'`

WSL Ubuntu

`hyperfine 'node_modules/.bin/webpack --progress --bail'`
