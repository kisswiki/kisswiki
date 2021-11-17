```bash
# google: nixos iso unstable
# https://nixos.org/manual/nixos/unstable/index.html#ch-installation
# https://nixos.org/download.html
$ curl -OJLN https://channels.nixos.org/nixos-21.05/latest-nixos-gnome-x86_64-linux.iso
# https://nixos.org/manual/nixos/unstable/index.html#sec-booting-from-usb
$ lsblk
$ sudo dd if=nixos-gnome-21.05.4044.e74894146a4-x86_64-linux.iso of=/dev/sda
```

```
$ sudo passwd root
$ su -
$ mkdir /mnt/boot
```

## canTouchEfiVariables

> a buggy UEFI that doesn’t support canTouchEfiVariables = true. Almost all hardware supports this properly.
> https://discourse.nixos.org/t/20-03-uefi-installation-problem-vs-instructions/7783/4

## ntfs

- https://nixos.wiki/wiki/NTFS
- https://gist.github.com/jonringer/8daf59f9aab3ce7a660903193594ae7f
- https://unix.stackexchange.com/questions/213137/how-to-auto-mount-permanently-mount-external-devices-on-nixos

## nodejs

`nix-env -f '<nixpkgs>' -iA nodejs`

## font

look at `configuration.nix`

## /bin/bash bad interpreter

Use `#!/usr/bin/env bash` as here https://www.reddit.com/r/NixOS/comments/k8ja54/nixos_running_scripts_problem/ or some other solution from https://discourse.nixos.org/t/add-bin-bash-to-avoid-unnecessary-pain/5673/38

## keyboard

set in /etc/nixos/configuration.nix

- https://nixos.wiki/wiki/Keyboard_Layout_Customization
- https://www.reddit.com/r/NixOS/comments/ec79ch/setting_the_keyboard_layout_on_nixos_with_sway/

## bootloader, efi, uefi - nixos not selected as default

I needed to disable secure boot and also set in bios boot order to Linux Boot Manager.

Entries deleted with `sudo efibootmgr -b 1 -B` where not deleted really.

- https://superuser.com/questions/1166398/efi-settings-set-via-efibootmgr-are-ignored-after-reboot/1607683#1607683
- https://github.com/rhboot/efibootmgr/issues/19#issuecomment-71719650
- maybe relevant https://github.com/NixOS/nixpkgs/issues/55332#issuecomment-461688900

### Old

```bash
$ sudo nix-env -iA nixos.efibootmgr
$ efibootmgr
BootCurrent: 0005
Timeout: 2 seconds
BootOrder: 0001,0005,0006,0007,0000
Boot0000* Linux Boot Manager
Boot0001* Windows Boot Manager
Boot0005* Fedora
Boot0006* debian
Boot0007* ubuntu
```

Somehow nixos boots when I select Fedora entry. But by default Windows boots and I have to press F11 during startup to select boot 5.

nixos changed this setting in wrong way. So now I am removing all entries except Fedora and Linux Boot Managar.

BTW. What is Linux Boot Manager entry?

```bash
$ sudo efibootmgr -b 1 -B # remove 1 entry, proceed with other entries like this
$ efibootmgr -b 5 -L nixos
$ sudo efibootmgr -o 5    # explicitly set boot order, and with only 5 entry
BootCurrent: 0005
Timeout: 2 seconds
BootOrder: 0005
Boot0000* Linux Boot Manager
Boot0005* Fedora
```

It looks like 0001 entry is systemd added by nixos

```bash
efibootmgr -v
BootCurrent: 0005
Timeout: 2 seconds
BootOrder: 0005
Boot0000* Linux Boot Manager	HD(2,GPT,2b95e4aa-736e-45a8-b654-9330261c002f,0x96800,0x32000)/File(\EFI\SYSTEMD\SYSTEMD-BOOTX64.EFI)
Boot0005* Fedora	HD(2,GPT,2b95e4aa-736e-45a8-b654-9330261c002f,0x96800,0x32000)/File(\EFI\FEDORA\SHIM.EFI)..BO
```

https://nixos.wiki/wiki/Bootloader

I have made a post on reddit
https://www.reddit.com/r/debian/comments/qqxd95/secure_boot_could_not_be_determined_mode_0/

## Sound

