Run mpv with settings `~/.config/mpv/mpv.conf`:

```
profile=myprofile

[myprofile]
# https://github.com/mpv-player/mpv/issues/5978#issuecomment-405052947
# https://github.com/mpv-player/mpv/wiki/Which-VO-should-I-use%3F
vo=gpu
hwdec=auto
gpu-api=auto
```

and there was error that vdpau is not supported.

Running `vainfo` as [adviced](https://wiki.archlinux.org/index.php/Hardware_video_acceleration#Verification) showed that I am using Nouveau driver. So now I am installing nvidia drivers.

```bash
$ sudo add-apt-repository ppa:graphics-drivers/ppa
# long lived branch, latest number from here https://www.nvidia.com/object/unix.html
$ sudo apt install nvidia-driver-418
```

Restart computer.

After that vdpau works.

https://askubuntu.com/questions/61396/how-do-i-install-the-nvidia-drivers

## Hardware Video Acceleration

check with

```bash
$ sudo apt install vdpauinfo
$ vdpauinfo
```

- https://wiki.archlinux.org/index.php/Hardware_video_acceleration#Verifying_VDPAU
- https://wiki.debian.org/HardwareVideoAcceleration

## After upgrade from Ubuntu 18.10 to 19.04 there was problem with driver

This helped https://askubuntu.com/questions/1135473/upgraded-to-19-04-now-i-have-nvidia-package-problems

## video slowdowns, pauses, chopped, jumpy, lagging

`sudo ln -fs $PWD/src/os/ubuntu/20-nvidia.conf /etc/X11/xorg.conf.d/`

`20-nvidia.conf` has this option enabled:

`Nvidia X Server Settings GUI > X Server Display Configuration > Advanced > Force Composition Pipeline`

Then I have done `Save to X Configuration File > Show preview` and have copied content to `20-nvidia.conf`. I needed to copy manually bc I could not save it to file even in home directory.

After that I have copied it

```bash
$ sudo mkdir -p /etc/X11/xorg.conf.d/
$ sudo cp 20-nvidia.conf /etc/X11/xorg.conf.d/
```

- https://www.reddit.com/r/linuxquestions/comments/8fb9oj/how_to_fix_screen_tearing_ubuntu_1804_nvidia_390/e4zpw7r/
- https://wiki.debian.org/NvidiaGraphicsDrivers/Configuration
- When I have done this `options nvidia-drm modeset=1` as in https://ubuntuforums.org/showthread.php?t=2374405, I could not login to Gnome.
  - Maybe I should investigate this https://wiki.archlinux.org/index.php/NVIDIA#DRM_kernel_mode_setting. Do I need DRM?

## .nvidia-setttings.rc

It seems that option `Force Composition Pipeline` is not saved to `~/.nvidia-settings-rc`. I have done diff to make sure.

In Startup Application there already was this `sh -c '/usr/bin/nvidia-settings --load-config-only'`, so no need to create `~/.xinitrc` and won't even probably work.
  - https://wiki.archlinux.org/index.php/NVIDIA#NVIDIA_Settings

## Tips and tricks

- https://wiki.archlinux.org/index.php/NVIDIA/Tips_and_tricks
- https://blog.jenningsga.com/tips-and-tricks-for-the-proprietary-nvidia-driver/
- https://wiki.archlinux.org/index.php/NVIDIA/Troubleshooting

## get the display settings out of the 'X Configuration File'

- Have not tested it https://askubuntu.com/questions/379483/nvidia-x-server-settings-lost-on-every-reboot/1086507#1086507
