Steps:

```bash
$ sudo nvim /etc/wsl.conf
```

```
[interop]
enabled=true # enable launch of Windows binaries; default is true
appendWindowsPath=false # append Windows path to $PATH variable; default is true
```

Run at PowerShell as Admin:

`Restart-Service LxssManager`

1. https://stackoverflow.com/questions/51336147/how-to-remove-the-win10s-path-from-wsl/51345880#51345880
2. https://www.windowscentral.com/how-check-your-windows-10-build
3. https://superuser.com/questions/1126721/rebooting-ubuntu-on-windows-without-rebooting-windows/1347725#1347725
