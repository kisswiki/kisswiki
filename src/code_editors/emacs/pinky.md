There were problems with `autohotkey.ahk`, in some situation it was not working well. So now I use Sharpkeys to map

- LAlt to LCtrl
- LWin to LAlt
- LCtrl to LWin

And also this autohotkey to make LCtrl+Tab send AltTab, and LCtrl+LShift+Tab send AltShiftTab

``
`^Tab::Send, {LAlt Down}{Tab}
#If WinExist("ahk_class MultitaskingViewFrame")
Ctrl Up::Send, {LAlt Up}
```

https://autohotkey.com/board/topic/148298-ctrl-tab-ctrl-shift-tab-for-alttabshiftalttab-task-switching-windows-10/


This is old code for only AltTab:

```
Ctrl & Tab::AltTab
```

- https://superuser.com/questions/1216591/win-10-autohotkey-how-do-you-remap-window-swapping-from-alt-tab-to-ctrl-tab/1269637#1269637
- https://superuser.com/questions/991809/how-to-remap-tab-shortcut-from-ctrl-to-alt-for-chrome-in-windows
- https://superuser.com/questions/994800/can-i-swap-alttab-for-altesc-in-windows-10

## Old

- `autohotkey.ahk`
- Swap RCtrl and RAlt but not for RAlt + Tab https://superuser.com/questions/984343/remap-ctrl-to-alt-and-keep-alttab-and-ctrltab
- https://superuser.com/questions/1190329/can-i-switch-the-alt-and-ctrl-keys-on-my-keyboard
  - https://github.com/randyrants/sharpkeys/releases
- https://superuser.com/questions/814012/my-ctrl-and-alt-keys-are-swapped-how-can-i-swap-them-back
- http://ergoemacs.org/emacs/emacs_pinky.html
- http://ergoemacs.org/emacs/emacs_kb_shortcuts_pain.html
- https://ergodox-ez.com
  - https://www.reddit.com/r/emacs/comments/8jsc51/emacs_theater/

## Type of keyboard switches

Cherry MX Speed Silver (on Ergodox): These are the switches I ended up settling on. Buttery smooth, low pressure. With the higher actuation point, I was able to add O-ring dampers to reduce the travel (and keep me from bottoming out). With this combo, I got the travel of the Havit, but with a much much lighter key (I also really like the ortho-linear layout). It is nowhere near as satisfying to type on vs the blue switches. But I'll trade that for a pain free evening.

https://www.reddit.com/user/amirrajan/comments/8h9a9o/my_dev_setup/ 