I have this in /etc/nixos/configuration.nix

```nix
  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
```

but sound on youtube works.

## gnome

### alt+tab to switch between windows not applications

```
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
```

https://superuser.com/questions/394376/how-to-prevent-gnome-shells-alttab-from-grouping-windows-from-similar-apps/1517491#1517491

## I am on stable channel

```bash
$ sudo nix-channel --list
nixos https://nixos.org/channels/nixos-21.05
```

- https://github.com/NixOS/nixpkgs/issues/103049#issuecomment-771607718

## Docker

/etc/nixos/configuration.nix:

```
{
  users.users.<myuser>.extraGroups = [ "docker" ];
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
}
```

- https://nixos.wiki/wiki/Docker
- https://stackoverflow.com/questions/56763989/dockerd-not-running-on-nixos
- https://github.com/NixOS/nixpkgs/issues/27637

## Google Chrome

### Install

/etc/nixos/configuration.nix:

```
{
  nixpkgs.config.allowUnfree = true;
}
```

`nix-env -iA nixos.google-chrome`

- https://unix.stackexchange.com/questions/429765/howto-install-google-chrome-in-nixos
- https://nixos.wiki/wiki/Chromium

### Slow

Starts slowly and always restores

## Stylus extensions needed to reenable sync

Disble Google, enable and then it worked.

## git bisect nixos

https://discourse.nixos.org/t/browsers-unbearably-slow-after-update/9414/9

## Keyboard

This does not work:

/etc/nixos/configuration.nix:

```
{
  services.xserver.layout = "pl";
}
```

Probably because I am using wayland. No I do `Gnome Settings > Keyboard > Input Sources > Polish` and switching in widget to pl or remove other input sources.

https://nixos.wiki/wiki/Keyboard_Layout_Customization

## Chroot to debian

```
$ su -
# mount /dev/disk/by-label/debian /mnt
# lsblk
# ls /sys/firmware/efi/efivars/
# mount /dev/nvme0n1p2 /mnt/boot/efi
# for i in /dev /dev/pts /proc /sys /sys/firmware/efi/efivars /run; do sudo mount -B $i /mnt$i; done
# chroot /mnt /bin/bash
# export PATH=/bin:/usr/bin:/usr/sbin
# grub-install /dev/nvme0n1p7
# update-grub
Generating grub configuration file ...
Found background image: /usr/share/images/desktop-base/desktop-grub.png
Found linux image: /boot/vmlinuz-5.10.0-8-amd64
Found initrd image: /boot/initrd.img-5.10.0-8-amd64
grub-probe: error: cannot find a GRUB drive for /dev/sda1.  Check your device.map.
Found Windows Boot Manager on /dev/nvme0n1p2@/EFI/Microsoft/Boot/bootmgfw.efi
Adding boot menu entry for EFI firmware configuration
done
```

- https://nixos.wiki/wiki/Change_root
- https://discourse.nixos.org/t/using-chroot-inside-nixos/3488/2
- https://unix.stackexchange.com/questions/128046/chroot-failed-to-run-command-bin-bash-no-such-file-or-directory

## MongoError: Unrecognized pipeline stage name: '$unset'

> Is this a part of a query or aggregation?
>
> If this is a part of aggregation, please change Mongo version to 4.2+
>
> It was not yet available in version 4.0

https://github.com/shelfio/jest-mongodb/issues/250#issuecomment-875625745

```bash
$ mongo --version
MongoDB shell version v3.4.24
git version: 865b4f6a96d0f5425e39a18337105f33e8db504d
OpenSSL version: OpenSSL 1.1.1l  24 Aug 2021
allocator: tcmalloc
modules: none
build environment:
    distarch: x86_64
    target_arch: x86_64
```

https://search.nixos.org/packages?channel=21.05&show=mongodb-4_2&from=0&size=50&sort=relevance&type=packages&query=mongodb

shows `nix-env -iA nixos.mongodb-4_2`

```bash
$ nix-env -qa mongodb
mongodb-3.4.24
mongodb-3.4.24
mongodb-3.6.13
mongodb-4.0.12
mongodb-4.2.8
```

`nix-env -e mongodb`

In /etc/nixos/configuration.nix

```nix
{
  environment.systemPackages = with pkgs; [
     nixos.mongodb-4_2
  ];
}
```

