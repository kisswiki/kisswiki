- Install guest additions on guest

## Ubuntu guest and shared folders automounting

You need to install:

```bash
sudo apt-get install -y virtualbox-guest-dkms
sudo usermod -aG vboxsf $(whoami)
sudo VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir ~/vbshare
```

Restart

- http://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm/34871#34871


```bash
$ ls -ld ~/vbshare
$ sudo chown user:user ~/vbshare
```


Useful

```bash
sudo VBoxControl sharedfolder list
mount | grep vboxsf
```

> NOT automounting it or permanent mounting from Virtualbox. Otherwise the host dir is mounted by root

### Packages

```bash
$ apt-cache depends virtualbox-guest-utils
 |Recommends: virtualbox-guest-dkms
  Recommends: virtualbox-guest-x11
$ apt-cache depends virtualbox-guest-dkms
  Depends: virtualbox-guest-utils
$ apt-cache depends virtualbox-guest-x11
  Depends: virtualbox-guest-utils
```

### Group

There is result when running `grep vbox /etc/group`

> if the vboxsf group did not exist in the guest, the shared folder wouldn't have shown up in /media
> https://forums.virtualbox.org/viewtopic.php?f=7&t=61327#p285737
