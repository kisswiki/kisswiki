# SSH for github

This is the instruction to setup ssh with multiple keys.

## Generate key

For Windows: [Set the HOME environment variable](http://stackoverflow.com/questions/9513712/git-ssh-client-for-windows-and-wrong-path-for-ssh-config-file/21451748#21451748) pointing to `%USERPROFILE%` for ssh to pick it up.

`ssh-keygen -t rsa -C "your_email@example.com" -f ~/.ssh/github_rsa`

## Add key to github

Copy to clipboard

`clip < ~/.ssh/github_rsa.pub`

then add it to https://github.com/settings/keys.

## ssh config

Add entry in file `~/.ssh/config` (`~` means home directory)

```
Host *.github.com github.com
  IdentityFile ~/.ssh/github_rsa
```

http://unix.stackexchange.com/questions/61655/multiple-similar-entries-in-ssh-config

## Test

```
ssh -T git@github.com
ssh -T git@gist.github.com
```

## ssh-copy-id

```
ssh-copy-id -i ~/.ssh/file.pub id@server
```

- https://serverfault.com/questions/241588/how-to-automate-ssh-login-with-password

## Links

- https://help.github.com/articles/generating-an-ssh-key/
- http://www.cloudvps.com/community/knowledge-base/regenerating-ssh-host-keys/
- RSA vs DSA: Verification is generally what you want to be faster: use RSA http://security.stackexchange.com/questions/5096/rsa-vs-dsa-for-ssh-authentication-keys
- remove password from key: `ssh-keygen -p`, enter file in which the key is in, i.e. `~/.ssh/id_rsa)`
