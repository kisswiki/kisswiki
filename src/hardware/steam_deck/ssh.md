## sshd - ssh server

### On steam deck

```shell
$ passwd
$ sudo systemctl enable --now sshd
# get ip of steam deck
$ ip addr
```

### On client

```shell
$ ssh-copy-id -i ~/.ssh/id_ed25519.pub deck@192.168.1.28
$ ssh deck@192.168.1.28
```

### Transfer files with midnight commander

Install midnight commander (i.e. `brew install mc`)

`mc > Left > Shell link... > deck@192.168.1.28`

### Links

- https://shendrick.net/Gaming/2022/05/30/sshonsteamdeck.html
- https://www.digitalocean.com/community/tutorials/an-introduction-to-securing-your-linux-vps
  - https://www.reddit.com/r/SteamDeck/comments/t5b7r5/how_can_i_access_the_sd_via_ssh_sftp/
- [Wireless Steam Deck file transfer is THIS easy! - YouTube](https://www.youtube.com/shorts/pvEZELnbPoI)

## Warpinator

As someone who has tried warpinator and winSCP, warpinator isn't worth it because it's so finicky and breaks half the time unlike winSCP. It's not that much harder to set up winSCP anyway.

https://www.youtube.com/watch?v=pvEZELnbPoI&lc=UgypVJgRsdMWkxCwlEd4AaABAg.9jQuaDtuQPt9jT0Mr3Lffx
