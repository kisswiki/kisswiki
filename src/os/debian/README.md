## Live USB

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

- https://unix.stackexchange.com/questions/270577/missing-libraries-error-when-starting-steam/671575#671575
- https://unix.stackexchange.com/questions/347429/steam-how-to-fix-libgl-errors-on-kali-linux-debian
- https://unix.stackexchange.com/questions/613436/steam-missing-libgl-so-1-on-fresh-debian-testing-install/613440#613440

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

## Misc

- https://wiki.debian.org/Firmware

- https://www.reddit.com/r/linux_gaming/comments/o8knj5/nvidia_optimus_issue_rtx_3060_and_intel_uhd/

- https://forums.developer.nvidia.com/t/ubuntu-20-04-driver-version-460-not-loaded/177334
- https://wiki.debian.org/bootlogd
- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=953366
- https://forums.developer.nvidia.com/t/linux-nvidia-gpu-screens-are-not-yet-supported/120834/6
- https://wiki.debian.org/NVIDIA%20Optimus
- https://wiki.debian.org/NvidiaGraphicsDrivers
- https://wiki.debian.org/Xorg
- https://wiki.debian.org/Wayland#Why_is_Wayland_necessary.3F
- https://unix.stackexchange.com/questions/202891/how-to-know-whether-wayland-or-x11-is-being-used
- https://askubuntu.com/questions/904940/how-can-i-tell-if-i-am-running-wayland
- https://wiki.archlinux.org/title/Installation_guide#Post-installation
- https://wiki.debian.org/NVIDIA%20Optimus
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
- https://www.phoronix.com/scan.php?page=news_item&px=PipeWire-Better-Video-2021
- https://blogs.gnome.org/uraeus/2021/10/01/pipewire-and-fixing-the-linux-video-capture-stack/
- https://www.phoronix.com/scan.php?page=news_item&px=libcamera-2021

- The Big Lebowski (1998) https://www.imdb.com/title/tt0118715/
