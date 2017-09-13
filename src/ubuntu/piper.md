- https://github.com/libratbag/piper/wiki/FAQ
- supported devices http://libratbag.github.io/device-notes/

## Ubuntu 16.04 can't install becauase required gtk>=3.22

All I have without distro upgrade is `gtk-3.20`. Couldn't upgrade distro.

```
git clone https://github.com/libratbag/piper.git
cd piper
mkdir builddir
meson builddir --prefix=/usr/
```

### But first we need meson:

meson from deb was to old: Not enough arguments to project(). Needs at least the project name and one language https://github.com/bil-elmoussaoui/Hardcode-Tray/issues/424

### But first we need pip3


```
sudo apt install -y python3-pip
```

https://askubuntu.com/questions/778052/installing-pip3-for-python3-on-ubuntu-16-04-lts-using-a-proxy

### meson: Native dependency 'pygobject-3.0' not found

But then running again meson give above error.

### pygobject

Someone suggested this:

`apt-cache search python gobject`

And indeed this package has it: https://packages.ubuntu.com/xenial/amd64/python-gi-dev/filelist

`sudo apt install -y python-gi-dev`

### Ok, piper build, let's run it

```
$ cd builddir
$ ./piper
Version of GTK is too old, 3.22 required
```

### let's install newer gtk

```
sudo add-apt-repository ppa:gnome3-team/gnome3-staging
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt update
sudo apt dist-upgrade
sudo apt install gnome gnome-shell#!/bin/bash

xset m 0 0

mouse_id=$1
speed=$2

xinput set-prop $mouse_id "Coordinate Transformation Matrix" $speed, 0, 0, 0, $speed, 0, 0, 0, 1

# https://askubuntu.com/questions/773171/im-missing-mouse-pointer-speed-option-in-ubuntu-16-04/942445#942445
# https://www.reddit.com/r/linux_gaming/comments/1ew39a/mouse_sensitivity_and_linux_gaming/

```

But that gave only gtk-3.20:

```
$ (master) dpkg -l | grep libgtk
```

So let's uninstall this:

```
sudo apt install ppa-purge
sudo ppa-purge gnome3-team/gnome3-staging
sudo ppa-purge gnome3-team/gnome3
```

https://askubuntu.com/questions/830832/update-gnome-on-ubuntu-16-04/830833#830833

### Upgrade from 16.04 to 17.04 didn't work

`sudo do-release-upgrade -d`

http://www.omgubuntu.co.uk/2017/04/how-to-upgrade-to-ubuntu-17-04

Maybe wait for 18.04 LTS?

https://en.wikipedia.org/wiki/Ubuntu_(operating_system)#Releases
