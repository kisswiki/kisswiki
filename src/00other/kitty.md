- https://sw.kovidgoyal.net/kitty/overview/#tabs-and-windows
- https://sw.kovidgoyal.net/kitty/layouts/#the-vertical-layout

## Paste

Paste to terminal only works when I select some text somewhere else and `shift+insert` to paste.

https://superuser.com/questions/254090/how-to-paste-from-clipboard-into-kitty-ssh-terminal-window

## Config

https://github.com/rofrol/dotfiles/blob/master/.config/kitty/kitty.conf

## Vertical split

Normal split and then `ctrl+shift+l` to change layout.

https://stackoverflow.com/questions/66127831/split-screen-in-kitty#comment132654699_66543260

## macos key repeat rate

`Settings > Keyboard > Key repeat rate > Fast`

https://twitter.com/dillon_mulroy/status/1778762742729465897

## open links

`cmd+click` works with this:

`mouse_map cmd+left release grabbed,ungrabbed mouse_click_url`

https://github.com/kovidgoyal/kitty/issues/3718#issuecomment-860184706

`shift+click` works by default. `ctrl+shift+click` should be faster.

Also you can `ctrl+shift+e` and select link to open.

Defaults in kitty.conf:

```
# mouse_map left click ungrabbed mouse_handle_click selection link prompt

#::  First check for a selection and if one exists do nothing. Then
#::  check for a link under the mouse cursor and if one exists, click
#::  it. Finally check if the click happened at the current shell
#::  prompt and if so, move the cursor to the click location. Note
#::  that this requires shell integration
#::  https://sw.kovidgoyal.net/kitty/shell-integration/ to work.

#: Click the link under the mouse or move the cursor even when grabbed

# mouse_map shift+left click grabbed,ungrabbed mouse_handle_click selection link prompt

#::  Same as above, except that the action is performed even when the
#::  mouse is grabbed by the program running in the terminal.

#: Click the link under the mouse cursor

# mouse_map ctrl+shift+left release grabbed,ungrabbed mouse_handle_click link

#::  Variant with Ctrl+Shift is present because the simple click based
#::  version has an unavoidable delay of click_interval, to
#::  disambiguate clicks from double clicks.
```

- https://www.reddit.com/r/KittyTerminal/comments/tx7rt2/disable_url_opening_on_just_single_click/
- https://sw.kovidgoyal.net/kitty/kittens/hints/

## rectangle selection

`mouse_map cmd+alt+left press ungrabbed mouse_selection rectangle`

https://github.com/kovidgoyal/kitty/issues/3718#issuecomment-860206166

## debug and config reload

Run `kitty --debug-input and you will see what events are being processed

https://github.com/kovidgoyal/kitty/issues/3718#issuecomment-860185312

`ctrl+shift+f5` to reload config

https://www.reddit.com/r/KittyTerminal/comments/14kdcdx/comment/jppuoek/

## Your terminal does not have App Management permissions, so Homebrew will delete and reinstall the app.

This may result in some configurations (like notification settings or location in the Dock/Launchpad) being lost.
To fix this, go to System Settings > Privacy & Security > App Management and add or enable your terminal.

## Resize window

`ctrl+shift+r`

https://sw.kovidgoyal.net/kitty/overview/#windows

## Next layout aka move tab horizontally

`ctrl+shift+l`

https://sw.kovidgoyal.net/kitty/overview/#tabs

## Move tab

Move tab forward `ctrl+shift+.`

Move tab backward `ctrl+shift+,`

https://sw.kovidgoyal.net/kitty/overview/#tabs

## ssh backspace does not work

Do "export TERM=xterm" in the ssh session and you should be gtg. I think installing kitty-terminfo in the target machine will work as well.

https://www.reddit.com/r/KittyTerminal/comments/qflzyq/comment/hi2glib/
