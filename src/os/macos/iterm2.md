`brew install --cask iterm2`

## split

`cmd + d` for vertical split and `cmd + shift + d` for horizontal split

To navigate between the vertical splits in left/right or up/down fashion use `cmd + [` and `cmd + ]`

https://superuser.com/questions/55459/how-to-get-vertical-split-of-terminal-in-mac-to-execute-different-actions/650939#650939

## Split vertically with current profile with same working directory

`Preferences > Profiles > General > Working Directory > Advanced Configuration > Working Directory for New Split Panes/Tabs/Windows > Reuse previous session's directory`

https://apple.stackexchange.com/questions/337377/iterm2-split-vertically-with-current-profile-with-same-working-directory/337386#337386

## option as alt

`Preferences > Profiles > Default > Keys > Left Option key > Esc+`

- https://stackoverflow.com/questions/18923765/bash-keyboard-shortcuts-in-iterm-like-altd-and-altf/18925650#18925650
- https://superuser.com/questions/84998/equivalent-alternatives-for-altdot-in-mac

## full disc access

`System Preferences > Security & Privacy > Privacy > Full Disk Access`

- https://gitlab.com/gnachman/iterm2/-/wikis/fulldiskaccess
- https://apple.stackexchange.com/questions/341644/iterm2-accessibility-and-full-disk-access

## restore split panes

https://apple.stackexchange.com/questions/22445/how-can-i-save-tabs-in-iterm-2-so-they-restore-the-next-time-the-app-is-run

## scroll lines amount

`Preferences > Profiles > Default > Terminal > Scrollback lines > 10000`

## Panes

- `Preferences > Appearance`
  - Panes
    - uncheck "Separate status bar per pane"
  - Dimming
    - uncheck all

## Colors

`Preferences > Profiles > Default > Colors > Color Presets > Light Background`

## Hide Title Bar

`Preferences > Profiles > Default > Window > Settings for New Window > Style > No Title Bar`

use Rectangle app's key shortcut `option+cmd+enter` to maximize.

## Disable sounds

`Preferences > Profiles > Default > Terminal > Notifications > check "Silence bell"`

## cmd+. like alt+.

`Preferences > Profiles > Default > Keys > Key Mappings`

Keyboard Shorcut: `cmd+.`

Action: `Send Escape Sequence`

Esc+: `.`

- https://superuser.com/questions/703911/iterm2-alt-dot-functionality-with-cmd-dot/704301#704301

## Font

- `Preferences > Profiles > Default > Text`
  - `Text Rendering`
    - unchecke `Draw bold text in bold font`
    - unchecke `Italic text`
  - `Font > NotoMono Nerd Font 18pt`

## Open iTerm2 in folder

`System Settings > Keyboard > Keyboard Shortcuts > Services > Files and Folders > New iTerm2 Tab Here > and give preferred shortcut`.

You can right-click on the folder where you want iTerm2 to open, then select `Services > New iTerm2 Tab here`

https://stackoverflow.com/questions/50370854/is-it-possibile-to-open-iterm-in-current-finder-position
