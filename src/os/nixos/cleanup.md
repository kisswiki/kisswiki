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

## Remove latest generation

```bash
λ ls /nix/var/nix/profiles/
drwxr-xr-x  - root 23 Dec  2020  per-user
lrwxrwxrwx 15 root 14 Oct 11:41  system -> system-105-link # Note: points to a *previous* generation.
lrwxrwxrwx 88 root  1 Oct 12:38  system-105-link -> /nix/store/cdlxkpcrz9pyrb9sjkwgjmrj06ai7zvp-nixos-system-moby-21.11pre319562.c21ba4f7bb4
lrwxrwxrwx 88 root 14 Oct 11:36  system-106-link -> /nix/store/73cny4fm4jfnqdzfm1vkz7xrj2rq4m2v-nixos-system-moby-21.11pre322478.e4ef597edfd
λ exa -l /boot/loader/entries/
.rwxr-xr-x 433 root 14 Oct 11:41 nixos-generation-105.conf
.rwxr-xr-x 433 root 14 Oct 11:41 nixos-generation-106.conf
λ doas rm /nix/var/nix/profiles/system-106-link
λ doas rm /boot/loader/entries/nixos-generation-106.conf
```

https://discourse.nixos.org/t/how-to-remove-broken-newer-boot-entry/15457/2
