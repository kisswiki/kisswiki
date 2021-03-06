## fstab

I have chosed to mount like this

`UUID=2e76d709-214a-4f6a-9ffa-fab6aca812ed /media/shared               ext4    defaults 0 2`

and then create folders for users:

```bash
$ sudo mkdir /media/shared/roman
$ sudo chown roman:roman /media/shared/roman
```

`man fstab`

`man 8 fstab`

`lsblk -no UUID /dev/sdb2` to get UUID.

- https://serverfault.com/questions/3132/how-do-i-find-the-uuid-of-a-filesystem/890100#890100
- https://askubuntu.com/questions/232790/automount-ext4-partition-with-user-permission-ownership-fstab/232864#232864

## remount read write

```bash
$ id
$ mount -o remount,rw /media/mount_point
```

- https://askubuntu.com/questions/175739/how-do-i-remount-a-filesystem-as-read-write

As current user:

```bash
$ id
$ mount -o remount,rw,uid=$(id -u) /media/mount_point
```

- https://superuser.com/questions/320415/linux-mount-device-with-specific-user-rights
