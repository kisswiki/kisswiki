Normally you can just run sudo `nixos-rebuild switch` which will replace your `grub.cfg` with only the live system profiles. The live system profiles are the symlinks `/nix/var/nix/profiles`. However, this does not work if you do not have a configuration.nix on your NixOS box like with many server deployments.

In that case you can run, as root, n`ix-env --delete-generations old --profile /nix/var/nix/profiles/system` followed by `/nix/var/nix/profiles/system/bin/switch-to-configuration switch`.

Running `nix-env --delete-generations old --profile /nix/var/nix/profiles/system` will remove all but the newest system garbage collection roots and `/nix/var/nix/profiles/system/bin/switch-to-configuration switch` will reload the system configuration you are already on and update `grub.cfg` with only the live system profiles. Thus your `grub.cfg` will only have one entry in it and you have not had to change your system configuration. If you want to then garbage collect the old profiles you can run `nix-store --gc` .

`nix-collect-garbage -d` does not clean grub boot entries. Remember it is a Nix tool, not a NixOS tool. It would be really strange if your Nix installation on say a Debian system was editing your grub boot entries, see [issue 3542](https://github.com/NixOS/nixpkgs/issues/3542).

- https://discourse.nixos.org/t/how-to-remove-grub-entries-in-grub-cfg/9059
- https://nixos.org/manual/nix/stable/package-management/garbage-collection.html
- https://nixos.org/guides/nix-pills/garbage-collector.html
- https://nixos.wiki/wiki/Storage_optimization
- https://ianthehenry.com/posts/how-to-learn-nix/garbage-collection/
- https://jorel.dev/NixOS4Noobs/garbage.html
