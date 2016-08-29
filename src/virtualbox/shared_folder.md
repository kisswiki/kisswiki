- Install guest additions on guest

## Ubuntu guest

Probably you need to install:

```bash
sudo apt-get install build-essential linux-headers-$(uname -r) virtualbox-guest-dkms virtualbox-guest-additions-iso virtualbox-guest-utils
```

- http://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm/34871#34871

No need to manually mount like `sudo mount -t vboxsf wd ~/vbshare/`

Maybe needed to rerun

`sudo /media/roman/VBOXADDITIONS_5.1.0_108711/VBoxLinuxAdditions.run`

And this

```bash
$ mkdir ~/vbshare
$ sudo VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir /home/roman/vbshare/
$ sudo VBoxControl guestproperty get /VirtualBox/GuestAdd/SharedFolders/MountDir
Oracle VM VirtualBox Guest Additions Command Line Management Interface Version 5.0.24_Ubuntu
(C) 2008-2016 Oracle Corporation
All rights reserved.

Value: /home/roman/vbshare/
```

Useful

```bash
$ sudo  VBoxControl  sharedfolder  list
Oracle VM VirtualBox Guest Additions Command Line Management Interface Version 5.0.24_Ubuntu
(C) 2008-2016 Oracle Corporation
All rights reserved.

Shared Folder mappings (1):

01 - frolow
```

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
