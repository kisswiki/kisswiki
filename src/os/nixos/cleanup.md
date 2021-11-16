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

Below instructions are incomplete. I got error "No space left on device" when doing `sudo nixos-rebuild switch` or `sudo nixos-rebuild boot`. I needed to

```bash
$ cd /
$ sudo tar cf Fonts.tar.gz boot/Boot/Fonts/
$ sudo rm -rf boot/Boot/Fonts/
$ sudo tar cf Microsoft.tar.gz boot/EFI/Microsoft/
$ sudo rm -rf boot/EFI/Microsoft/
$ sudo nixos-rebuild switch
$ tar xf Fonts.tar.gz
$ tar xf Microsoft.tar.gz
```

or maybe better to `mount -o bind`?

```bash
$ sudo cp -r /boot/EFI/nixos /
$ sudo rm -rf /boot/EFI/nixos/*
$ sudo mount -o bind /nixos/ /boot/EFI/nixos/
$ sudo nixos-rebuild switch
$ sudo umount /boot/EFI/nixos/
$ cat /boot/loader/entries/nixos-generation-53.conf
title NixOS
version Generation 53 NixOS 21.05.4116.46251a79f75, Linux Kernel 5.10.79, Built on 2021-11-15
linux /efi/nixos/qdk8kpz6pqk8cl8lqw6shjynaypkw43x-linux-5.10.79-bzImage.efi
initrd /efi/nixos/jcq7rr2wdkr28sa67bm5z4xd542x7kvf-initrd-linux-5.10.79-initrd.efi
options init=/nix/store/7941wd5q4spfmyi6i91da411v960v725-nixos-system-msi-laptop-21.05.4116.46251a79f75/init pci=realloc loglevel=4
machine-id 0221dbc79be643a18c77995d5516b0a5
$ sudo cp /nixos/dk8kpz6pqk8cl8lqw6shjynaypkw43x-linux-5.10.79-bzImage.efi /boot/EFI/nixos/
$ sudo cp /nixos/jcq7rr2wdkr28sa67bm5z4xd542x7kvf-initrd-linux-5.10.79-initrd.efi /boot/EFI/nixos/
```

- https://github.com/NixOS/nixpkgs/issues/23926#issuecomment-940438117
- https://ramsdenj.com/2016/04/15/multi-boot-linux-with-one-boot-partition.html

Another solutions are:

- switch to grub https://github.com/NixOS/nixpkgs/issues/23926#issuecomment-320370183
- create new 1GB EFI partition

### Old

```bash
$ ls -l /nix/var/nix/profiles/
drwxr-xr-x  - root 23 Dec  2020  per-user
lrwxrwxrwx 15 root 14 Oct 11:41  system -> system-105-link # Note: points to a *previous* generation.
lrwxrwxrwx 88 root  1 Oct 12:38  system-105-link -> /nix/store/cdlxkpcrz9pyrb9sjkwgjmrj06ai7zvp-nixos-system-moby-21.11pre319562.c21ba4f7bb4
lrwxrwxrwx 88 root 14 Oct 11:36  system-106-link -> /nix/store/73cny4fm4jfnqdzfm1vkz7xrj2rq4m2v-nixos-system-moby-21.11pre322478.e4ef597edfd
$ ls -l /boot/loader/entries/
.rwxr-xr-x 433 root 14 Oct 11:41 nixos-generation-105.conf
.rwxr-xr-x 433 root 14 Oct 11:41 nixos-generation-106.conf
$ sudo rm /nix/var/nix/profiles/system-106-link
$ sudo rm /boot/loader/entries/nixos-generation-106.conf
```

https://discourse.nixos.org/t/how-to-remove-broken-newer-boot-entry/15457/2
