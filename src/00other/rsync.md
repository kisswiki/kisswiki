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
