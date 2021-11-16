Change boot order

`sudo vim /etc/default/grub`

Find the line that contains

`GRUB_DEFAULT`

and set it to

To boot to the sixth item in the list, the line would read:

`GRUB_DEFAULT=5`

https://askubuntu.com/questions/100232/how-do-i-change-the-grub-boot-order/110738#110738

## Fedora after install greated with grub command line

I have booted Fedora Live and opened terminal.

This maybe interesting for chroot https://gist.github.com/Tamal/73e65bfb0e883e438310c5fe81c5de14

It looks like it set efi to boot from usb

```
efibootmgr -v
BootCurrent: 0006
Timeout: 2 seconds
BootOrder: 0006,0002,0000,0001,0005,0007
Boot0000* Windows Boot Manager	HD(2,GPT,2b95e4aa-736e-45a8-b654-9330261c002f,0x96800,0x32000)/File(\EFI\MICROSOFT\BOOT\BOOTMGFW.EFI)WINDOWS.........x...B.C.D.O.B.J.E.C.T.=.{.9.d.e.a.8.6.2.c.-.5.c.d.d.-.4.e.7.0.-.a.c.c.1.-.f.3.2.b.3.4.4.d.4.7.9.5.}....................
Boot0001* Fedora	HD(2,GPT,2b95e4aa-736e-45a8-b654-9330261c002f,0x96800,0x32000)/File(\EFI\FEDORA\SHIMX64.EFI)
Boot0002* ubuntu	HD(2,GPT,2b95e4aa-736e-45a8-b654-9330261c002f,0x96800,0x32000)/File(\EFI\UBUNTU\SHIMX64.EFI)
Boot0005* Fedora	HD(2,GPT,2b95e4aa-736e-45a8-b654-9330261c002f,0x96800,0x32000)/File(\EFI\FEDORA\SHIM.EFI)..BO
Boot0006* UEFI: VerbatimSTORE N GO 8.07	PciRoot(0x0)/Pci(0x14,0x0)/USB(2,0)/CDROM(1,0xac,0x13e50)..BO
Boot0007* UEFI: VerbatimSTORE N GO 8.07, Partition 2	PciRoot(0x0)/Pci(0x14,0x0)/USB(2,0)/HD(2,MBR,0x6b5ab614,0xac,0x4f94)..BO
```

I am doing:

```
sudo efibootmgr -o 5
```

### Links

- https://www.google.com/search?q=fedora+repair+boot
- https://forums.fedoraforum.org/showthread.php?309905-Install-boot-repair-under-fodora
- https://unix.stackexchange.com/questions/339201/dual-boot-with-windows-10-and-fedora-25-stopped-working-grub-is-gone
- https://unix.stackexchange.com/questions/167893/restore-efi-boot-partition
- https://unix.stackexchange.com/questions/125911/cant-create-a-bootable-live-usb-flash-for-arch-linux/125932#125932
- https://unix.stackexchange.com/questions/441925/how-to-repair-a-broken-fedora-boot-partition
- https://ubuntuforums.org/showthread.php?t=1831869
- https://sourceforge.net/projects/boot-repair-cd/files/
- https://sourceforge.net/p/boot-repair-cd/home/Home/
- https://thomas-leister.de/en/repair-fedora-efi-bootloader/
- https://forums.fedoraforum.org/showthread.php?326431-Repair-Grub-Bootlaoder
- https://yovantoh.blogspot.com/2018/01/repairing-fedora-grub-using-fedora-live.html
- https://www.reddit.com/r/Fedora/comments/n1tux5/help_grub2_starts_in_comman_line_mode_after_update/
- https://www.reddit.com/r/Fedora/comments/p8vrpr/help_fedora_34_recover_grub_with_windows_10_on/
- https://www.google.com/search?q=boot-repair+fedora+live+after%3A2020
- https://ask.fedoraproject.org/t/restore-fedora-boot-after-installing-linux-mint/13811
- https://myclipnotes.blogspot.com/2015/03/repair-grub-using-fedora-live-cd.html
- https://www.howtoforge.com/tutorial/repair-linux-boot-with-grub-rescue/
- https://itectec.com/superuser/how-to-reinstall-the-grub-efi-bootloader-on-fedora-linux/
- https://docs.fedoraproject.org/en-US/Fedora/16/html/Installation_Guide/ap-rescuemode.html
- https://docs.fedoraproject.org/en-US/Fedora/16/html/Installation_Guide/ap-rescuemode.html#s2-rescuemode-boot-reinstall-bootloader
- https://forums.fedoraforum.org/showthread.php?319188-Boot-repair-application-for-Fedora-28
- https://unix.stackexchange.com/questions/107538/booting-fedora-in-rescue-mode
- https://github.com/kisswiki/kisswiki/search?q=grub
- https://github.com/kisswiki/kisswiki/blob/master/src/os/ubuntu/grub.md
- https://github.com/kisswiki/kisswiki/blob/master/src/os/ubuntu/uefi.md
- https://superuser.com/questions/696838/installed-updated-windows-8-uefi-after-ubuntu-restore-grub
- https://github.com/kisswiki/kisswiki/blob/master/src/os/ubuntu/ubuntu-20.4.2.md#L5
- https://www.google.com/search?q=fedora+update-grub
- https://unix.stackexchange.com/questions/152222/equivalent-of-update-grub-for-rhel-fedora-centos-systems
- https://www.google.com/search?q=ubuntu+repair+grub
- https://help.ubuntu.com/community/RecoveringUbuntuAfterInstallingWindows
- https://help.ubuntu.com/community/Boot-Repair
- https://www.ubuntupit.com/how-to-repair-the-grub-bootloader-using-a-ubuntu-live-usb-drive/
- https://www.techrepublic.com/article/how-to-repair-the-grub2-boot-loader-on-linux/
- https://www.google.com/search?q=install+fedora+custom+partition
- https://docs.fedoraproject.org/en-US/Fedora/18/html/Installation_Guide/s1-diskpartitioning-x86.html
- https://www.reddit.com/r/Fedora/comments/cdqfkc/recovering_grub_2_in_fedora_29_after_installing/
- https://www.reddit.com/r/Fedora/comments/3aki82/how_do_i_reinstall_grub/
- https://addons.mozilla.org/en-US/firefox/addon/export-tabs-urls-and-titles/
- https://www.google.com/search?q=fedora+live+restore+grub+chroot
- https://gist.github.com/Tamal/73e65bfb0e883e438310c5fe81c5de14
- https://www.google.com/search?q=fedora+iso+uefi
- https://docs.fedoraproject.org/en-US/quick-docs/creating-and-using-a-live-installation-image/
