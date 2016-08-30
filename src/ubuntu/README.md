## Proxy

`sudo` didn't worked for me. I had to `su -`.

```bash
sudo passwd root
su -
echo "http_proxy=http://proxy:port" >> ~/.bashrc
echo "https_proxy=http://proxy:port" >> ~/.bashrc
. ~/.bashrc
apt-get update
```

- http://stackoverflow.com/questions/19109542/installing-latest-version-of-git-in-ubuntu/29901734#29901734

## signature failed, cleansigned file isn't valid got 'NODATA'

```bash
apt-get clean
mv /var/lib/apt/lists /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
```

- http://askubuntu.com/questions/131601/gpg-error-release-the-following-signatures-were-invalid-badsig
- http://askubuntu.com/questions/635087/apt-get-update-fails-in-ubuntu-14-04-due-to-gpg-error
- http://askubuntu.com/questions/477906/cant-update-my-system-due-to-gpg-error-clearsigned-file-isnt-valid-got-nodat
- http://askubuntu.com/questions/474549/got-nodata-issue-nodata-does-the-network-require-authentication

## add sources manually

http://askubuntu.com/questions/38021/how-to-add-a-ppa-on-a-server/38029#38029

## update git

```bash
apt-add-repository ppa:git-core/ppa
apt-get update
apt-get install git
```

- http://unix.stackexchange.com/questions/33617/how-can-i-update-to-a-newer-version-of-git-using-apt-get
- http://askubuntu.com/questions/568591/how-do-i-install-the-latest-version-of-git-with-apt
- http://askubuntu.com/questions/579589/upgrade-git-version-on-ubuntu-14-04

## ssh server

### On server

```bash
sudo apt install openssh-server
```

/etc/ssh/sshd_config

```
  PasswordAuthentication yes
  PubkeyAuthentication yes
```

```bash
sudo systemctl restart sshd.service
```

### On client

```bash
ssh-keygen -t rsa
ssh-copy-id username@remotehost
```

- https://help.ubuntu.com/lts/serverguide/openssh-server.html
- https://help.ubuntu.com/community/SSH/OpenSSH/Configuring
