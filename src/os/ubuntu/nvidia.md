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