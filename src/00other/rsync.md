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
-a  : all files, with permissions, etc..
-v  : verbose, mention files
-x  : stay on one file system
-H  : preserve hard links (not included with -a)
-A  : preserve ACLs/permissions (not included with -a)
-X  : preserve extended attributes (not included with -a)
-E  : preserve executability
-S  : sparse files
```

To improve the copy speed, add `-W` (`--whole-file`), to avoid calculating deltas/diffs of the files. This is the default when both the source and destination are specified as local paths, since the real benefit of rsync's delta-transfer algorithm is reducing network usage.

Also consider adding `--numeric-ids` to avoid mapping uid/gid values by user/group name.

`--info=progress2` instead of `--progress` is useful for large transfers, as it gives overall progress, instead of (millions of lines for) individual files.

>I had to replace `X` and `A` with `E`, because extended attributes and ACLs are covered by E on my mac.

The contents of `/dev`, `/proc`, `/sys`, `/tmp`, and `/run` are excluded in the above command, because they are populated at boot, although the folders themselves are not created.

- https://wiki.archlinux.org/index.php/Rsync#As_a_backup_utility
- https://superuser.com/questions/307541/copy-entire-file-system-hierarchy-from-one-drive-to-another/307542#307542
- https://superuser.com/questions/709176/how-to-best-clone-a-running-system-to-a-new-harddisk-using-rsync/709224#709224
