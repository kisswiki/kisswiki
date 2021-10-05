## Live USB

F11 for UEFI boot menu.

- https://cdimage.debian.org/cdimage/weekly-live-builds/amd64/iso-hybrid/
  - https://www.reddit.com/r/debian/comments/pztkdc/why_bullseye_and_not_bookworm_in_sourceslist_for/hf3daiv/
  - https://www.reddit.com/r/debian/comments/4elko8/is_there_a_current_downloadable_iso_of_debian/
- https://www.debian.org/releases/
- https://www.debian.org/doc/manuals/debian-faq/choosing.en.html#s3.1.5
- https://wiki.debian.org/DebianTesting
- https://wiki.debian.org/DebianBookworm
- https://www.debian.org/releases/bookworm/
- https://www.debian.org/devel/debian-installer/
- https://wiki.debian.org/ReproducibleInstalls/LiveImages
- https://wiki.debian.org/DebianLive

## Needed to set efi manually

```
efibootmgr -v
efibootmgr -o 5
```

## nVidia driver not loaded

You need to disable Secure Boot in UEFI or upload your keys to the motherboard and sign the nvidia module with your key.

csgo `cl_showfps 1` showed 20-30.

nvidia-settings was nearly empty.

`inxi -G` showed

`Device-2: NVIDIA GA106M [GeForce RTX 3060 Mobile / Max-Q] driver: N/A`.

