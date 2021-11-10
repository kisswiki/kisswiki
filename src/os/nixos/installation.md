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

`nix-env -iA nixos.ubuntu_font_family`

- https://search.nixos.org/packages?channel=unstable&show=ubuntu_font_family&from=0&size=50&sort=relevance&type=packages&query=ubuntu

Below probably is not needed:

- https://stackoverflow.com/questions/57981225/how-to-install-fonts-with-nix-in-ubuntu
- https://nixos.wiki/wiki/Fonts
- https://unix.stackexchange.com/questions/427263/installing-cmu-fonts-on-nixos

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
```

- https://nixos.wiki/wiki/Change_root
- https://discourse.nixos.org/t/using-chroot-inside-nixos/3488/2
- https://unix.stackexchange.com/questions/128046/chroot-failed-to-run-command-bin-bash-no-such-file-or-directory
