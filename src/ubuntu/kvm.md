- https://help.ubuntu.com/community/KVM/Installation
- https://www.microsoft.com/pl-pl/software-download/windows10ISO
- Windows 10 Pro keys https://www.reddit.com/r/Windows10/comments/3det9q/build_10240_now_available_for_windows_insiders_in/ct4hp9p/

```
sudo apt install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo adduser `id -un` kvm
sudo adduser `id -un` libvirtd
# relogin
# install graphical
sudo apt install virt-manager
```

## Virt-Manager can't connect to graphical console

append:

```
# allow connect with openGraphicsFD to work
unix (send, receive) type=stream addr=none peer=(label=/usr/sbin/libvirtd),
```

to the file `/etc/apparmor.d/abstractions/libvirt-qemu` but not in the qemu-bridge-helper section. (So right after `owner @{PROC}/0-9*/fd/ r,`)

Then reload the profiles with sudo systemctl reload apparmor

https://askubuntu.com/questions/833964/virt-manager-cant-connect-to-graphical-console

## no bootable device - add iso

virt-manager > virtual machine > Show virtual hardware details:

  - Boot Options > Enable IDE CDROM 1
  - IDE CDROM 1 > Virtual Disk > Source path > Browse
