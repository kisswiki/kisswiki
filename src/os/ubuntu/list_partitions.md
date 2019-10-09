`sudo fdisk -l`

`lsblk -e 7` exclude `loop`

Why 7?

```bash
$ grep loop /proc/devices
  7 loop
```

https://askubuntu.com/questions/1142400/exclude-loop-snap-devices-from-lsblk-output/1142405#1142405
