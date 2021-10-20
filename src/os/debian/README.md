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

UPDATE: You don't need to disable secure boot in UEFI. But needed to change `Boot mode select > UEFI with CSM` to just `UEFI`.

> I wish people understood the Secure Boot spec better. This problem is totally unnecessary. The spec says no unsigned code can run until ExitBootServices is called, but people treat it as if it said that no unsigned kernel code can ever run.

https://news.ycombinator.com/item?id=28905036

Anyway here it is how to sign nvidia module

- https://askubuntu.com/questions/1023036/how-to-install-nvidia-driver-with-secure-boot-enabled/1049479#1049479
  - https://news.ycombinator.com/item?id=28899839

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

## git

### autocompletion of branches didn't work

in `.bashrc`:

This didn't work:

```
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# https://www.quora.com/What-is-the-best-Bash-prompt-for-Git
if [ -f /etc/bash_completion.d/git-prompt ]; then
  source /etc/bash_completion.d/git-prompt
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  #PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
  PS1='\w$(__git_ps1 " (%s)")\$ '
fi
```

I needed this:

```
# https://superuser.com/questions/1310317/why-does-debian-not-autocomplete-all-git-commands/1310326#1310326
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
```

### rebase fails with

`fatal: Not implemented yet`

WTF

Switched to Ubuntu to do rebase in the same directory.

https://www.reddit.com/r/debian/comments/q38pik/git_rebase_fatal_not_yet_implemented/

## gnome panel dissapeared

I needed to `Alt+F2 > r > Enter` to restart gnome shell.

## gnome autostart application

`sudo apt install gnome-tweak-tool`

`Tweaks > Startup Applications`

- https://askubuntu.com/questions/37957/how-do-i-manage-applications-on-startup-in-gnome-3/645919#645919
- https://askubuntu.com/questions/598195/how-to-add-a-script-to-startup-applications-from-the-command-line
- https://help.gnome.org/users/gnome-help/stable/shell-apps-auto-start.html.en
- https://help.gnome.org/admin/system-admin-guide/stable/autostart-applications.html.en

## screenshot

flameshot added to `Tweaks > Startup Applications`.

But image copied with cannot be pasted in gitlab issue comment.

## workrave

`Tweaks > Startup Applications`

### Workrave hangs or crashes gnome panel?

- https://www.reddit.com/r/debian/comments/q7aa7o/workrave_hangs_or_crashes_gnomeshell_on_debian_11/
- https://alternativeto.net/software/workrave/?platform=linux
- https://hovancik.net/stretchly/
  - `sudo dpkg -i package` https://github.com/hovancik/stretchly/releases

After uninstalling workrave I still got gnome panel crash and needed to do `Alt+F2 > r > Enter`.

## Movie subtitles

- https://wiki.debian.org/Subtitle#Software_available
- https://wiki.archlinux.org/title/List_of_applications/Multimedia#Subtitle_editors

## Python

`sudo apt install python3 python3-pip`

https://www.how2shout.com/linux/install-python-3-x-or-2-7-on-debian-11-bullseye-linux/

## UI is small

`Google Chrome > chrome://settings/appearance > Page zoom: 150%`

https://news.ycombinator.com/item?id=28900464

### Workrave alternative

- https://alternativeto.net/software/workrave/?platform=linux
- https://wiki.archlinux.org/title/List_of_applications/Other#Break_timers
- https://en.m.wikipedia.org/wiki/List_of_repetitive_strain_injury_software
- https://gitlab.gnome.org/GNOME/gnome-break-timer/
- https://github.com/gnome-pomodoro/gnome-pomodoro

I have installed https://github.com/tom-james-watson/breaktimer-app/releases from deb.

But I needed to replace in deb file https://www.reddit.com/r/debian/comments/q7ymc7/convert_deb_to_use_libayatanaappindicator3

It is because libappindicator libraries are removed from debian

- https://www.reddit.com/r/debian/comments/pn1oia/what_happened_to_libappindicator31_in_debian_11/
- https://lists.debian.org/debian-devel/2018/03/msg00506.html
- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=895037
- https://www.debian.org/releases/bullseye/amd64/release-notes/ch-information.en.html#noteworthy-obsolete-packages
- https://wiki.debian.org/Ayatana/IndicatorsTransition

UPDATE:

It seems the better way is to use equivs:

> It's no cruder than going in and munging the dependencies in a package file before you install it, and it has the substantial benefit of persisting the hack over package upgrades on both sides of the spoofed dependency.

https://www.reddit.com/r/debian/comments/q7ymc7/convert_deb_to_use_libayatanaappindicator3/hgluc40/

So I did use it:

```
$ sudo apt install equivs
$ equivs-control libappindicator3-1.equivs
$ $EDITOR libappindicator3-1.equivs
$ cat libappindicator3-1.equivs
Section: misc
Priority: optional
Standards-Version: 1.0
Package: libappindicator3-1
Description: dummy libappindicator3-1 package
$ equivs-build libappindicator3-1.equivs
$ sudo dpkg -i libappindicator3-1_1.0_all.deb
$ sudo dpkg -i BreakTimer.deb
```

- https://wiki.debian.org/Packaging/HackingDependencies
- https://stackoverflow.com/questions/36796614/equivs-dummy-package-version-number-syntax
- https://stackoverflow.com/questions/65978703/missing-libappindicator3-1-installing-slack/69623268#69623268

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
