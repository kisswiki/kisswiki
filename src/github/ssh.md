# SSH for github

This is the instruction to setup ssh with multiple keys.

## Generate key

For Windows: [Set the HOME environment variable](http://stackoverflow.com/questions/9513712/git-ssh-client-for-windows-and-wrong-path-for-ssh-config-file/21451748#21451748) pointing to `%USERPROFILE%` for ssh to pick it up.

`ssh-keygen -t ed25519 -C "your_email@example.com"`

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

For multiple accounts

`ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519_company`

in ~/.ssh/config (needs to have correct privilieges):

```
# Personal account
Host github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_ed25519

# Company account
Host github.com2
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_ed25519_outlook
```

test with `ssh -T git@github.com2`

https://stackoverflow.com/questions/2419566/best-way-to-use-multiple-ssh-private-keys-on-one-client/38454037#38454037

## Add key to github

Copy to clipboard with one of below methods an then add it to https://github.com/settings/keys.

### Mac OS

`pbcopy < ~/.ssh/id_rsa.pub`

https://stackoverflow.com/questions/16638092/copying-a-rsa-public-key-to-clipboard/50696510#50696510

### Ubuntu

```bash
$ sudo apt install xsel
$ xsel -b < ~/.ssh/id_rsa.pub
```

https://askubuntu.com/questions/382767/how-to-pipe-dump-clipboard-contents-to-a-file/382775#382775

### Powershell

```ps1
cat ~\.ssh\id_rsa.pub | Clip
```

- https://thepracticalsysadmin.com/copy-text-to-clipboard-using-powershell/
- https://superuser.com/questions/302032/how-to-copy-text-from-powershell

## ssh config

You can create multiple keys like that `ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/github_rsa`.

If the key does not have default name, you need to specify hosts for it:

Add entry in file `~/.ssh/config` (`~` means home directory)

```
Host *.github.com github.com
  IdentityFile ~/.ssh/github_rsa
```

Set permissions:

```bash
$ chmod 600 ~/.ssh/config
```

http://unix.stackexchange.com/questions/61655/multiple-similar-entries-in-ssh-config

## Test

Type `yes` when asked about fingeprint when running one of below commands:

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
