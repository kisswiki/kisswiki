1.To remove old color scheme delete in regedit.exe key `HKEY_CURRENT_USER\Console\something_with_ubuntu_in_the_name` [1]
2.Download ColorTool https://github.com/Microsoft/console/releases
3.Download "Terminal Basic" from https://github.com/mbadolato/iTerm2-Color-Schemes and unpack it to `colortool/schemes`.
4.Run ubuntu wsl and run `~/rofrol/installed/colortool/colortool.exe -q -x "Terminal Basic"`.
5.To save permanently changes `Right click in windows icon > Properties > Ok`
6.In that `Properties` window you probably need to change background color to white and foreground to black.


[1] https://stackoverflow.com/questions/50875118/how-to-reset-color-settings-of-ubuntu-on-windows-10-wsl/52320455#52320455

- [ColorTool does not work on Linux distros · Issue #22 · Microsoft/console](https://github.com/Microsoft/console/issues/22#issuecomment-441668975)
- Another approach https://github.com/Microsoft/console/issues/39#issuecomment-352983935

