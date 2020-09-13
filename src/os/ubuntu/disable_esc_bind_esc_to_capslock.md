## To work in X.org and terminal

https://github.com/rofrol/dotfiles/blob/master/bin/maps_capslock_to_escape.md

## GNOME Tweak Tool

`GNOME Tweak Tool > Keyboard & Mouse > Addidtional Layout Options > Caps Lock behavior > Swap ESC and Caps Lock`

## xkb

- https://www.emacswiki.org/emacs/MovingTheCtrlKey#toc6
- https://medium.com/@damko/a-simple-humble-but-comprehensive-guide-to-xkb-for-linux-6f1ad5e13450
- http://wiki.c2.com/?RemapCapsLock
- https://wiki.archlinux.org/index.php/X_keyboard_extension#Basic_examples

## xmodmap

Update:

>In case someone else stumbles upon this, it is properly discussed here: https://bugzilla.redhat.com/show_bug.cgi?id=873656
>Unfortunately .xmodmap is not and will not be supported by Gnome 3 anymore.
>Users should migrate their configs to xkb.
>https://unix.stackexchange.com/questions/107434/remap-keys-on-gnome3-8-using-xmodmap/455089#455089

create config with all mappings:

`xmodmap -pke > ~/.config/xmodmap.d/disable-esc`

Then have this content afterwards in disable-esc file:

```
keycode   9 = NoSymbol
keycode  66 = Escape
```

test:

`xmodmap ~/.config/xmodmap.d/disable-esc`

- https://superuser.com/questions/210852/disable-escape-key-in-linux/1242568#1242568
- https://wiki.archlinux.org/index.php/xmodmap