`sudo nixos-rebuild switch`

## What package does file not installed belongs?

```bash
$ nix shell nixpkgs#nix-index -c nix-locate bin/winbind | grep -v '('
samba.out                                     1,197,000 x /nix/store/p4f487yncvnl7z6ibikvqwswz609zf6a-samba-4.14.4/bin/winbindd
```

## Misc

- https://superuser.com/questions/1501948/nixos-setting-package-configuration-globally-for-all-packages
- https://unix.stackexchange.com/questions/634137/how-to-force-nix-to-install-packages-by-building-them-locally-instead-of-downl

## gitk

install gitFull defined here https://github.com/NixOS/nixpkgs/blob/nixos-21.05/pkgs/top-level/all-packages.nix#L23891

or you can override but this will not download binary from hydra, instead will compile.

in /etc/nixos/configuration.nix

```nix
  environment.systemPackages = with pkgs; [
    tlc
    tk
    (git.override { guiSupport = true; })
  ];
```

https://github.com/Th3Whit3Wolf/nixos/blob/a8c6e2987b342ff9d2c5953154ba4d5d59989bb1/hosts/tardis/users/doc.nix#L36

or with `let .. in`:

```nix
{ config, pkgs, ... }:

let
  gitandgui = pkgs.git.override { guiSupport = true; };
in
{
  environment.systemPackages = with pkgs; [
    tlc
    tk
    guiandgui
  ];
}
```

- https://www.reddit.com/r/NixOS/comments/g02tbj/overriding_a_package_checksum_in_configurationnix/

And this:

```nix
  # The full-featured Git.
  gitFull = appendToName "full" (git.override {
    svnSupport = true;
    guiSupport = true;
    sendEmailSupport = stdenv.isDarwin == false;
  });
```

- https://github.com/rbvermaa/nixpkgs-svn/blob/c3ad7707c32a41b1361ace949830942926d634b2/pkgs/applications/version-management/git-and-tools/default.nix#L31
- https://github.com/nix-community/nur-combined/blob/e55faf5edb259fb107153f9dd44e56e49d5c37c1/repos/milahu/pkgs/svn2github/default.nix#L16

There is also:

```nix
xfce =pkgs.xfce // {thunar = overrideDerivation pkgs.xfce.thunar ... }
```

https://nix-dev.science.uu.narkive.com/2jd5ZLyb/how-to-overwrite-a-derivation-in-nix

## Upgrade nixos

`sudo nixos-rebuild switch --upgrade`

`sudo nixos-rebuild dry-run --upgrade`

- https://discourse.nixos.org/t/how-to-upgrade-packages/6151/5
- https://dopp.sk/posts/NixOS_channels/
  - https://www.reddit.com/r/NixOS/comments/mrz46z/comment/gupjm73/
- https://stackoverflow.com/questions/41230430/how-do-i-upgrade-my-system-to-nixos-unstable

## There is not enough space in efi partition

Remove entries and then directories so the entries are not rebuilt.

```bash
$ sudo efibootmgr -v
$ sudo efibootmgr -b 5 -B
$ rm -rf /boot/EFI/ubuntu
```

- https://askubuntu.com/questions/63610/how-do-i-remove-ubuntu-in-the-bios-boot-menu-uefi/63613#63613
- https://superuser.com/questions/930725/how-to-delete-os-from-boot-menu/931016#931016
- https://unix.stackexchange.com/questions/205177/how-to-clean-up-bootloaders-uefi-entries-from-other-installs

## efi

changing the boot order fails, but inactivating all Windows entries (0000, 0002) helps:

```bash
$ efibootmgr -b 0 -A
$ efibootmgr -b 2 -A
```

- https://askubuntu.com/questions/485261/change-boot-order-using-efibootmgr/1362020#1362020

## Breaktimer not available in nixos

- https://repology.org/project/breaktimer/versions
- https://github.com/tom-james-watson/breaktimer-app

There is https://apps.kde.org/rsibreak/ or https://github.com/cdepillabout/break-time

## running webpack scripts with watching enabled in vscode integrated terminal causes system to crawl

I use tilix instead and it works good. And it has vertical splitting.

ctrl+alt+r to open terminal on the right

