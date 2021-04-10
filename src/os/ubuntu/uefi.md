## Prepare

I have installed Windows first, then Ubuntu.

> In your firmware, disable QuickBoot/FastBoot and Intel Smart Response Technology (SRT). If you have Windows 8, also disable Fast Startup. https://help.ubuntu.com/community/UEFI

## Grub not loaded

I needed to press F11 during boot to show UEFI boot list. To load grub as first do as below. Here I assume that Ubuntu is 5.

```
sudo apt update
sudo apt install efibootmgr
sudo efibootmgr
sudo efibootmgr -o 5
```

### When I done sudo efibootmgr -o 5,0,1,2,3,4

I have done `sudo efibootmgr -o 5,0,1,2,3,4`. But it was enough to just `sudo efibootmgr -o 5`.

After first change of order, Windows was booted again. Then I have removed it from order sequence.

When I ommited Windows (0) when specyfing order, it was added as 6 during next boot. But grub was loaded as default.

After that I just removed 6 with `sudo efibootmgr -b 6 -B` and changed order like in above.

### Links

- https://superuser.com/questions/1247300/how-to-make-uefi-bios-start-grub-not-windows/1248255#1248255
- Fix on Windows with bcedit https://askubuntu.com/questions/695496/grub-doesnt-show-up-installing-ubuntu-14-04-alongside-windows-10-on-a-uefi-x64
- Troubleshooting https://askubuntu.com/questions/221835/how-do-i-install-ubuntu-alongside-a-pre-installed-windows-with-uefi/228069#228069
- https://wiki.gentoo.org/wiki/Efibootmgr
- https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface
- https://wiki.archlinux.org/index.php/GRUB/EFI_examples
- https://askubuntu.com/questions/958995/installed-ubuntu-alongside-windows-10-uefi-no-grub-screen
- https://superuser.com/questions/1117803/uefi-boot-not-showing-ubuntu-grub/1353198
- https://superuser.com/questions/1125371/installed-ubuntu-alongside-windows-10-does-not-show-in-boot-priority-uefi/1179017
- https://askubuntu.com/questions/717904/dual-boot-boot-menu-does-not-show-up-after-installing-ubuntu-15-10-alongside-win
- https://askubuntu.com/questions/681422/grub-menu-not-showing-with-dual-boot-uefi-mode-installation
- https://superuser.com/questions/1169903/why-isnt-grub-loading-in-uefi
- https://askubuntu.com/questions/221835/how-do-i-install-ubuntu-alongside-a-pre-installed-windows-with-uefi
- https://askubuntu.com/questions/666631/how-to-get-grub-to-be-the-default-bootloader-instead-of-windows-boot-manager-on
- https://superuser.com/questions/1117803/uefi-boot-not-showing-ubuntu-grub

## Restore grub

- Boot-repair? https://help.ubuntu.com/community/Boot-Repair
- https://superuser.com/questions/696838/installed-updated-windows-8-uefi-after-ubuntu-restore-grub

## Without grub

- https://stackoverflow.com/questions/48690745/how-do-i-boot-windows-directly-in-linux-windows-dual-system-without-grub
- https://askubuntu.com/questions/1181136/installing-ubuntu-with-refind-instead-of-grub2
- https://unix.stackexchange.com/questions/167893/restore-efi-boot-partition/169627#169627

## EFI partition requirements

- https://wiki.archlinux.org/index.php/EFI_system_partition
- https://askubuntu.com/questions/618244/does-the-uefi-partition-either-must-or-should-be-first-for-some-reason-if-s
