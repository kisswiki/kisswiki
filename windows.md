- screen capture/record
  - https://github.com/ShareX/ShareX
    - video
      - Download ffmpeg.exe from http://ffmpeg.zeranoe.com/builds/ - more info
        - https://github.com/ShareX/ShareX/wiki/FFmpeg-options
        - https://github.com/ShareX/ShareX/wiki/FFmpeg
      - Start/stop recording with the same hotkey - Shifth + Print Screen
    - proxy - there are settings for that
  - [LightShot](https://app.prntscr.com)
  - https://screentogif.codeplex.com/
- wifi password
  - https://github.com/RReverser/WiFi-Password
- color picker http://charliecm.github.io/ColorPicker/
- ruler http://sliver.com/dotnet/Ruler/
- disable search indexing
  - `services.msc > Windows Search > Right-click > Properties > Startup Type: Disabled` http://www.addictivetips.com/windows-tips/how-to-permanently-disable-search-indexing-in-windows-8/
  - run in cmd.exe as Administrator: `sc config WSearch start= disabled` http://superuser.com/questions/73204/correct-way-to-disable-indexing-in-windows-7/349802#349802
- telnet installation https://kb.ctera.com/article/how-to-open-a-telnet-session-on-windows-7-or-windows-8-os-16.html
- can't run node.js server on port 80
  - http://superuser.com/questions/352017/pid4-using-port-80
  - http://www.blackviper.com/windows-services/print-spooler/
  - https://www.devside.net/wamp-server/opening-up-port-80-for-apache-to-use-on-windows
  - http://www.dell.com/support/article/us/en/19/SLN287157/en
  - http://stackoverflow.com/questions/5867392/can-the-web-deploy-agent-run-on-a-port-other-than-80-on-iis6
  - http://superuser.com/questions/43307/why-is-system-process-listening-on-port-80
  - http://stackoverflow.com/questions/1430141/port-80-is-being-used-by-system-pid-4-what-is-that
  - http://stackoverflow.com/questions/3985127/what-does-can-not-obtain-ownership-information-in-netstat-ab-mean
- do I have usb 3 ports http://superuser.com/questions/331885/how-to-determine-whether-i-have-usb3-ports-in-my-laptop/331887#331887 http://superuser.com/questions/756669/how-to-detect-if-a-usb-port-is-3-0-or-2-0/756671
- environmental variables shortcut:
  - `C:\Windows\system32\rundll32.exe sysdm.cpl,EditEnvironmentVariables` https://autohotkey.com/board/topic/68086-open-the-environment-variable-editing-window/
  - `control.exe sysdm.cpl,System,3` http://www.chami.com/tips/windows/012097W.html
- set env var in cmd line: `setx NEWVAR SOMETHING` https://superuser.com/questions/79612/setting-and-getting-windows-environment-variables-from-the-command-prompt/
- delete directory: `rd /s /q <dir>` http://www.windows-commandline.com/delete-directory-from-command-line/

## env variable

Problem setting it from command line

- spaces in path http://stackoverflow.com/questions/11011115/setx-setting-path-with-spaces
- truncation http://superuser.com/questions/387619/overcoming-the-1024-character-limit-with-setx
- in bat file need to replace `%` with `%%` https://support.microsoft.com/en-us/kb/75634

## Windows 10

## How to stop middle mouse button from bringing up cortana

I just went to the buttons section on dell touchpad driver and changed the "both buttons" option to something other than " middle button click " , saved the changes , then change it back to " middle button click " ...hoorraaay that bitch is gone

https://www.reddit.com/r/windows/comments/3f0opd/how_to_stop_middle_mouse_button_from_bringing_up/cttfwh5
