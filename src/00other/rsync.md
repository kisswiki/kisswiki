The simplest method for backing up over a network is to use rsync via SSH (using the -e ssh option)

`sudo rsync --dry-run --delete -azvv -e ssh /home/path/folder1/ remoteuser@remotehost.remotedomain:/home/path/folder2`

`sudo rsync -azvvcW -e ssh /home/path/folder1/ remoteuser@remotehost.remotedomain:/home/path/folder2`

```
-c checksum
-W whole files
```

Maybe disable `-z` for weaker machines.

- https://help.ubuntu.com/community/rsync
- https://help.ubuntu.com/lts/serverguide/openssh-server.html

## Entire file-system

This command can be used to synchronize a folder, and also resume copying when it's aborted half way. The command to copy one disk is:

`rsync -avxHAXS --progress --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /new-disk/`

What I ended up using:

`rsync -vaxHAXEWS --numeric-ids --info=progress2 --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/lost+found"} / /new-disk/`

The options are:

```
-v  : verbose, mention files
-a  : all files, with permissions, etc..
-x  : stay on one file system
-H  : preserve hard links (not included with -a)
-A  : preserve ACLs/permissions (not included with -a)
-X  : preserve extended attributes (not included with -a)
-E  : preserve executability
-W : whole file
-S  : sparse files
```

To improve the copy speed, add `-W` (`--whole-file`), to avoid calculating deltas/diffs of the files. This is the default when both the source and destination are specified as local paths, since the real benefit of rsync's delta-transfer algorithm is reducing network usage.

Also consider adding `--numeric-ids` to avoid mapping uid/gid values by user/group name.

`--info=progress2` instead of `--progress` is useful for large transfers, as it gives overall progress, instead of (millions of lines for) individual files.

> I had to replace `X` and `A` with `E`, because extended attributes and ACLs are covered by E on my mac.

The contents of `/dev`, `/proc`, `/sys`, `/tmp`, and `/run` are excluded in the above command, because they are populated at boot, although the folders themselves are not created.

- https://wiki.archlinux.org/index.php/Rsync#As_a_backup_utility
- https://superuser.com/questions/307541/copy-entire-file-system-hierarchy-from-one-drive-to-another/307542#307542
- https://superuser.com/questions/709176/how-to-best-clone-a-running-system-to-a-new-harddisk-using-rsync/709224#709224

## Windows and ntfs

```
-r : recursive, so directory is copied also. Implied by -a
```

`rsync -nxWr --info=progress2 photo_video /mnt/G/`

or with checksum

`rsync -nxWrc --info=progress2 photo_video /mnt/G/`

```
-x, --one-file-system       don't cross filesystem boundaries
-W, --whole-file            copy files whole (without delta-xfer algorithm)
-r, --recursive             recurse into directories
-c, --checksum              skip based on checksum, not mod-time & size
```

## Android termux

on Android

```
$ pkg upgrade
$ pkg install openssh
$ pkg install rsync
$ sshd
$ cat id_rsa.pub >> ~/.ssh/authorized_keys
$ chmod 600 ~/.ssh/authorized_keys
```

On remote machine

```
$ ssh 192.168.0.11 -p 8022
# $ rsync --update --progress -e 'ssh -p 8022' -azv 192.168.0.11:/storage/shared/Download /mnt/d/Xiaomi/
# I am using
$ rsync -xWrctzv --info=progress2 -e 'ssh -p 8022' -azv 192.168.0.11:~/storage/shared/Download /mnt/d/Xiaomi/ 2>rsync_errors.txt
$ cat rsync_errors.txt
```

on Android:

```
$ pkill sshd
```

```
-u, --update                skip files that are newer on the receiver
-a, --archive archive mode; equals -rlptgoD (no -H,-A,-X)
-l, --links                 copy symlinks as symlinks
-r, --recursive             recurse into directories
-p, --perms                 preserve permissions
-t, --times                 preserve modification times
-g, --group                 preserve group
-o, --owner                 preserve owner (super-user only)
-D                          same as --devices --specials
--devices                   preserve device files (super-user only)
--specials                  preserve special files
```

- https://www.reddit.com/r/Android/comments/7oreyo/protip_use_rsync_instead_of_android_file_transfer/
- https://stackoverflow.com/questions/55359419/can-rsync-be-used-to-transfer-files-from-android-client-to-linux-server-programm/59007451#59007451
- https://glow.li/posts/run-an-ssh-server-on-your-android-with-termux/
- https://levelup.gitconnected.com/using-termux-to-synchronise-with-remote-machines-linux-macos-5826978a3328
- https://wiki.termux.com/wiki/Remote_Access
- https://unix.stackexchange.com/questions/29386/how-do-you-copy-the-public-key-to-a-ssh-server

- https://gist.github.com/evandrocoan/f503188587587d7b1d1ba8746c9c6107
- https://askubuntu.com/questions/343502/how-to-rsync-to-android
- https://askubuntu.com/questions/1164971/rsync-to-mtp-mounted-android-does-not-work
- https://askubuntu.com/questions/342319/where-are-mtp-mounted-devices-located-in-the-filesystem
- https://superuser.com/questions/1157661/how-to-mount-an-android-smartphone-as-a-drive-in-windows
