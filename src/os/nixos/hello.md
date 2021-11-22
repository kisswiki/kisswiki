default.nix:

```nix
let
  pkgs = import <nixpkgs> {};
in
pkgs.stdenv.mkDerivation {
  name = "hello-2.1.1";
  buildInputs = [ pkgs.perl ];
  src = pkgs.fetchurl {
    url = ftp://ftp.nluug.nl/pub/gnu/hello/hello-2.1.1.tar.gz;
    sha256 = "1md7jsfd8pa45z73bz1kszpp01yw6x5ljkjk2hx7wl800any6465";
  };
}
```

```bash
$ nix-build
/nix/store/6q9ig9ifam51j3hr652jgl4cs6jhp9mf-hello-2.1.1

$ ./result/bin/hello
Hello, world!

$ ls -l result
lrwxrwxrwx 1 roman users 55 11-23 00:16 result -> /nix/store/6q9ig9ifam51j3hr652jgl4cs6jhp9mf-hello-2.1.1

# no undo nix-build, just remove link, it will be garbage-collected eventually
$ rm result
```

- [Manual's build example doesn't build · Issue #2259 · NixOS/nix](https://github.com/NixOS/nix/issues/2259#issuecomment-562535897)
- https://discourse.nixos.org/t/how-to-undo-nix-build/5433/2
