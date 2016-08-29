# Virtualbox

- disable mini toolbar in `VM's Settings > User Interface` http://askubuntu.com/questions/31798/in-virtualbox-fullscreen-mode-can-i-disable-or-move-the-popup-menu-bar/722423#722423

## Guest Additions

There was problem with mounting iso installed with exe. I've downloaded iso manually and then mounted it. Maybe version mismatch between virtualbox 5.0.20 and guest additinos 5.0.18.

I've also run:

```
sudo apt-get install virtualbox-guest-dkms virtualbox-guest-additions-iso virtualbox-guest-utils
```

- http://askubuntu.com/questions/451805/screen-resolution-problem-with-ubuntu-14-04-and-virtualbox
- http://askubuntu.com/questions/573596/unable-to-install-guest-additions-cd-image-on-virtual-box
- https://help.ubuntu.com/community/VirtualBox/GuestAdditions

### Remove guest addtitions

```
VBoxManage list extpacks
VBoxManage extpack uninstall VBoxVRDP
VBoxManage list extpacks
```

https://forums.virtualbox.org/viewtopic.php?f=7&t=43231

## Switch to host

Click Host key (ctrl default) and than press alt+tab or windows key.

- http://superuser.com/questions/660554/how-to-switch-between-virtual-machines-that-are-in-fullscreen-mode
- http://superuser.com/questions/569836/fixing-command-tab-on-virtual-box
- http://askubuntu.com/questions/220221/how-to-do-alt-tab-for-main-system-while-in-vbox

## Can't use existing vdi

I had to unattach it from `Ubuntu VM > Settings > Storage > Controller: SATA`, then delete in `VirtualBox > File > Virtual Media Manager`

## Host-only networking

- http://superuser.com/questions/424083/virtualbox-host-ssh-to-guest/424115#424115
- http://stackoverflow.com/questions/5906441/how-to-ssh-to-a-virtualbox-guest-externally-through-a-host/27152153#27152153