I have also enabled "Run command as a login shell" as I got some warning from tilix https://gnunn1.github.io/tilix-web/manual/vteconfig/

## Use configuration.nix for installing

Uninstall imperatively installed:

`nix-env -e $(nix-env -q)`

## uninstall fails silently

```bash
$ sudo nix-env -e nixos.nvd

$ sudo nix-env -q
nvd-0.1.1

$ sudo nix-env -e nvd
uninstalling 'nvd-0.1.1'
```

## Switching to nixos-unstable channel

To try flakes I need unstable (?) bc nix profile does not work with `nix-env -f '<nixpkgs>' -iA nixUnstable` from https://serokell.io/blog/practical-nix-flakes

I got this problem https://discourse.nixos.org/t/nix-profile-install-cannot-add-path-lacks-a-valid-signature/16106/4

I have changed `/etc/nixos/configuration.nix`:

```nix
{
    # /etc/nix/nix.conf is read-only
    # https://unix.stackexchange.com/questions/544340/nixos-unable-to-modify-or-chmod-nix-config-etc-nix-nix-conf
    # https://github.com/NixOS/nixpkgs/issues/80332#issuecomment-587540348
    # https://nixos.org/manual/nix/unstable/command-ref/conf-file.html
    nix = {                                                                     \  boot.kernel.sysctl."kernel.sysrq" = 1;
    #gc.automatic = false;                                                    \
    #optimise.automatic = true;                                               \  #hardware = {
    #readOnlyStore = true;                                                    \  #  opengl = {
    #useSandbox = true;                                                       \  #    driSupport = true;
    #package = pkgs.nixUnstable;                                              \  #    driSupport32Bit = true;
    extraOptions = ''                                                         \  #  };
      experimental-features = nix-command                                     \
    '';                                                                       \  #  nvidia = {
  };
}
```

Then

```bash
$ su -
$ nix-channel --list
nixos https://nixos.org/channels/nixos-21.05
# if you add unstable with the same local name as your stable channel (nixos), it'll just replace the current one
# https://www.reddit.com/r/NixOS/comments/pu6zk0/comment/he2u9f5/
$ nix-channel --add https://nixos.org/channels/nixos-unstable nixos
$ nix-channel --list
nixos https://nixos.org/channels/nixos-unstable
# https://nixos.org/manual/nix/stable/installation/upgrading.html
$ nix-channel --update; nix-env -iA nixos.nix nixos.cacert; systemctl daemon-reload; systemctl restart nix-daemon
$ nvim /etc/nixos/configuration.nix
$ nixos-rebuild switch
$ nix-shell -p nix-info --run "nix-info -m"
 - system: `"x86_64-linux"`
 - host os: `Linux 5.10.79, NixOS, 21.05.4116.46251a79f75 (Okapi)`
 - multi-user?: `yes`
 - sandbox: `yes`
 - version: `nix-env (Nix) 2.4`
 - channels(root): `"nixos-21.11pre331460.931ab058daa"`
 - channels(roman): `""`
 - nixpkgs: `/nix/var/nix/profiles/per-user/root/channels/nixos`
```

I have reverted to stable channel and added this to configuration.nix:

```
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
```

##

https://github.com/NixOS/nixpkgs/tree/nixos-21.05 is older then https://github.com/NixOS/nixpkgs/tree/release-21.05

## mount internal drive accessible to normal user

```nix
{
  fileSystems."/media/debian" =
    { device = "/dev/disk/by-label/debian";
      fsType = "ext4";
      options = [ "defaults" "x-gvfs-show" ];
    };
}
```

https://unix.stackexchange.com/questions/533265/how-to-mount-internal-drives-as-a-normal-user-in-nixos/626245#626245

## What does the <nixpkgs> string / value mean in Nix?

A colon-separated list of directories used to look up Nix expressions enclosed in angle brackets (i.e., <path>).

```bash
$ echo $NIX_PATH
/home/roman/.nix-defexpr/channels:nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels
```

- https://stackoverflow.com/questions/57013604/what-is-the-nix-expression-nixpkgs/57013777#57013777
- https://newbedev.com/what-does-the-nixpkgs-string-value-mean-in-nix
- https://discourse.nixos.org/t/how-to-switch-to-a-stable-channel-and-install-using-nix-env-without-needing-the-f-option/11751
