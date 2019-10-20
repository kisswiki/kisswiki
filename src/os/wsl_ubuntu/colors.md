## Emacs

This works now:

`TERM=xterm-256color emacs -nw file.js`

https://github.com/microsoft/WSL/issues/345#issuecomment-261925991

## ColorTool

- download ColorTool from https://github.com/Microsoft/console/releases
- test with `/mnt/c/Users/roman/installed/ColorTool$ ./ColorTool.exe -x schemes/solarized_light.itermcolors`
- `git clone https://github.com/mbadolato/iTerm2-Color-Schemes`
- `/mnt/c/Users/roman/installed/ColorTool$ ./ColorTool.exe -x iTerm2-Color-Schemes/schemes/Terminal\ Basic.itermcolors`
- `Right click in windows icon > Properties` change background color to white and foreground to black. Need to to this bc of https://github.com/microsoft/terminal/issues/1160#issuecomment-499872022
- `Right click in windows icon > Properties > Ok` will save changes permanently

Links

- To remove old color scheme delete in regedit.exe key `HKEY_CURRENT_USER\Console\something_with_ubuntu_in_the_name` https://stackoverflow.com/questions/50875118/how-to-reset-color-settings-of-ubuntu-on-windows-10-wsl/52320455#52320455
- [ColorTool does not work on Linux distros · Issue #22 · Microsoft/console](https://github.com/Microsoft/console/issues/22#issuecomment-441668975)
- Another approach https://github.com/Microsoft/console/issues/39#issuecomment-352983935
- When new version of ColorTool will be released https://github.com/microsoft/terminal/issues/1160#issuecomment-499872022, it should be possible to set color scheme in Windows Terminal.
- There is also possibility to set in `"background": "#ffffff"` in profile in settings https://github.com/microsoft/terminal/blob/master/doc/cascadia/SettingsSchema.md
