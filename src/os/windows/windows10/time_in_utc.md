Open PowerShell as Administrator:

```
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_QWORD /f
```

- https://wiki.archlinux.org/index.php/System_time#UTC_in_Microsoft_Windows
- https://superuser.com/questions/975717/does-windows-10-support-utc-as-bios-time
