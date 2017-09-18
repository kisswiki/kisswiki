## libratbag and pepper - gui in gtk

- supported models https://github.com/libratbag/libratbag/blob/master/hwdb/70-libratbag-mouse.hwdb

## Set sensivity, disabel acceleration

get info about mouse:

`xinput list`

get info about xset settings:

`xset q | grep -A 1 Pointer`

If you have device listed twice, use first id instead of name:

```
xset m 0 0
mouse_id=10; speed=0.5; xinput set-prop $mouse_id "Coordinate Transformation Matrix" $speed, 0, 0, 0, $speed, 0, 0, 0, 1
```

check settings:

`xinput list-props 10`

create file `~/.config/autostart/mouse.desktop`:

```
[Desktop Entry]
Name=Set mouse sensitivity
Exec=sh ~/bin/mouse.sh 10 1
Type=Application
Comment[en_US]=Use xset to set mouse params
Comment=Use xset to set mouse params
```

create file `~/bin/mouse.sh`:

```
#!/bin/bash

xset m 0 0

mouse_id=$1
speed=$2

xinput set-prop $mouse_id "Coordinate Transformation Matrix" $speed, 0, 0, 0, $speed, 0, 0, 0, 1
```

create file 

- https://askubuntu.com/questions/773171/im-missing-mouse-pointer-speed-option-in-ubuntu-16-04/942445#942445
- https://www.reddit.com/r/linux_gaming/comments/1ew39a/mouse_sensitivity_and_linux_gaming/
- https://stackoverflow.com/questions/18755967/how-to-make-a-program-that-finds-ids-of-xinput-devices-and-sets-xinput-some-set
- https://unix.stackexchange.com/questions/164325/how-to-use-xinput-to-configure-multiple-devices-with-a-script
- https://wiki.archlinux.org/index.php/Mouse_acceleration
- https://wiki.archlinux.org/index.php/Mouse_polling_rate
- https://wiki.ubuntu.com/X/Config/Input
- http://www.pontikis.net/blog/fix-mouse-sensitivity-ubuntu
- https://askubuntu.com/questions/135122/reduce-the-mouse-sensitivity
- https://stackoverflow.com/questions/18755967/how-to-make-a-program-that-finds-ids-of-xinput-devices-and-sets-xinput-some-set/39804831#39804831
- https://askubuntu.com/questions/794185/how-to-disable-mouse-acceleration-in-ubuntu-16-04

## Disable the Forward/Back buttons

`xev`

press buttons on xev window. You you will see something like:

```
ButtonRelease event, serial 40, synthetic NO, window 0x5600001,
    root 0xdc, subw 0x0, time 89228289, (126,126), root:(127,179),
    state 0x10, button 9, same_screen YES

```

`ctrl+c`.

To disable 8 and 9 buttons, add file `~/.Xmodmap` with content:

```
! Disable buttons 8 and 9
pointer = 1 2 3 4 5 6 7 0 0
```

Test it with the command `xmodmap ~/.Xmodmap`.


https://unix.stackexchange.com/questions/20550/how-to-disable-the-forward-back-buttons-on-my-mouse
