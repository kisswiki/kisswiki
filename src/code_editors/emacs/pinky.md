## Swap Lwin with LCtrl and then LAlt with LCtrl but map Ctrl+Tab to AltTab and Shift+Ctrl+Tab to ShiftAltTab

Use `pinky.ahk` 

### Old

There were problems with `autohotkey.ahk`, in some situation it was not working well. So now I use Sharpkeys to map

- LAlt to LCtrl
- LWin to LAlt
- LCtrl to LWin

```
Ctrl & Tab::AltTab
```

- https://superuser.com/questions/1216591/win-10-autohotkey-how-do-you-remap-window-swapping-from-alt-tab-to-ctrl-tab/1269637#1269637
- https://superuser.com/questions/994800/can-i-swap-alttab-for-altesc-in-windows-10

#### Warning: This works unreliable

Sometims in emacs, `C-x` does nothing. Switchin AltTab needs mouse click or enter.

And also this autohotkey to make LCtrl+Tab send AltTab, and LCtrl+LShift+Tab send AltShiftTab

``
`^Tab::Send, {LAlt Down}{Tab}
#If WinExist("ahk_class MultitaskingViewFrame")
Ctrl Up::Send, {LAlt Up}
```

https://autohotkey.com/board/topic/148298-ctrl-tab-ctrl-shift-tab-for-alttabshiftalttab-task-switching-windows-10/

#### Misc

- Swap RCtrl and RAlt but not for RAlt + Tab https://superuser.com/questions/984343/remap-ctrl-to-alt-and-keep-alttab-and-ctrltab
- https://superuser.com/questions/1190329/can-i-switch-the-alt-and-ctrl-keys-on-my-keyboard
  - https://github.com/randyrants/sharpkeys/releases
- https://superuser.com/questions/814012/my-ctrl-and-alt-keys-are-swapped-how-can-i-swap-them-back
- http://ergoemacs.org/emacs/emacs_pinky.html
- http://ergoemacs.org/emacs/emacs_kb_shortcuts_pain.html
- https://ergodox-ez.com
  - https://www.reddit.com/r/emacs/comments/8jsc51/emacs_theater/

## Keyboard

- https://news.ycombinator.com/item?id=17989303
- https://github.com/diimdeep/awesome-split-keyboards
- https://ultimatehackingkeyboard.com/
- https://gaming.kinesis-ergo.com/edge/
  - https://www.jwz.org/blog/2018/04/exciting-keyboard-news/
    - https://www.jwz.org/blog/2018/08/ultimate-hacking-keyboard/
- http://www.comfortkeyboard.com/keyboards_ergoflex.html
- Koolertron Programmable Split Mechanical Keyboard with Cherry MX Red Switch, All 89 Keys Programmable Ergonomic Keypad, 8 Macro Keys - SMKD62 (Cherry MX Red Switch (Office): Computers & Accessories https://www.amazon.com/gp/product/B076FTNXDX/ 
- https://www.trulyergonomic.com/store/index.php
- https://www.maltron.com/maltron-history.html
- [tshort/dactyl-keyboard: Dactyl-ManuForm, a parameterized ergonomic keyboard](https://github.com/tshort/dactyl-keyboard)
  - https://geekhack.org/index.php?topic=88576.0
    - >I might modify the code to make the bottom row flat with an (inverted?) T arrow cluster. https://geekhack.org/index.php?topic=88576.msg2633198#msg2633198
  - https://www.reddit.com/r/MechanicalKeyboards/comments/71f4j0/dactylmanuform_keyboard/
- [The Comfortable Fission Keyboard - YouTube](https://www.youtube.com/watch?v=RvNhen7N9XQ)
- The DANKEST Ergonomic Keyboard - Ergodox EZ Review https://youtu.be/LALQsqZP1nA?t=151
- https://www.reddit.com/r/MechanicalKeyboards/comments/8gsuee/the_true_motivation_behind_my_keyboard_design/
  - https://imgur.com/gallery/xmU4A
