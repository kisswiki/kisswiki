Normally you can just run sudo `nixos-rebuild switch` which will replace your `grub.cfg` with only the live system profiles. The live system profiles are the symlinks `/nix/var/nix/profiles`. However, this does not work if you do not have a configuration.nix on your NixOS box like with many server deployments.

In that case you can run, as root, `nix-env --delete-generations old --profile /nix/var/nix/profiles/system` followed by `/nix/var/nix/profiles/system/bin/switch-to-configuration switch`.

Running `nix-env --delete-generations old --profile /nix/var/nix/profiles/system` will remove all but the newest system garbage collection roots and `/nix/var/nix/profiles/system/bin/switch-to-configuration switch` will reload the system configuration you are already on and update `grub.cfg` with only the live system profiles. Thus your `grub.cfg` will only have one entry in it and you have not had to change your system configuration. If you want to then garbage collect the old profiles you can run `nix-store --gc` .

`nix-collect-garbage -d` does not clean grub boot entries. Remember it is a Nix tool, not a NixOS tool. It would be really strange if your Nix installation on say a Debian system was editing your grub boot entries, see [issue 3542](https://github.com/NixOS/nixpkgs/issues/3542).

- https://discourse.nixos.org/t/how-to-remove-grub-entries-in-grub-cfg/9059
- https://nixos.org/manual/nix/stable/package-management/garbage-collection.html
- https://nixos.org/guides/nix-pills/garbage-collector.html
- https://nixos.wiki/wiki/Storage_optimization
- https://ianthehenry.com/posts/how-to-learn-nix/garbage-collection/
- https://jorel.dev/NixOS4Noobs/garbage.html

## Clean user profiles

```bash
$ ls -l /nix/var/nix/profiles
total 84
lrwxrwxrwx 1 root root   15 Nov 16 16:08 default -> default-24-link
lrwxrwxrwx 1 root root   60 Nov 13 15:37 default-20-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 11:17 default-21-link -> /nix/store/rkf0xn46wbk2fk65727isjfx17b0hlbv-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 11:45 default-22-link -> /nix/store/zyxnpa4d5bkfz2m33148iymv0dy1mvzj-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 14:47 default-23-link -> /nix/store/m9mgm1y3l9cgl06917vpy591bi20kqy3-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 16:08 default-24-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
drwxr-xr-x 4 root root 4096 Nov  9 20:19 per-user
lrwxrwxrwx 1 root root   14 Nov 16 16:10 system -> system-58-link
lrwxrwxrwx 1 root root   90 Nov 15 19:21 system-44-link -> /nix/store/mwjr5p4plwi6j74l54b51vg10hr81dh7-nixos-system-msi-laptop-21.05.4114.195d5816cdd
lrwxrwxrwx 1 root root   90 Nov 15 20:15 system-45-link -> /nix/store/2k26glrlmfkz1b30q5322ircrsab71a4-nixos-system-msi-laptop-21.05.4114.195d5816cdd
lrwxrwxrwx 1 root root   90 Nov 15 20:26 system-46-link -> /nix/store/j7id99pk2fgssvsi4yqxcwyrwjjwzfn0-nixos-system-msi-laptop-21.05.4114.195d5816cdd
lrwxrwxrwx 1 root root   90 Nov 15 21:09 system-47-link -> /nix/store/kh5mhf1hypwzngyw0k7845h1l27vp9vk-nixos-system-msi-laptop-21.05.4114.195d5816cdd
lrwxrwxrwx 1 root root   90 Nov 15 22:44 system-48-link -> /nix/store/4hzpip0zlqcwvfc38xwlx4mvdcfb57ls-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 15 22:51 system-49-link -> /nix/store/7941wd5q4spfmyi6i91da411v960v725-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 16 10:02 system-50-link -> /nix/store/r8zavkzmnwp4pcw3wm81wzfv459w2bbl-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 16 10:19 system-51-link -> /nix/store/jvakaz5fa9v72npfzxph72jdpspj7kay-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 16 11:41 system-52-link -> /nix/store/78w4vqm33x0vzxgsq6ssmfyzk28zr4pk-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 16 11:50 system-53-link -> /nix/store/7941wd5q4spfmyi6i91da411v960v725-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 16 12:46 system-54-link -> /nix/store/81f8dpxy9imbr6w2qk4fhba8qm6jrn6m-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 16 12:52 system-55-link -> /nix/store/a43m2xazl5xrxvfx18rcpkplpsglid0d-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 16 12:57 system-56-link -> /nix/store/qa93n5f4pxb6v749kqw99wq3xbvaxv26-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 16 13:02 system-57-link -> /nix/store/7941wd5q4spfmyi6i91da411v960v725-nixos-system-msi-laptop-21.05.4116.46251a79f75
lrwxrwxrwx 1 root root   90 Nov 16 16:10 system-58-link -> /nix/store/6c3dsjh685j6d2fqach3r0vkixrbcci2-nixos-system-msi-laptop-21.05.4116.46251a79f75

$ sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
removing generation 44
removing generation 45
removing generation 46
removing generation 47
removing generation 48
removing generation 49
removing generation 50
removing generation 51
removing generation 52
removing generation 53
removing generation 54
removing generation 55
removing generation 56
removing generation 57

$ sudo /nix/var/nix/profiles/system/bin/switch-to-configuration switch
stopping the following units: accounts-daemon.service
NOT restarting the following changed units: systemd-fsck@dev-disk-by\x2duuid-DCF7\x2d772A.service
activating the configuration...
setting up /etc...
reloading user units for roman...
/home/roman/.bashrc: line 34: lsb_release: command not found
/home/roman/.bashrc: line 42: fnm: command not found
/home/roman/.bashrc: line 60: direnv: command not found
setting up tmpfiles
reloading the following units: dbus.service
restarting the following units: polkit.service
starting the following units: accounts-daemon.service

$ sudo nixos-rebuild switch
building Nix...
building the system configuration...
activating the configuration...
setting up /etc...
reloading user units for roman...
/home/roman/.bashrc: line 34: lsb_release: command not found
/home/roman/.bashrc: line 42: fnm: command not found
/home/roman/.bashrc: line 60: direnv: command not found
setting up tmpfiles

$ ls -l /nix/var/nix/profiles
total 28
lrwxrwxrwx 1 root root   15 Nov 16 16:08 default -> default-24-link
lrwxrwxrwx 1 root root   60 Nov 13 15:37 default-20-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 11:17 default-21-link -> /nix/store/rkf0xn46wbk2fk65727isjfx17b0hlbv-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 11:45 default-22-link -> /nix/store/zyxnpa4d5bkfz2m33148iymv0dy1mvzj-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 14:47 default-23-link -> /nix/store/m9mgm1y3l9cgl06917vpy591bi20kqy3-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 16:08 default-24-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
drwxr-xr-x 4 root root 4096 Nov  9 20:19 per-user
lrwxrwxrwx 1 root root   14 Nov 16 16:14 system -> system-58-link
lrwxrwxrwx 1 root root   90 Nov 16 16:10 system-58-link -> /nix/store/6c3dsjh685j6d2fqach3r0vkixrbcci2-nixos-system-msi-laptop-21.05.4116.46251a79f75

$ nix-env --delete-generations old
removing generation 13
removing generation 14
removing generation 15

$ ls -l /nix/var/nix/profiles
total 28
lrwxrwxrwx 1 root root   15 Nov 16 16:08 default -> default-24-link
lrwxrwxrwx 1 root root   60 Nov 13 15:37 default-20-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 11:17 default-21-link -> /nix/store/rkf0xn46wbk2fk65727isjfx17b0hlbv-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 11:45 default-22-link -> /nix/store/zyxnpa4d5bkfz2m33148iymv0dy1mvzj-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 14:47 default-23-link -> /nix/store/m9mgm1y3l9cgl06917vpy591bi20kqy3-user-environment
lrwxrwxrwx 1 root root   60 Nov 16 16:08 default-24-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
drwxr-xr-x 4 root root 4096 Nov  9 20:19 per-user
lrwxrwxrwx 1 root root   14 Nov 16 16:14 system -> system-58-link
lrwxrwxrwx 1 root root   90 Nov 16 16:10 system-58-link -> /nix/store/6c3dsjh685j6d2fqach3r0vkixrbcci2-nixos-system-msi-laptop-21.05.4116.46251a79f75

$ sudo nix-collect-garbage -d
removing old generations of profile /nix/var/nix/profiles/per-user/root/channels
removing generation 3
removing old generations of profile /nix/var/nix/profiles/per-user/roman/profile
removing old generations of profile /nix/var/nix/profiles/per-user/roman/channels
removing old generations of profile /nix/var/nix/profiles/default
removing generation 20
removing generation 21
removing generation 22
removing generation 23
removing old generations of profile /nix/var/nix/profiles/system
finding garbage collector roots...
deleting garbage...
deleting '/nix/store/rkf0xn46wbk2fk65727isjfx17b0hlbv-user-environment'
deleting '/nix/store/zyxnpa4d5bkfz2m33148iymv0dy1mvzj-user-environment'
deleting '/nix/store/zl5w9ljc0rq1zi6ma3jkbcjkvldqcxad-user-environment'
deleting '/nix/store/m9mgm1y3l9cgl06917vpy591bi20kqy3-user-environment'
deleting '/nix/store/xrgwbx6vpn2djpnp1576kaf5110pxfcr-user-environment.drv'
deleting '/nix/store/9mb4v4vx3lqhbidm7gb5ad84hfz3hcbh-env-manifest.nix'
deleting '/nix/store/a6ca6jr6w5mn08ap7ir821j796fhf67y-user-environment.drv'
deleting '/nix/store/9cqdvnpj01sw4apbixsx7hxnlx3pw88b-nixos-21.05.4114.195d5816cdd.drv'
deleting '/nix/store/zhz2wvkn35d1sydps613q9nhgq4f0r96-user-environment.drv'
deleting '/nix/store/v76lsprcqvi36za9k3i044pkcax24gh9-env-manifest.nix'
deleting '/nix/store/j505z0gblrklwcb608wnsmpfyr2qikfp-nixos-21.05.4114.195d5816cdd'
deleting '/nix/store/bpxggxy9hf86m67l7xygg6yyhis6s4rl-nixexprs.tar.xz'
deleting '/nix/store/0gg79sjhc1iw11w0zda3d47bngx34icx-user-environment.drv'
deleting '/nix/store/70wkb7faghs8kvf9q9bmxv9ln944ccax-env-manifest.nix'
deleting '/nix/store/v257g42210d992g3i47r0zms9y4m5gwv-env-manifest.nix'
deleting '/nix/store/trash'
deleting unused links...
note: currently hard linking saves -0.00 MiB
15 store paths deleted, 105.31 MiB freed

$ ls -l /nix/var/nix/profiles
total 12
lrwxrwxrwx 1 root root   15 Nov 16 16:08 default -> default-24-link
lrwxrwxrwx 1 root root   60 Nov 16 16:08 default-24-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
drwxr-xr-x 4 root root 4096 Nov  9 20:19 per-user
lrwxrwxrwx 1 root root   14 Nov 16 16:14 system -> system-58-link
lrwxrwxrwx 1 root root   90 Nov 16 16:10 system-58-link -> /nix/store/6c3dsjh685j6d2fqach3r0vkixrbcci2-nixos-system-msi-laptop-21.05.4116.46251a7

$ nix-store --gc
finding garbage collector roots...
deleting garbage...
deleting '/nix/store/trash'
deleting unused links...
note: currently hard linking saves -0.00 MiB
0 store paths deleted, 0.00 MiB freed

$ sudo nix-store --gc
Sorry, try again.
[sudo] password for roman:
finding garbage collector roots...
deleting garbage...
deleting '/nix/store/trash'
deleting unused links...
note: currently hard linking saves -0.00 MiB
0 store paths deleted, 0.00 MiB freed
$ nix-store --gc --print-roots | grep roman
/home/roman/result -> /nix/store/vcnygvy7d6r23pgw3fw70n8azmxifvvs-nixos-system-nixos-21.05.4044.e74894146a4
/nix/var/nix/profiles/per-user/roman/channels-1-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
/nix/var/nix/profiles/per-user/roman/profile-16-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment

$ sudo nix-store --gc --print-roots | grep roman
/home/roman/result -> /nix/store/vcnygvy7d6r23pgw3fw70n8azmxifvvs-nixos-system-nixos-21.05.4044.e74894146a4
/nix/var/nix/profiles/per-user/roman/channels-1-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
/nix/var/nix/profiles/per-user/roman/profile-16-link -> /nix/store/57904rflsfh46y7fxi62rzc7sidc9vmq-user-environment
```

- [Removing a user does not remove its profile · Issue #4419 · NixOS/nix](https://github.com/NixOS/nix/issues/4419)

## nixos-rebuild switch - "No space left on device"

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
# also copy previous if needed
$ cat /boot/loader/entries/nixos-generation-52.conf
title NixOS
version Generation 52 NixOS 21.05.4116.46251a79f75, Linux Kernel 5.10.79, Built on 2021-11-16
linux /efi/nixos/qdk8kpz6pqk8cl8lqw6shjynaypkw43x-linux-5.10.79-bzImage.efi
initrd /efi/nixos/jcq7rr2wdkr28sa67bm5z4xd542x7kvf-initrd-linux-5.10.79-initrd.efi
options init=/nix/store/78w4vqm33x0vzxgsq6ssmfyzk28zr4pk-nixos-system-msi-laptop-21.05.4116.46251a79f75/init pci=realloc loglevel=4
machine-id 0221dbc79be643a18c77995d5516b0a5
$ sudo cp /nixos/qdk8kpz6pqk8cl8lqw6shjynaypkw43x-linux-5.10.79-bzImage.efi /boot/EFI/nixos/
```

- https://github.com/NixOS/nixpkgs/issues/23926#issuecomment-940438117
  - my solution https://github.com/NixOS/nixpkgs/issues/23926#issuecomment-970185668
- https://ramsdenj.com/2016/04/15/multi-boot-linux-with-one-boot-partition.html

Another solutions are:

- switch to grub https://github.com/NixOS/nixpkgs/issues/23926#issuecomment-320370183
- create new 1GB EFI partition

- [linux - How to enlarge Windows 10 EFI partition - Super User](https://superuser.com/questions/-106092/how-to-enlarge-windows-10-efi-partition)
- [nixos/DUAL_BOOT_WINDOWS_GUIDE.md at master · andywhite37/nixos](https://github.com/andywhite37/-ixos/blob/master/DUAL_BOOT_WINDOWS_GUIDE.md)
- [EFI system partitions and NixOS : NixOS](https://www.reddit.com/r/NixOS/comments/7econ7/-fi_system_partitions_and_nixos/)
- [Multi Boot Linux With One Boot Partition | John Ramsden](https://ramsdenj.com/2016/04/15/-ulti-boot-linux-with-one-boot-partition.html)
- [linux - How do i resize EFI partition when there is a Microsoft reserved partition in the way? - -uper User](https://superuser.com/questions/1476988/-ow-do-i-resize-efi-partition-when-there-is-a-microsoft-reserved-partition-in-th)
- [How can I enlarge the EFI partition on a dual boot-system with Windows and Linux? - Super User]-https://superuser.com/questions/1225074/-ow-can-i-enlarge-the-efi-partition-on-a-dual-boot-system-with-windows-and-linux)
- [linux - Can't resize /boot partition (fat32 / EFI system partition) - Unix & Linux Stack Exchange]-https://unix.stackexchange.com/questions/392137/-ant-resize-boot-partition-fat32-efi-system-partition)
- [linux - How to resize the EFI System Partition? - Super User](https://superuser.com/questions/1230741/how-to-resize-the-efi-system-partition)

## Remove latest generation - incomplete

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
