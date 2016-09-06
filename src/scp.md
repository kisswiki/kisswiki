## Permission denied

You will encounter this error if you use . (dot) as with cp meaning destination directory:

`scp user@host:/path/to/file .`

Instead provide a file name for the destination:

`scp user@host:/path/to/file file`

- http://askubuntu.com/questions/66492/scp-copy-over-ssh-doesnt-work-permission-denied-error-please
- http://unix.stackexchange.com/questions/47909/transfer-files-using-scp-permission-denied
- http://superuser.com/questions/944235/cant-scp-file-from-local-to-remote-host-permission-denied
- http://stackoverflow.com/questions/19777357/getting-permission-denied-for-scp-over-ssh-server-to-local
- http://stackoverflow.com/questions/26479785/getting-permission-denied-while-copying-a-file-from-local-to-remote-using-scp
