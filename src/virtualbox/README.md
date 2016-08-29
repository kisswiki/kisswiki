# Virtualbox

- disable mini toolbar in `VM's Settings > User Interface` http://askubuntu.com/questions/31798/in-virtualbox-fullscreen-mode-can-i-disable-or-move-the-popup-menu-bar/722423#722423

## Switch to host

Click Host key (ctrl default) and than press alt+tab or windows key.

- http://superuser.com/questions/660554/how-to-switch-between-virtual-machines-that-are-in-fullscreen-mode
- http://superuser.com/questions/569836/fixing-command-tab-on-virtual-box
- http://askubuntu.com/questions/220221/how-to-do-alt-tab-for-main-system-while-in-vbox

## Can't use existing vdi

I had to unattach it from `Ubuntu VM > Settings > Storage > Controller: SATA`, then delete in `VirtualBox > File > Virtual Media Manager`

## Host-only networking

> Keeping the NAT adapter and adding a second host-only adapter works amazing, and is crucial for laptops (where the external network always changes).
> http://stackoverflow.com/questions/5906441/how-to-ssh-to-a-virtualbox-guest-externally-through-a-host/10410527#10410527

- http://superuser.com/questions/424083/virtualbox-host-ssh-to-guest/424115#424115
- http://stackoverflow.com/questions/5906441/how-to-ssh-to-a-virtualbox-guest-externally-through-a-host/27152153#27152153

## Menu

`Host+Home`, so if your `Host` key is `Ctrl`, then `Ctrl+Home`.
