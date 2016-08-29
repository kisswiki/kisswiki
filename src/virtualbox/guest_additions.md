# Guest Additions

## Ubuntu guest

There was problem with mounting iso installed with exe. I've downloaded iso manually and then mounted it. Maybe version mismatch between virtualbox 5.0.20 and guest additinos 5.0.18.

I've also run:

```
sudo apt-get install virtualbox-guest-dkms virtualbox-guest-additions-iso virtualbox-guest-utils
```

- http://askubuntu.com/questions/451805/screen-resolution-problem-with-ubuntu-14-04-and-virtualbox
- http://askubuntu.com/questions/573596/unable-to-install-guest-additions-cd-image-on-virtual-box
- https://help.ubuntu.com/community/VirtualBox/GuestAdditions

## Remove guest addtitions

```
VBoxManage list extpacks
VBoxManage extpack uninstall VBoxVRDP
VBoxManage list extpacks
```

https://forums.virtualbox.org/viewtopic.php?f=7&t=43231
