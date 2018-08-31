## About

- https://stackoverflow.com/questions/25019057/how-are-msys-msys2-and-msysgit-related-to-each-other/35099458

## Update

1. Download from http://msys2.github.io
2. Install into $DEV/msys64
3. Run $DEV/msys2_shell.bat
4. Run `pacman -Syuu`
5. Close the shell; reopen it
6. Run `pacman -Syu`

- https://github.com/valtron/llvm-stuff/wiki/Set-up-Windows-dev-environment-with-MSYS2
- [NeoChess Building on Windows with MSYS2, VSCode, and 64 bit Qt · rashwell/neochessqt Wiki](https://github.com/rashwell/neochessqt/wiki/NeoChess-Building-on-Windows-with-MSYS2,-VSCode,-and-64-bit-Qt)

## Windows path

`vim /mingw64.ini`

Uncomment line `MSYS2_PATH_TYPE=inherit`.

- https://stackoverflow.com/questions/45404631/msys2-not-finding-windows-programs-despite-msys2-path-type-inherit

## Permissions

The permissions can be set to Cygwin-like paid permissions emulation by editing /etc/fstab and removing noacl.

https://github.com/carpentries/workshop-template/issues/394#issuecomment-299006601

## Pin to taskbar

Drag and drop `C:\msys64\mingw64.exe`
