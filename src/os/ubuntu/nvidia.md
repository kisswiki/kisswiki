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
$ sudo apt install nvidia-driver-410
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
