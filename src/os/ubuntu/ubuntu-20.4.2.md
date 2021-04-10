## Ubuntu install aborted because failed to install extras

So I have created usb with newest Ubuntu 20.04.2

## After reboot no grub menu and Windows 10 loads

I needed to boot again from usb and

```
sudo apt update
sudo apt install efibootmgr
sudo efibootmgr
# Set to Ubuntu
sudo efibootmgr -o 2
```

## Software Center does not open

So I have removed cache

`rm -rf ~/snap/snap-store/common/.cache/gdk-pixbuf-loaders.cache`

https://askubuntu.com/questions/1248195/ubuntu-software-center-isnt-opening/1287559#1287559

## Fans are spinning fast while machine is doing nothing

Fans were spinning fast. Htop was showing that systemd-udev consumes 80% of CPU.

In `journactl -f`:

```
Failed to start NVIDIA Persistence Daemon
...
/sbin/modprobe nvidia-uvm failed
```

I have blacklisted nouveau like here https://forums.linuxmint.com/viewtopic.php?p=1731934&sid=718012c1006043ebc984a5bf65154f47#p1731934

After restart still this fans spinning.

So I have uninstalled nvidia driver with:

```
sudo apt-get remove --purge '^nvidia-.*'
```

https://askubuntu.com/questions/206283/how-can-i-uninstall-a-nvidia-driver-completely/206289#206289

```
$ sudo apt-get --purge remove xserver-xorg-video-nouveau
$ sudo ubuntu-drivers devices
$ sudo apt install nvidia-driver-460
```

I have rebooted machine but fans were still spinning.

I have once again removed drivers

```
sudo apt-get remove --purge '^nvidia-.*'
```

And downloaded one from https://www.nvidia.com/download/driverResults.aspx/169405/en-us

Opening this deb file by `Software Install (default)` failed. I needed to run the command manually:

```
dpkg -i nvidia-driver-local-repo-ubuntu2004-460.32.03_1.0-1_amd64.deb
```

Now after reboot no fans spinning.
