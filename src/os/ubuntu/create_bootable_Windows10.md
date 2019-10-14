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
~$ sudo woeusb --target-filesystem NTFS --device ~/Downloads/Win10_1809Oct_v2_Polish_x64.iso /dev/sdd
WoeUSB v@@WOEUSB_VERSION@@
==============================
Mounting source filesystem...
Wiping all existing partition table and filesystem signatures in /dev/sdd...
/dev/sdd: 2 bytes were erased at offset 0x000001fe (dos): 55 aa
/dev/sdd: calling ioctl to re-read partition table: Success
Ensure that /dev/sdd is really wiped...
Creating new partition table on /dev/sdd...
Creating target partition...
Making system realize that partition table has changed...
Wait 3 seconds for block device nodes to populate...
Cluster size has been automatically set to 4096 bytes.
Creating NTFS volume structures.
mkntfs completed successfully. Have a nice day.
--2019-10-14 11:09:03--  https://github.com/pbatard/rufus/raw/master/res/uefi/uefi-ntfs.img
Resolving github.com (github.com)... 140.82.118.4
Connecting to github.com (github.com)|140.82.118.4|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://raw.githubusercontent.com/pbatard/rufus/master/res/uefi/uefi-ntfs.img [following]
--2019-10-14 11:09:03--  https://raw.githubusercontent.com/pbatard/rufus/master/res/uefi/uefi-ntfs.img
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.36.133
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.36.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 524288 (512K) [application/octet-stream]
Saving to: ‘/tmp/WoeUSB.tBCu2F.tempdir/uefi-ntfs.img’

uefi-ntfs.img                             100%[===================================================================================>] 512,00K  2,26MB/s    in 0,2s

2019-10-14 11:09:04 (2,26 MB/s) - ‘/tmp/WoeUSB.tBCu2F.tempdir/uefi-ntfs.img’ saved [524288/524288]

1024+0 records in
1024+0 records out
524288 bytes (524 kB, 512 KiB) copied, 0,234575 s, 2,2 MB/s
Mounting target filesystem...
Applying workaround to prevent 64-bit systems with big primary memory from being unresponsive during copying files.
Copying files from source media...
Installing GRUB bootloader for legacy PC booting support...
Installing for i386-pc platform.
Installation finished. No error reported.
Installing custom GRUB config for legacy PC booting...
Resetting workaround to prevent 64-bit systems with big primary memory from being unresponsive during copying files.
/usr/bin/woeusb: line 1676: echo: write error: Invalid argument
The command "exit 0" failed with exit status "1", program is prematurely aborted

```

- https://askubuntu.com/questions/289559/how-can-i-create-a-windows-bootable-usb-stick-using-ubuntu/928874#928874
- https://askubuntu.com/questions/1063842/bootable-usb-for-windows-10

## mkusb

```
~$ mkusb
---------------------------------------------------------------------
Usage: mkusb [input-file]      # optional parameter
---------------------------------------------------------------------
d:  dus , guidus, mkusb-dus    - New, easy to use
e: Eleven, sudo -H mkusb-11    - Classic user interface
n: NoX,    sudo mkusb-nox      - original text mode
b: Bas,    sudo mkusb-bas      - basic text mode for old/basic linux
q: Quit
---------------------------------------------------------------------
Select version of mkusb (d/e/n/b/q) d
 dus 12.3.3
live system or temporary superuser permissions
Drive that contains source file: /dev/nvme0n1
Live drive, that is booted from: /dev/nvme0n1
Drive with a partition in fstab: /dev/sda
Drive with a partition in fstab: /dev/sdb
cands=2
sdc
Seagate_Slim_BK
465,8G
usb
USB or memory card
sdd
Generic_Flash_Disk
15,6G
usb
USB or memory card
p_target: target=/dev/sdd
live system or temporary superuser permissions
 Clone/extract  system from the source
'/home/roman/Downloads/Win10_1809Oct_v2_Polish_x64.iso'
to the target device (drive) '/dev/sdd'
MODEL      NAME   FSTYPE LABEL        SIZE
Flash_Disk sdd                       15,6G
           ├─sdd1 ntfs   Windows USB 15,6G
           └─sdd2 vfat   UEFI_NTFS    512K
