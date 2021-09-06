```bash
$ sudo fdisk -l
$ sudo blkid /dev/nvme0n1p1
$ sudo blkid /dev/nvme0n1p1
/dev/nvme0n1p1: UUID="B27EE1BD7EE17A8D" TYPE="ntfs" PARTUUID="eff5c54c-01"
$ sudo vim /etc/fstab
```

/etc/fstab

```
UUID=B27EE1BD7EE17A8D        /media/c     ntfs-3g   defaults,nls=utf8,umask=000,dmask=027,fmask=137,uid=1000,gid=1000,windows_names 0 0
UUID=1CBE674CBE671D90        /media/f     ntfs-3g   rw 0 0
```

```
$ sudo mount /mnt/c
```

- https://askubuntu.com/questions/113733/how-do-i-correctly-mount-a-ntfs-partition-in-etc-fstab
- https://askubuntu.com/questions/971605/show-mounts-under-mnt-in-file-manager

## Paragon's linux driver and repair tool

oiaohm
There is still a question I need answers to. With this finally have a Linux based chkdsk/fsck tool. Not the ntfsfix of the past that basically says reboot into window to repair the drive.

set135

They have a faq which answers many questions:

https://www.paragon-software.com/home/ntfs3-driver-faq/

It seems their commercial offering is a different codebase, and they still sell it. (It also supports HFS+) That includes a chkntfs utility. They mention open sourcing a mkfs.NTFS utility and possibly some others, but do not mention a checking tool. I glanced thru their github page and did not see any utilities yet:

https://github.com/Paragon-Software-Group

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1276918-the-new-ntfs-file-system-driver-has-been-submitted-for-linux-5-15?p=1276999#post1276999

## vs exfat

Many scenarios using ntfs is setting yourself up for hell due to lack of repair tools on Mac OS and Linux and windows to windows managing to break the NTFS in ways windows own repair tools will not fix. NTFS os to os transfer is do you fell lucky punk move where you copy a file on to a drive transport it and the thing does not work and it not due to failed media its because Windows wrote the meta data oddly or windows got upset by the way Mac OS wrote the data.

https://www.makeuseof.com/tag/mac-file-system-external-drive/

The recommend transfer format from Windows to Mac OS is exfat not NTFS there are so many ways Mac OS will screw you over if you use NTFS its not funny as well.

Linux kernel getting proper exfat support was big because it truly got Mac OS, Windows and Linux with a file system all 3 could repair was not 32 bit file size limited and officially all OS supported exfat properly.

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1276918-the-new-ntfs-file-system-driver-has-been-submitted-for-linux-5-15?p=1277221#post1277221
