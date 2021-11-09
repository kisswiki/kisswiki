```bash
# google: nixos iso unstable
# https://nixos.org/manual/nixos/unstable/index.html#ch-installation
# https://nixos.org/download.html
$ curl -OJLN https://channels.nixos.org/nixos-21.05/latest-nixos-gnome-x86_64-linux.iso
# https://nixos.org/manual/nixos/unstable/index.html#sec-booting-from-usb
$ lsblk
$ sudo dd if=nixos-gnome-21.05.4044.e74894146a4-x86_64-linux.iso of=/dev/sda
```

## canTouchEfiVariables

> a buggy UEFI that doesn’t support canTouchEfiVariables = true. Almost all hardware supports this properly.
> https://discourse.nixos.org/t/20-03-uefi-installation-problem-vs-instructions/7783/4

## ntfs

- https://nixos.wiki/wiki/NTFS
- https://gist.github.com/jonringer/8daf59f9aab3ce7a660903193594ae7f
- https://unix.stackexchange.com/questions/213137/how-to-auto-mount-permanently-mount-external-devices-on-nixos

## font

`nix-env -iA nixos.ubuntu_font_family`

- https://search.nixos.org/packages?channel=unstable&show=ubuntu_font_family&from=0&size=50&sort=relevance&type=packages&query=ubuntu

Below probably is not needed:

- https://stackoverflow.com/questions/57981225/how-to-install-fonts-with-nix-in-ubuntu
- https://nixos.wiki/wiki/Fonts
- https://unix.stackexchange.com/questions/427263/installing-cmu-fonts-on-nixos

## /bin/bash bad interpreter

Use `#!/usr/bin/env bash` as here https://www.reddit.com/r/NixOS/comments/k8ja54/nixos_running_scripts_problem/ or some other solution from https://discourse.nixos.org/t/add-bin-bash-to-avoid-unnecessary-pain/5673/38
