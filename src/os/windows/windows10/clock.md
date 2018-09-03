## Show seconds

Start `regedit.exe` and go to the following registry branch:

`HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced`

Create a `REG_DWORD` value named `ShowSecondsInSystemClock`.

Double-click `ShowSecondsInSystemClock` and set its data to `1`.

- https://www.winhelponline.com/blog/show-seconds-taskbar-clock-showsecondsinsystemclock/
