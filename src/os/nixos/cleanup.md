`nix-collect-garbage -d`

- https://nixos.org/manual/nix/stable/package-management/garbage-collection.html
- https://nixos.org/guides/nix-pills/garbage-collector.html
- https://nixos.wiki/wiki/Storage_optimization
- https://ianthehenry.com/posts/how-to-learn-nix/garbage-collection/
- https://jorel.dev/NixOS4Noobs/garbage.html

## remove entries from boot

If your /boot partition runs out of space, after clearing old profiles you must rebuild your system with nixos-rebuild to update the /boot partition and clear space.

- https://github.com/NixOS/nixpkgs/issues/3542
- https://discourse.nixos.org/t/how-to-remove-grub-entries-in-grub-cfg/9059
- https://gsc.io/70266391-48a6-49be-ab5d-acb5d7f17e76-nixos/doc/nixos-manual/html/sec-nix-gc.html
