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
