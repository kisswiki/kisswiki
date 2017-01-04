## permissions

```bash
chown $USER ~/.ssh/*
chmod 600 ~/.ssh/*
cmod 644 ~/.ssh/config
```

- http://serverfault.com/questions/253313/ssh-hostname-returns-bad-owner-or-permissions-on-ssh-config
- http://stackoverflow.com/questions/9270734/ssh-permissions-are-too-open-error

## remove password from private key

$ ssh-keygen -p
Enter file in which the key is (/c/Users/admin/.ssh/id_rsa): /c/Users/admin/.ssh/id_bitbucket

## password vs key vs certificate

> I highly recommend to move off password-based SSH at all in favor of SSH keys or (even better, certificates).
> Certificates are better - you don't need to worry about distributing your public keys everywhere.
> -- https://news.ycombinator.com/item?id=12517884