`sudo less -R /var/log/boot.log` (top from https://wiki.debian.org/NVIDIA%20Optimus) showed there is error.

With the help of this https://superuser.com/questions/997938/how-do-i-figure-out-why-systemctl-service-systemd-modules-load-fails/1074637#1074637 I run:

`systemctl --failed` which showed 2 nvidia errors. Then this

`sudo journalctl _PID=395` showed more concrete error.

I have googled `ubuntu Error "modprobe nvidia-modeset"` and found this site

https://forums.developer.nvidia.com/t/ubuntu-20-04-driver-version-460-not-loaded/177334

In debian/ubuntu you edit the file `/etc/default/grub`.

Use either of those variables: `GRUB_CMDLINE_LINUX_DEFAULT`, or `GRUB_CMDLINE_LINUX`.

Then run `sudo update-grub` and `sudo reboot`.

For a one-shot testing you can select your kernel version and press `e` in the grub menu at boot time and edit the parameters for just that one particular boot.

## extensions.gnome.org

- https://extensions.gnome.org/extension/1160/dash-to-panel/
- https://extensions.gnome.org/extension/615/appindicator-support/

## Evolution

Uninstall Evlolution

## Fonts

- https://askubuntu.com/questions/19770/how-do-i-change-fonts-and-adjust-their-size
- https://packages.debian.org/bullseye/fonts-ubuntu

## Package management

- https://askubuntu.com/questions/20377/what-exact-purpose-have-transitional-packages
- https://wiki.debian.org/SourcesList
- `dpkg -i code*.deb` https://code.visualstudio.com/docs/setup/linux

## Install deb in gui

- https://www.how2shout.com/linux/installing-deb-in-debian-systems-using-gui-or-terminal-2-ways/
- https://askubuntu.com/questions/110059/why-wont-ubuntu-software-center-install-deb-files
- https://wiki.gnome.org/Apps/Software
- https://gitlab.gnome.org/GNOME/gnome-software
- https://en.wikipedia.org/wiki/GNOME_Software
- https://itsfoss.com/gdebi-default-ubuntu-software-center/
- https://askubuntu.com/questions/957540/gnome-software-wont-install-google-chrome

## nodejs

- https://github.com/Schniz/fnm#using-a-script-macoslinux
- https://blog.ffff.lt/posts/direnv-and-nvmrc/
- https://blog.ffff.lt/posts/fnm-on-cd/

## nVidia and Wayland

- https://www.phoronix.com/scan.php?page=news_item&px=NVIDIA-GBM-Works-With-Sway
- https://www.phoronix.com/scan.php?page=news_item&px=NVIDIA-GBM-Mesa-Backend-Alt
- https://github.com/NVIDIA/nvidia-settings/issues/69

## Steam

- https://askubuntu.com/questions/260288/how-can-i-change-where-steam-installs-games/821010#821010

### Error: You are missing the following 32-bit libraries, and Steam may not run:

libGL.so.1

There was info during steam install:

> Please install the nvidia-driver-libs-i386 package

https://packages.debian.org/buster/nvidia-driver-libs-i386

and this is how you install it:

`sudo apt install nvidia-driver-libs:i386`

- https://unix.stackexchange.com/questions/270577/missing-libraries-error-when-starting-steam/671575#671575
- https://unix.stackexchange.com/questions/347429/steam-how-to-fix-libgl-errors-on-kali-linux-debian
- https://unix.stackexchange.com/questions/613436/steam-missing-libgl-so-1-on-fresh-debian-testing-install/613440#613440

### New Steam library folder must be on a filesystem mounted with execute permissions

get parition uuid from `sudo blkid` and then in `sudo $EDITOR /etc/fstab`:

`UUID=<uuid> /mnt/d ntfs defaults,x-gvfs-show 0 0`

`sudo mount -a`

Then I have moved steamapps folder to new location.

- https://askubuntu.com/questions/712451/steam-library-must-be-on-a-filesystem-mounted-with-execute-permissions/1107425#1107425

## x-gvfs-show

if the directory for a device is known and outside /media, $HOME (typically /home/foo) or /run/media/$USER then the device is not shown in the user interface. Additionally, if any of component directories in its directory starts with a dot ("."), the device is not shown either. This policy may be overriden by use of the options x-gvfs-show and x-gvfs-hide.

https://unix.stackexchange.com/questions/169571/what-is-the-difference-between-mounting-in-fstab-and-by-mounting-in-file-manager/169576#169576

## Mount partition automatically

Instead of in `/etc/fstab` a user could automatically mount them at session startup with udisksctl, e.g. adding:

`udisksctl mount -b /dev/sdb2 -t ext4`

or by LABEL.

`udisksctl mount -b /dev/disk/by-label/Games`.

Use ls to get the labels:

`ls /dev/disk/by-label`

To assign label open `Disks app > click on partition > cogs icon > Edit filesystem`.

Then label will be used in Nautilus instead of size etc.

More drive info

`lsblk -fp` or `lsblk -o name,fstype,label,uuid,size,fsavail,fsuse%,mountpoint`

You can also assign label usign gparted or from terminal:

```
$ sudo dosfslabel /dev/sdc1 MYLABEL
$ sudo e2label /dev/sdc1 MYLABEL
$ sudo reiserfstune -l MYLABEL /dev/sdc1
$ sudo xfs_admin -L MYLABEL /dev/sdc1
```

You may find the device by mount point

`findmnt /mnt/ubuntu/`

- https://unix.stackexchange.com/questions/169571/what-is-the-difference-between-mounting-in-fstab-and-by-mounting-in-file-manager
- https://askubuntu.com/questions/365052/how-to-mount-drive-in-media-username-like-nautilus-does-using-udisks/1191876#1191876
- https://unix.stackexchange.com/questions/14165/list-partition-labels-from-the-command-line/108951#108951

## csgo - counter strike global operations

- Max performances on Linux https://steamcommunity.com/sharedfiles/filedetails/?id=1466300192
- https://www.reddit.com/r/GlobalOffensive/comments/8ax858/updated_csgo_tips_configs_and_more/
- https://dathost.net/blog/2016/05/28/how-to-create-an-autoexec-cfg-for-csgo/
- https://totalcsgo.com/launch-options
- The ULTIMATE CS:GO 2021 Config, Crosshair And Settings Guide! https://www.youtube.com/watch?v=dTW2Z0IpIEw

### LAUNCH OPTIONS and nVidia Optimus

`__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia %command%`

- https://wiki.debian.org/Steam

### fullscreen

Add `-full` to LAUNCH OPTIONS or to autoexec.cfg:

```
mat_setvideomode 1920 1080 0
host_writeconfig
```

`0` means fullscreen

- https://gaming.stackexchange.com/questions/185520/how-to-change-video-to-fullscreen-and-windowed-in-console/185609#185609

### Validating cache

gfunk

every day I get a 880mb update for dota2, I think it says "validating" not sure if this is related to cache or install integrity

V1tol

Try disable cache in Steam settings, restart client and enable it again. Had this problem with other games, this should fix it.

https://www.phoronix.com/forums/forum/software/linux-gaming/1281830-steam-beta-improves-its-vulkan-pre-caching-system-pipewire-capture-now-opt-in#post1281873

## Firefox

- https://itsfoss.com/remove-title-bar-firefox/
- https://addons.mozilla.org/en-US/firefox/addon/save-all-tab-urls/

## Could not get lock /var/lib/dpkg/lock-frontend

```
$ sudo lsof /var/lib/dpkg/lock-frontend
[sudo] password for roman:
lsof: WARNING: can't stat() fuse.gvfsd-fuse file system /run/user/1000/gvfs
      Output information may be incomplete.
lsof: WARNING: can't stat() fuse.portal file system /run/user/1000/doc
      Output information may be incomplete.
$ sudo rm /var/lib/dpkg/lock-frontend
```

If you see ‘unattende‘ COMMAND column, this means unattended security upgrades are running. You should wait for the process to finish. Basically, this is what I discussed in method 0 but you probably skipped that.

If the COMMAND is something else, you may kill the process and then remove the lock file. You can see the process id under the PID column. Use this PID to kill the process. After that, remove the lock file and run the update command to see if it’s been fixed.

- https://itsfoss.com/could-not-get-lock-error/
- https://askubuntu.com/questions/1109982/e-could-not-get-lock-var-lib-dpkg-lock-frontend-open-11-resource-temporari/1109989#1109989
- https://unix.stackexchange.com/questions/171519/lsof-warning-cant-stat-fuse-gvfsd-fuse-file-system

## debian repository 'http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 InRelease' doesn't support architecture 'i386'

limit to just 64 bit by introducing the [arch=amd64]

`sudo vi /etc/apt/sources.list.d/mongodb-org-5.0.list`

`deb [arch=amd64] http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main`

`sudo apt update`

https://askubuntu.com/questions/741410/skipping-acquire-of-configured-file-main-binary-i386-packages-as-repository-x/741411#741411

## networking.service loaded failed failed Raise network interfaces

> In file /etc/network/interfaces.d/setup, I found two references to eth0 and changed them to enp0s3 https://unix.stackexchange.com/questions/530081/startup-debian-10-error-networking-service-loading-failed/597415#597415

Or just comment out with `#`.

`ip link show`

- https://unix.stackexchange.com/questions/125400/how-can-i-find-available-network-interfaces/125406#125406
- https://askubuntu.com/questions/1164725/networking-restart-fails-failed-to-start-raise-network-interfaces-networking
- https://unix.stackexchange.com/questions/390307/startup-debian-9-error-failed-to-start-raise-network-interfaces
- https://superuser.com/questions/997938/how-do-i-figure-out-why-systemctl-service-systemd-modules-load-fails/1074637#1074637

## webp thumbnail in nautilus

Get patched version from https://github.com/aruiz/webp-pixbuf-loader/pull/30

```
$ sudo apt update
$ sudo apt install build-essential meson ninja libgdk-pixbuf-2.0-dev libwebp-dev
$ git clone https://github.com/alanhaw/webp-pixbuf-loader
$ cd webp-pixbuf-loader
$ meson builddir -Dgdk_pixbuf_query_loaders_path=/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
ninja -C builddir
$ sudo ninja -C builddir install
$ rm -rf ~/.cache/thumbnails/fail/
# or rm -rf ~/.cache/thumbnails/*
$ nautilus -q
```

You need to change wrong path:

```
sudo $EDITOR /usr/local/share/thumbnailers/webp-pixbuf.thumbnailer
```

from `/usr/local/bin/gdk-pixbuf-thumbnailer` to `/usr/bin/gdk-pixbuf-thumbnailer`.

Restarting nautilus maybe needed https://askubuntu.com/questions/19979/how-to-restart-nautilus-without-logging-out

Or restart gnome-shell https://askubuntu.com/questions/100226/how-to-restart-gnome-shell-from-command-line/1364254#1364254

File to test https://res.cloudinary.com/demo/image/upload/fl_awebp/cell_animation.webp.

There is also this https://salsa.debian.org/okias-guest/webp-pixbuf-loader which has `debian` directory in it.

- https://github.com/aruiz/webp-pixbuf-loader/issues/29
- most solutions I found were 'hacky', until I found the rather unknown WebP GDK Pixbuf Loader library. https://www.linuxuprising.com/2021/09/show-webp-thumbnails-in-gtk.html
- https://repology.org/project/webp-pixbuf-loader/versions
- ITP: webp-pixbuf-loader -- WebP Image format GdkPixbuf loader. https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=951113
- https://askubuntu.com/questions/61443/is-it-possible-to-view-webp-images-in-nautilus-photo-program
- https://askubuntu.com/questions/617047/how-to-preview-dds-and-webp-images-on-nautilus
- Also: All I had to do to get previews in Nautilus was to install this version of Eye of Gnome, through the ppa here: https://gitlab.gnome.org/GNOME/eog/-/issues/158 https://www.reddit.com/r/Ubuntu/comments/o2phwv/comment/h53e2xg/
- In eog2 it includes an eog with some modification (Some parts proposed in the merges request), the plugins and some pixbuf-loaders like raw images, psd, and webp. https://gitlab.gnome.org/GNOME/eog/-/issues/158
- Using ppa:krifa75/eog-ordissimo https://itsfoss.com/webp-ubuntu-linux/
- https://askubuntu.com/questions/544254/which-image-viewers-in-linux-support-the-webp-image-format
- https://askubuntu.com/questions/1346950/how-to-add-webp-support-to-eye-of-gnome

## package management with apt

`apt-cache rdepends --installed jetty` to see what depends on jetty

https://askubuntu.com/questions/13296/how-do-i-find-the-reverse-dependency-of-a-package/13297#13297

## Misc

- https://wiki.debian.org/Firmware

- https://www.reddit.com/r/linux_gaming/comments/o8knj5/nvidia_optimus_issue_rtx_3060_and_intel_uhd/

- https://forums.developer.nvidia.com/t/ubuntu-20-04-driver-version-460-not-loaded/177334
- https://wiki.debian.org/bootlogd
- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=953366
- https://forums.developer.nvidia.com/t/linux-nvidia-gpu-screens-are-not-yet-supported/120834/6
- https://wiki.debian.org/NvidiaGraphicsDrivers
- https://wiki.debian.org/Xorg
- https://wiki.debian.org/Wayland#Why_is_Wayland_necessary.3F
- https://unix.stackexchange.com/questions/202891/how-to-know-whether-wayland-or-x11-is-being-used
- https://askubuntu.com/questions/904940/how-can-i-tell-if-i-am-running-wayland
- https://wiki.archlinux.org/title/Installation_guide#Post-installation
- http://xed.ch/help/debian.html

- https://askubuntu.com/questions/1114857/cant-run-csgo-at-fullscreen-ubuntu-18-10/1138409#1138409
- https://wiki.archlinux.org/title/PRIME#PRIME_render_offload

- https://redis.io/topics/quickstart
- https://redis.io/download

- https://www.phoronix.com/forums/forum/software/linux-gaming/1281830-steam-beta-improves-its-vulkan-pre-caching-system-pipewire-capture-now-opt-in#post1281873

- 7 Minutes of Streets of Rage 4 Gameplay - Gamescom 2019 https://www.youtube.com/watch?v=zJpdT5KBNDQ
  - Sor 1 aged 7 😝
  - Sor 2 aged 9 😃
  - Sor 3 aged 10 😁
  - Sor 4 aged 36 😭
- https://blogs.gnome.org/uraeus/2021/10/01/pipewire-and-fixing-the-linux-video-capture-stack/
- https://www.phoronix.com/scan.php?page=news_item&px=libcamera-2021

- The Big Lebowski (1998) https://www.imdb.com/title/tt0118715/
