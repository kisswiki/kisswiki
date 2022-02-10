## Open terminal in folder

There is `Open in Terminal` context menu, but you cannot click empty space when you are in list view, only in icons view. So for that I need to create accel:

1. Create ~/.local/share/nautilus/scripts/Terminal with content

```bash
#!/bin/sh
gnome-terminal
```

2. Make it executable with `chmod +x ~/.local/share/nautilus/scripts/Terminal`.
3. Now create (or edit) the ~/.config/nautilus/scripts-accels file adding the following lines:

```
F4 Terminal

; Commented lines must have a space after the semicolon
; Examples of other key combinations:
; <Control>F12 Terminal
; <Alt>F12 Terminal
; <Shift>F12 Terminal
```

4. Restart Nautilus (`nautilus -q`) and when you'll press F4 key you'll open a new terminal window in the current directory.

- https://askubuntu.com/questions/680016/keyboard-shortcut-for-open-terminal-nautilus-3-16/696901#696901

## Scripts

`nautilus -q; nautilus --no-desktop` lets you see your script’s output in the terminal

- https://fedoramagazine.org/integrating-scripts-nautilus/
- https://askubuntu.com/questions/1138673/is-filemanager-actions-working-with-19-04/1138682#1138682
  - https://gitlab.gnome.org/GNOME/filemanager-actions
- https://stackoverflow.com/questions/48840027/ubuntu-open-terminal-in-current-folder-with-shortcut/52584469#52584469
- https://unix.stackexchange.com/questions/353610/add-a-new-nautilus-context-menu-action-without-using-nautilus-actions
- https://help.ubuntu.com/community/NautilusScriptsHowto
  - https://help.ubuntu.com/community/NautilusScriptsHowto
  - http://mundogeek.net/nautilus-scripts/
- https://askubuntu.com/questions/236414/how-can-i-install-a-nautilus-script/236415
- https://github.com/echo-devim/nautilusaccelsmanager

## Menu bar

> The menu bar does not anymore exist indeed. Menu bars are deprecated in Gnome. This is reflected in all Gnome applications, except still gnome-terminal, shipping without menu bar. https://askubuntu.com/questions/1095891/menu-bar-nautilus-missed-in-ubuntu-18-04/1095903#1095903
