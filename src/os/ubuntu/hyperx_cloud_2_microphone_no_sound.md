This `journalctl -f --user-unit=pulseaudio` shows `[pulseaudio] alsa-mixer.c: Your kernel driver is broken: it reports a volume range from 0 to 0 which makes no sense.` when headset plugged in.

Other commands:

```bash
$ pacmd list-sources
$ pacmd list-source-outputs
# below shows nothing
$ cat /proc/asound/card*/codec* | grep Codec
$ pactl load-module module-loopback
$ pactl list sinks
```

```bash
$ sudo add-apt-repository ppa:audio-recorder/ppa
$ sudo apt install audio-recorder
$ lsusb
$ cat /proc/asound/cards
$ lsmod | grep snd
$ aplay -l
$ alxamixer
# below shows nothing
$ cat /proc/bus/usb/devices
$ lsusb --verbose
```

## Breakthrough

Today microphone worked.

When I record with `arecord hw:1,0 -d 5 /tmp/test-mic-digital-duplex.wav` and play `aplay /tmp/test-mic-digital-duplex.wav`, the sound is very quiet and crackling.

But recorded with Audacity, it works ok.

I have settings: `pavucontrol > Configuration HyperX Virtual Surround Sound > Profile: Digital Stereo Duplex (IEC958)`

And other devices are `Off`.

With `alsamixer > F6 to select device > F4 to select capture > Spaced to enable capture`.

Mayber restart of computer helped?

- https://wiki.audacityteam.org/wiki/USB_mic_on_Linux
- https://linuxconfig.org/how-to-test-microphone-with-audio-linux-sound-architecture-alsa
- https://ask.fedoraproject.org/en/question/84713/alsa-with-usb-sound-mixer/
- https://wiki.archlinux.org/index.php/PulseAudio/Troubleshooting
- https://wiki.debian.org/PulseAudio
- When recording with https://wiki.gnome.org/Apps/SoundRecorder and then playing, app is crashing.
- https://www.kernel.org/doc/html/latest/sound/
