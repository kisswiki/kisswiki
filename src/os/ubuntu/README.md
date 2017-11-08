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

## ssh server

### On server

```bash
sudo apt-get install -y openssh-server
```

sudo nano -w /etc/ssh/sshd_config

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
