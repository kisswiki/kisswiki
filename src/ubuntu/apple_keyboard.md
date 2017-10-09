## swap fn

`sudo bash -c "echo 2 > /sys/module/hid_apple/parameters/fnmode"`

## swap cmd and alt

sudo bash -c "echo 1 > /sys/module/hid_apple/parameters/swap_opt_cmd"

## swap ~ with >

`sudo bash -c "echo 0 > /sys/module/hid_apple/parameters/iso_layout"`

## permanently

```
echo options hid_apple iso_layout=0 fnmode=2 swap_opt_cmd=1 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
```

- https://superuser.com/questions/277990/how-do-i-swap-alt-and-windows-keys-with-xmodmap/1190742#1190742
- https://help.ubuntu.com/community/AppleKeyboard#Change%20Function%20Key%20behavior
- https://askubuntu.com/questions/7537/how-can-i-reverse-the-fn-key-on-an-apple-keyboard-so-that-f1-f2-f3-are-us
