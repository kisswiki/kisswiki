```bash
# google: nixos iso unstable
# https://nixos.org/manual/nixos/unstable/index.html#ch-installation
# https://nixos.org/download.html
$ curl -OJLN https://channels.nixos.org/nixos-21.05/latest-nixos-gnome-x86_64-linux.iso
# https://nixos.org/manual/nixos/unstable/index.html#sec-booting-from-usb
$ lsblk
$ sudo dd if=nixos-gnome-21.05.4044.e74894146a4-x86_64-linux.iso of=/dev/sda
```
