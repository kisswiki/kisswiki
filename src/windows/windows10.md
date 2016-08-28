## How to stop middle mouse button from bringing up cortana

I just went to the buttons section on dell touchpad driver and changed the "both buttons" option to something other than " middle button click " , saved the changes , then change it back to " middle button click " ...hoorraaay that bitch is gone

https://www.reddit.com/r/windows/comments/3f0opd/how_to_stop_middle_mouse_button_from_bringing_up/cttfwh5

## Delete files in recovery mode

```
diskpart
> list volume
> exit
e:
rd /q /s Windows
del some file
dir e:|find "bytes free"
```

- http://stackoverflow.com/questions/1965787/how-to-delete-files-subfolders-in-a-specific-directory-at-command-prompt-in-wind/14463691#14463691
- http://superuser.com/questions/139899/see-available-drives-from-windows-cli/139912#139912
- http://superuser.com/questions/302505/cmd-cd-to-other-drives-except-c-not-working
- http://stackoverflow.com/questions/293780/free-space-in-a-cmd-shell/293785#293785

### Disable showing recent files

`Settings > Personalization > Start > Show recently opened items in Jump Lists on Start or the taskbar`

http://www.howtogeek.com/236711/how-to-turn-off-recent-items-and-frequent-places-in-windows-10/

## Restart in recovery mode

`Shift-click` on `Power > Restart`
