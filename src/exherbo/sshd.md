## On guest

```
systemctl enable sshd
systemctl start sshd
```

## On host

```
ssh-keygen -t rsa
ssh-copy-id username@remotehost
```

- https://help.ubuntu.com/lts/serverguide/openssh-server.html
- https://help.ubuntu.com/community/SSH/OpenSSH/Configuring
