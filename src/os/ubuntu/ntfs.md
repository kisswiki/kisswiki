```bash
$ sudo fdisk -l
$ sudo blkid /dev/nvme0n1p1
$ sudo blkid /dev/nvme0n1p1
/dev/nvme0n1p1: UUID="B27EE1BD7EE17A8D" TYPE="ntfs" PARTUUID="eff5c54c-01"
$ sudo vim /etc/fstab
```

/etc/fstab

```
UUID=B27EE1BD7EE17A8D        /mnt/c     ntfs-3g   defaults,nls=utf8,umask=000,dmask=027,fmask=137,uid=1000,gid=1000,windows_names 0 0 
UUID=1CBE674CBE671D90        /mnt/f     ntfs-3g   rw 0 0
```

```
$ sudo mount /mnt/c
```

https://askubuntu.com/questions/113733/how-do-i-correctly-mount-a-ntfs-partition-in-etc-fstab
