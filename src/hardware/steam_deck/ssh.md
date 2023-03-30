## sshd - ssh server

### On steam deck

```shell
$ passwd
$ sudo systemctl start sshd
# get ip of steam deck
$ ip addr
```

### On client

```shell
$ ssh-copy-id -i ~/.ssh/id_ed25519.pub deck@192.168.1.28
$ ssh deck@192.168.1.28
(130)(deck@steamdeck ~)$ sudo systemctl enable sshd
```

### Transfer files with midnight commander

Install midnight commander (i.e. `brew install mc`)

`mc > Left > Shell link... > deck@192.168.1.28`

### Links

- https://shendrick.net/Gaming/2022/05/30/sshonsteamdeck.html
- https://www.digitalocean.com/community/tutorials/an-introduction-to-securing-your-linux-vps
  - https://www.reddit.com/r/SteamDeck/comments/t5b7r5/how_can_i_access_the_sd_via_ssh_sftp/
