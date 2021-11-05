## Use version from F-Droid

- https://github.com/termux/termux-app/issues/2067
- https://stackoverflow.com/questions/67647518/i-want-to-ask-how-to-fix-this-termux-repository/68881710#68881710
- https://github.com/termux/termux-packages/wiki/Package-Management#package-command-errors

## Youtube downloader

https://github.com/rofrol/termux-yt-dlp

## ssh server and rsync

on Android

```bash
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
# then get you ip
$ ip add
# or
$ ip -4 -j a | jq -r '.[] | select(.operstate=="UP") | .addr_info[].local'
# or
$ ip -j route get 8.8.8.8 | jq -r '.[] | select(length>0) | .prefsrc'
```
