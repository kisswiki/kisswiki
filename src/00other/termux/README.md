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
