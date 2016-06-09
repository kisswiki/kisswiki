## keygen

`ssh-keygen -t rsa -C "your_email@youremail.com" -f ~/.ssh/github_rsa`

copy:

`clip < ~/.ssh/github_rsa.pub`

~/.ssh/config

```
Host *.github.com github.com
  IdentityFile ~/.ssh/github_rsa
```

test:

```
$ ssh -T git@github.com
$ ssh -T git@gist.github.com
```

- https://help.github.com/articles/generating-an-ssh-key/
- http://www.cloudvps.com/community/knowledge-base/regenerating-ssh-host-keys/
- RSA vs DSA: Verification is generally what you want to be faster: use RSA http://security.stackexchange.com/questions/5096/rsa-vs-dsa-for-ssh-authentication-keys
- remove password from key: `ssh-keygen -p`, enter file in which the key is in, i.e. `~/.ssh/id_rsa)`
