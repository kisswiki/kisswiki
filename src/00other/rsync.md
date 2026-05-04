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

```
pkg remove game-repo
pkg remove science-repo
pkg update
```

https://stackoverflow.com/questions/67647518/termux-repository-is-under-maintenance-or-down/67955726#67955726

```
$ pkg upgrade
# if there is error during upgrade that repository is disabled
# https://stackoverflow.com/questions/67647518/i-want-to-ask-how-to-fix-this-termux-repository/68881710#68881710
# $ termux-change-repo
# select Grimler repo
# then run again
# $ pkg upgrade
# Don't use apt or apt-get, but use pkg instead
# https://github.com/termux/termux-app/issues/1802#issuecomment-716877183
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

It was very slow, stuck on "receiving incremental file list".

So I have connected by usb and run:

```shell
$ rsync -xWrtv /run/user/1000/gvfs/mtp\:host\=Xiaomi_Mi_9T_Pro_be4c836a/Wewnętrzna\ pamięć\ współdzielona/DCIM /mnt/d/Xiaomi9TPro/ 2>rsync_errors.txt
```

https://askubuntu.com/questions/342319/where-are-mtp-mounted-devices-located-in-the-filesystem/585675#585675

on Android:

```shell
$ pkill sshd
```

Reverse:

```shell
$ rsync -nxWrctzv --delete --info=progress2 -e 'ssh -p 8022' -azv /mnt/d/Xiaomi/Download/ 192.168.0.11:~/storage/shared/Download/ 2>rsync_errors_reverse.txt
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
--compress, -z              compress file data during the transfer
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

## Deploy

.env

```
SSH_USER="user"
SSH_HOST="host"
SSH_PORT="port"
DIST=src
DEST=/var/www/example.com/html
```

deploy.sh