/home/roman/Downloads/Win10_1809Oct_v2_Polish_x64.iso
/dev/sdd
-----
live system or temporary superuser permissions
source=/home/roman/Downloads/Win10_1809Oct_v2_Polish_x64.iso
target=/dev/sdd
source=/home/roman/Downloads/Win10_1809Oct_v2_Polish_x64.iso
ls -l  /home/roman/Downloads/Win10_1809Oct_v2_Polish_x64.iso
-rw-rw-r-- 1 roman roman 5287405568 paź 14 10:43 /home/roman/Downloads/Win10_1809Oct_v2_Polish_x64.iso
Making a USB boot drive or memory card ..........................
The iso file SHOULD BE loop mounted on a temporary file READ-ONLY:
mount: /tmp/dus.WqmmOi75g6: WARNING: device write-protected, mounted read-only.
disk_name_type=microsoft-windows
source=/home/roman/Downloads/Win10_1809Oct_v2_Polish_x64.iso
iso
gpt_zap: done
Trying to unmount partitions if mounted on the target device
umount: /dev/sdd: not mounted.
umount: /dev/sdd1: no mount point specified.
umount: /dev/sdd2: no mount point specified.
------------------------------------------------------------
1024+0 records in
1024+0 records out
1048576 bytes (1,0 MB, 1,0 MiB) copied, 0,704651 s, 1,5 MB/s
dd if=/dev/zero of=/dev/sdd bs=512 count=2048 seek=2048
2048+0 records in
2048+0 records out
1048576 bytes (1,0 MB, 1,0 MiB) copied, 0,804547 s, 1,3 MB/s
dd if=/dev/zero of=/dev/sdd bs=512 count=2048 seek=32765952
2048+0 records in
2048+0 records out
1048576 bytes (1,0 MB, 1,0 MiB) copied, 0,423679 s, 2,5 MB/s
mkfs.fat 4.1 (2017-01-24)
/dev/sdd1 has 64 heads and 32 sectors per track,
hidden sectors 0x0800;
logical sector size is 512,
using 0xf8 media descriptor, with 32765952 sectors;
drive number 0x80;
filesystem has 2 32-bit FATs and 16 sectors per cluster.
FAT size is 15984 sectors, and provides 2045872 clusters.
There are 32 reserved sectors.
Volume ID is 53b56237, volume label WIN-INSTALL.
/dev/sdd: PTUUID="6d933c47" PTTYPE="dos"
/dev/sdd1: LABEL_FATBOOT="WIN-INSTALL" LABEL="WIN-INSTALL" UUID="53B5-6237" TYPE="vfat" PARTUUID="6d933c47-01"
 created MSDOS partition table and FAT file system
Model: Generic Flash Disk (scsi)
Disk /dev/sdd: 16,8GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End     Size    Type     File system  Flags
 1      1049kB  16,8GB  16,8GB  primary  fat32        boot, esp


MODEL      NAME   FSTYPE LABEL
Flash_Disk sdd
           `-sdd1 vfat   WIN-INSTALL
mount: /tmp/dus.7W3wiijwjA: WARNING: device write-protected, mounted read-only.
Creating an intermediate mkusb tarfile for Windows:
- keep the tarfile to create a USB boot drive
- keep the isofile to create a DVD boot disk (or create another tarfile)
 Extracting from iso-file to tarfile (a few minutes) ...
-------20%-------40%-------60%-------80%------100% progress
................................................   finished
 Extracting from tarfile to target device (several minutes) ...
using '/home/roman/Win10_1809Oct_v2_Polish_x64.tar'
-------20%-------40%-------60%-------80%------100% progress
.........................
......................   finished
Check errors logged by tar? (y/N) This method is verified with Windows 7 - 10.
There are errors when using some iso files.
 The target device might work anyway. Please try!
Bootloader: Installing for i386-pc platform.
Installation finished. No error reported.
 mkcmd_runcmd:  'tar tarfile-to-target':error. Failed.
p_clean:
live system or temporary superuser permissions
clean if necessary and return
clean if necessary and quit
```

- https://askubuntu.com/questions/1063842/bootable-usb-for-windows-10/1063861#1063861
- https://help.ubuntu.com/community/mkusb
- https://help.ubuntu.com/community/mkusb/gui
