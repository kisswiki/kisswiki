- https://www.cyberciti.biz/faq/create-a-bootable-windows-10-usb-in-linux/

## woeusb

```bash
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install woeusb
```

Insert usb flash and unmount. For example:

```
mount
sudo umount "/media/roman/UBUNTU 19_0"
```

Create

```
sudo woeusb --target-filesystem NTFS --device ~/Downloads/Win10_1809Oct_v2_Polish_x64.iso /dev/sdd
```

- https://askubuntu.com/questions/289559/how-can-i-create-a-windows-bootable-usb-stick-using-ubuntu/928874#928874
- https://askubuntu.com/questions/1063842/bootable-usb-for-windows-10

## mkusb

- https://askubuntu.com/questions/1063842/bootable-usb-for-windows-10/1063861#1063861
- https://help.ubuntu.com/community/mkusb
- https://help.ubuntu.com/community/mkusb/gui