```bash
#!/bin/bash
set -o allexport
source .env
set +o allexport

# 20s transfer time
# 28s transfer time
# 28s transfer time
# rsync -avz

# aes128-gcm 2x slower
# 40s transfer time
# rsync -avz -e 'ssh -c aes128-gcm@openssh.com

# 31s transfer time
# 23s transfer time
#rsync -av --compress --compress-choice=zstd --compress-level=3

# 23s transfer time
#rsync -av

# 22s transfer time
# 22s transfer time
# 23s transfer time
# 22s transfer time
# 27s transfer time
#https://unix.stackexchange.com/questions/188737/does-compression-option-z-with-rsync-speed-up-backup/669171#669171
#rsync -av --compress --compress-choice=lz4

# 22s transfer time
# ssh -Q cipher
# lscpu | grep AES
# grep aes /proc/
# aes128-gcm@openssh.com hardware AES-NI (Intel/AMD)
# chacha20-poly1305@openssh.com no hardware AES-NI, CPU only (ARM/VPS)
# ssh -vv localhost
#rsync -av --compress --compress-choice=lz4 -e 'ssh -c chacha20-poly1305@openssh.com'

# 35s transfer time
#rsync -av --compress --compress-choice=zstd --compress-level=6

# 19s transfer time
# 25s transfer time
# 19s transfer time
# 21s transfer time
# 26s transfer time
#rsync -av --compress --compress-choice=zstd --compress-level=9

# 24s transfer time
#rsync -av --compress --compress-choice=zstd --compress-level=16

# 24s transfer time
# 23s transfer time
# 33s transfer time
#rsync -av --compress --compress-choice=zstd --compress-level=22

# when doing --checksum, consider --checksum-choice=xxh3

# no neeed for mkdir when rsync --mkpath, rsync ≥ 3.2.3, since year 2020
# on macos there is old rsync: `brew install rsync`. Then `export PATH=$(brew --prefix rsync)/bin:$PATH` to ~/.zshenv
#ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'mkdir -m 750 -p /var/www/example.com'

# Rsync's merge-dir filter does not entirely allow to remodel this, because for rsync, the order of includes and excludes matters
# https://unix.stackexchange.com/questions/198259/delete-gitignored-files-with-rsync/805651#805651
# https://stackoverflow.com/questions/13713101/rsync-exclude-according-to-gitignore-hgignore-svnignore-like-filter-c/50059607#50059607
# also there is --exclude=.DS_Store https://apple.stackexchange.com/questions/95871/skipping-ds-store-files-when-copying-between-two-external-drives

# --no-o --no-go: neded so that rsync does not set owner and group to the one who is sending files
# otherwise it sets user to 501 and owner to staff

# from man rsync:
# If  you specify "--chown=foo:bar", this is exactly the same as specifying "--usermap=*:foo --groupmap=*:bar",
# only easier (and with the  same implied --owner and/or --group options).
# --usermap
# Any  matching  FROM value  from  the  sender is replaced with a TO value from the receiver.
# fallback: --usermap='X:W,*:root' --groupmap='Y:Z,*:root'
# https://superuser.com/questions/671011/how-to-arbitrarily-map-user-group-ownerships-in-rsync/1798222#1798222
# from me: so no need for --numeric-ids when using --chown

# exclude-from subshell version: --exclude-from=<(git -C ${DIST}/ ls-files --exclude-standard -oi --directory)

# for backups:
# --fake-super. This option tells rsync to not save the owner and permissions as the owner and permissions of the file, but instead to create an extended attribute (xattr) for the file (named user.rsync.%stat by the way) which contains all the information I might otherwise need root access to store. This attribute looks like
# user.rsync.%stat="104755 0,0 131750:131750"
# https://jplitza.de/blog/2013/07/12/switching-backups-from-fakeroot-to-fake-super.html
# -M--fake-super
# https://serverfault.com/questions/119846/rsync-and-fake-super-how-to-preserve-attributes#comment976200_119849
# The attributes are rsync-specific; it is --fake-super that "restores" them.
# But when restoring from such a backup, the rsync receiver does not need --fake-super, only the sender does. (On the sender side this option means "read rsync.%stat instead of looking at real stat", on the receiver side it means "write rsync.%stat instead of doing real chown/chmod".)
# The receiver does, however, need to be run with root privileges as normal users cannot chown files.
# https://superuser.com/questions/1785588/rsync-save-and-restore-user-id-group-id/1785589#1785589


# Problem is that rsync by default sets owner and group according to local user:

# # ls -l /var/www/matchalove.frolow.dev
# total 4
# drwxr-xr-x 3 501 staff 4096 Apr 26 06:01 html
# Files are owned by `501:staff` so looks like local macOS user.
#
# On debian nginx runs as user `www-data`:
#
# # nginx -T | grep user
# 2026/04/30 10:12:26 [warn] 76149#76149: conflicting server name "frolow.dev" on 0.0.0.0:80, ignored
# nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
# nginx: configuration file /etc/nginx/nginx.conf test is successful
# user www-data;
# # ps -eo pid,comm,euser,supgrp | grep nginx
#     734 nginx           root     -
#     735 nginx           www-data www-data
#     736 nginx           www-data www-data
# # lsof -i TCP:80
# COMMAND PID     USER FD   TYPE DEVICE SIZE/OFF NODE NAME
# nginx   734     root 6u  IPv4   5933      0t0  TCP *:http (LISTEN)
# nginx   734     root 7u  IPv6   5934      0t0  TCP *:http (LISTEN)
# nginx   735 www-data 6u  IPv4   5933      0t0  TCP *:http (LISTEN)
# nginx   735 www-data 7u  IPv6   5934      0t0  TCP *:http (LISTEN)
# nginx   736 www-data 6u  IPv4   5933      0t0  TCP *:http (LISTEN)
# nginx   736 www-data 7u  IPv6   5934      0t0  TCP *:http (LISTEN)
#
# https://stackoverflow.com/questions/35220654/how-to-verify-if-nginx-is-running-or-not/35231900#35231900 problem is that rsync by default sets owner and group according to local user:
#
# # ls -l /var/www/matchalove.frolow.dev
# total 4
# drwxr-xr-x 3 501 staff 4096 Apr 26 06:01 html
#
# Files are owned by `501:staff` so looks like local macOS user.
#
# On debian nginx runs as user `www-data`:
#
# # nginx -T | grep user
# 2026/04/30 10:12:26 [warn] 76149#76149: conflicting server name "frolow.dev" on 0.0.0.0:80, ignored
# nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
# nginx: configuration file /etc/nginx/nginx.conf test is successful
# user www-data;
# # ps -eo pid,comm,euser,supgrp | grep nginx
#     734 nginx           root     -
#     735 nginx           www-data www-data
#     736 nginx           www-data www-data
# # lsof -i TCP:80
# COMMAND PID     USER FD   TYPE DEVICE SIZE/OFF NODE NAME
# nginx   734     root 6u  IPv4   5933      0t0  TCP *:http (LISTEN)
# nginx   734     root 7u  IPv6   5934      0t0  TCP *:http (LISTEN)
# nginx   735 www-data 6u  IPv4   5933      0t0  TCP *:http (LISTEN)
# nginx   735 www-data 7u  IPv6   5934      0t0  TCP *:http (LISTEN)
# nginx   736 www-data 6u  IPv4   5933      0t0  TCP *:http (LISTEN)
# nginx   736 www-data 7u  IPv6   5934      0t0  TCP *:http (LISTEN)

# https://stackoverflow.com/questions/35220654/how-to-verify-if-nginx-is-running-or-not/35231900#35231900

# > At scale, I've seen the use of the acl system, or other data stored in the xattr scope of an object result in performance penalties. As depending on the implementation, application and client may incur additional IOPS to the filesystem to figure out how to enforce the permissions. reddit.com/r/linuxadmin/comments/mvrgzl/comment/gvdt1y3

# --rsync-path="sudo rsync"
# --rsync-path="sudo -u www-data rsync"
# https://unix.stackexchange.com/questions/619066/rsync-keep-overriding-owner-and-group/619132#619132

# rsync needs --perms or -p or -a which includes -p, to change permissions

# with find: find -type f -exec chmod --changes 644 {} \; -o -type d -exec chmod --changes 755 {} \;
# https://stackoverflow.com/questions/18817744/change-all-files-and-folders-permissions-of-a-directory-to-644-755/34550137#34550137

# more about setgid, setuid, sticky bit https://www.miniaturelinux.com/Linux-Access-Modes-and-Sticky-Bits-Examples.php
# i.e. clearing setgid, setuid and sticky bit in one command is 00750 or =750 (or g-s), not 0750 because this is octal.
# 0750 is the same as 750. Zero is added implicitly
# https://stackoverflow.com/questions/39698962/linux-permissions-setuid-setgid-sticky-bit-remove-all-with-one-command
# https://unix.stackexchange.com/questions/103413/is-there-any-difference-between-mode-value-0777-and-777/103414#103414

# find and chown: different for dirs and files in one find command
# find html -type f -exec chmod 664 {} + -o -type d -exec chmod 775 {} +
# https://stackoverflow.com/questions/28918996/proper-owner-of-var-www-html/28920446#28920446

# Can chmod set differently for dirs and files in one command, so no need for using find? Probably not

# meaning of X in g+X: set x only on directories

# alternative chmod without octals: --chmod=u+rw,g=rX,Dg+s,o=

# rsync --chmod=g+rX removes setgid, same as g=rX, so I need to use rXs or D2750
# on server: chown :www-data /var/www && chmod g+s /var/www
# with rsync setting setgid on directories with D2750, every file will have group the same as is on /var/www
# sometimes on server nginx is run as www-data group, sometimes other group.
# And with setgid I don't have to use rsync -a --chown=:www-data
# So www-data group can only read files. If some application needs write permission to some directory, give it explicitly.
# If attacker takes over nginx process, it will not have write permissions to directory.
# https://askubuntu.com/questions/386928/default-permissions-for-var-www/493401#493401
#ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'chmod g+w /var/www/example.com/html/upload/'

# setgid, setuid with x is s: rws, without x is S: rwS

# RESTRICTED DELETION FLAG OR STICKY BIT
# sticky bit t does not mean sticky in modern systems, but rather protection from removing
# chmod g+t does nothing.
# it is only displayed as t (or T when -x) for unpriviliged users (o - other): rwxrwxr-t
# so other can only delete file if they own t

# check permissions with:
# # namei -l /var/www/example.com/html/index.html
#f: /var/www/example.com/html/index.html
#drwxr-xr-x root root     /
#drwxr-xr-x root root     var
#drwxr-s--- root www-data www
#drwxr-sr-x root www-data example.com
#drwxr-s--- root www-data html
#-rwxr----- root www-data index.html

git -C ${DIST}/ ls-files --exclude-standard -oi --directory | rsync --info=progress2 --mkpath --exclude-from=- --delete --delete-excluded -av --compress --compress-choice=lz4 --no-o --no-g --chmod=D2750,F740 -e 'ssh -p '${SSH_PORT} ${DIST}/ ${SSH_USER}@${SSH_HOST}:${DEST}/
```
