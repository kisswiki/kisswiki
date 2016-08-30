- Install guest additions on guest

## Ubuntu guest and shared folders automounting

You need to install:

```bash
sudo apt-get install -y virtualbox-guest-dkms
sudo usermod -aG vboxsf $(whoami)
```

Restart

- http://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm/34871#34871


```bash
$ sudo VBoxControl guestproperty get /VirtualBox/GuestAdd/SharedFolders/MountDir
```

If this is already set, you need to change owner to you:


```
$ sudo VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir ~/vbshare
Oracle VM VirtualBox Guest Additions Command Line Management Interface Version 5.0.24_Ubuntu
(C) 2008-2016 Oracle Corporation
All rights reserved.

Value: /home/roman/vbshare/
```

in vbox file:


```bash
$ ls -ld ~/vbshare
$ sudo chown user:user ~/vbshare
```

`sudo usermod -aG vboxsf $(whoami)`

`mount | grep vboxsf`

Useful

```bash
$ sudo VBoxControl sharedfolder list
Oracle VM VirtualBox Guest Additions Command Line Management Interface Version 5.0.24_Ubuntu
(C) 2008-2016 Oracle Corporation
All rights reserved.

Shared Folder mappings (1):

01 - frolow
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
