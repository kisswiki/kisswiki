## keygen

### Generate

Set the HOME environment variable pointing to `%USERPROFILE%` for ssh to pick it up. This usually seems to be the [problem](http://stackoverflow.com/questions/9513712/git-ssh-client-for-windows-and-wrong-path-for-ssh-config-file/21451748#21451748) for many unix solutions that run on windows. Then:

`ssh-keygen -t rsa -C "your_email@example.com" -f ~/.ssh/github_rsa`

copy to clipboard

`clip < ~/.ssh/github_rsa.pub`

### ssh config

Add entry in file ~/.ssh/config (~ means home directory)

```
Host *.github.com github.com
  IdentityFile ~/.ssh/github_rsa
```

http://unix.stackexchange.com/questions/61655/multiple-similar-entries-in-ssh-config

### Test

```
ssh -T git@github.com
ssh -T git@gist.github.com
```

### Links

- https://help.github.com/articles/generating-an-ssh-key/
- http://www.cloudvps.com/community/knowledge-base/regenerating-ssh-host-keys/
- RSA vs DSA: Verification is generally what you want to be faster: use RSA http://security.stackexchange.com/questions/5096/rsa-vs-dsa-for-ssh-authentication-keys
- remove password from key: `ssh-keygen -p`, enter file in which the key is in, i.e. `~/.ssh/id_rsa)`
