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

## Autostart

put `mouse.sh` in `~/bin`. Then `chmod +x ~/bin/mouse.sh`.

in `~/.profile` add:

```bash
if [[ -n ${DISPLAY} ]]; then
  ~/bin/mouse.sh "Logitech G203 Prodigy Gaming Mouse" 0.2
fi
```

- https://askubuntu.com/questions/773171/im-missing-mouse-pointer-speed-option-in-ubuntu-16-04/942445#942445
- https://www.reddit.com/r/linux_gaming/comments/1ew39a/mouse_sensitivity_and_linux_gaming/
- https://askubuntu.com/questions/79195/where-do-i-have-to-paste-an-xinput-command-so-that-it-executes-it-when-gnome-i/201825#201825
- https://stackoverflow.com/questions/18755967/how-to-make-a-program-that-finds-ids-of-xinput-devices-and-sets-xinput-some-set/40771275#40771275
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

## Natural scrolling

``` bash
$ sudo mkdir /etc/X11/xorg.conf.d/
$ sudo vim /etc/X11/xorg.conf.d/30-pointer.conf
```

with content:

```
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"

        Option "NaturalScrolling" "on"
EndSection
```

- https://askubuntu.com/questions/819662/how-to-invert-touchpad-scrolling-on-ubuntu-16-04/820098#820098
- https://www.reddit.com/r/UbuntuMATE/comments/biccvr/how_do_i_enable_natural_scrolling_on_a_normal/em9bak6/
- https://askubuntu.com/questions/1122513/how-to-add-natural-inverted-mouse-scrolling-in-i3-window-manager/1122517#1122517
