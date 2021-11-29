## Only ascii characters in user name

> Removing the file /var/lib/nixos/uid-map and making sure that you don’t put non ascii characters in usernames should solve the issue

- https://discourse.nixos.org/t/running-activation-script-takes-several-minutes/9085/7
- [uid-map gets corrupted by Unicode usernames · Issue #80426 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/issues/80426)
