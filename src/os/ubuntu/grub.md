After power outage, windows overwritten mbr.

Turns out I am booting from HDD instead of SSD m2.

Motherboard is MSI:

```
$ sudo dmidecode -t 2
	Manufacturer: Micro-Star International Co., Ltd.
	Product Name: Z370I GAMING PRO CARBON AC (MS-7B43)
	Version: 1.0
	Serial Number: HA16762569
```

To get into boot menu press `F11`. To enter setup press `DEL`.

I have restored grub to `/dev/sda` because restoring to `/dev/nvme0n1` didn't work:

After `sudo grub-install /dev/sda`, computer booted to Ubuntu, but no grub menu was displayed.

So I have done `sudo update-grub` and then got grub menu with Windows entry.

- https://pl.wikipedia.org/wiki/TestDisk
- http://exherbo.org/docs/install-guide.html
- https://superuser.com/questions/1165534/mbr-recovery-corrupted-mbr-after-it-changed-to-dynamic-testdisk-gives-up-n
- https://superuser.com/questions/1142870/how-can-i-efficiently-recover-a-permanently-deleted-folder-at-once/1144489#1144489

## BootRepair

When tried to run XboxInstaller.exe from https://xbox.com/pl-PL/xbox-game-pass/pc-games it run Windows 10 Update Assistant. After reboot screen was black.

I booted Windows 10 Installer from usb and tried this

`bootrec /RebuildBcd` - could not find Windows or sth

`bootrec /fixMbr` reported success.

`bootrec /fixboot` reported error or something.

I could not restore grub with `grub-install /dev/sda`. But BootRepair worked https://askubuntu.com/questions/142300/how-to-fix-error-unknown-filesystem-grub-rescue/190500#190500.

I have installed like here https://help.ubuntu.com/community/Boot-Repair

I choosen Advanced and selecte restore mbr.

After that I could login to Ubuntu and run `update-grub`.
