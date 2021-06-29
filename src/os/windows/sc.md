- https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/sc-config
- Some links in src/databases/mongodb/install_service_windows_scoop.md

## delete service failed 1072

Run cmd.exe as Administrator

```
> taskkill /F /IM mmc.exe
> sc delete mongodb
```

- https://stackoverflow.com/questions/305037/sc-deleteservice-failed-1072/7202888#7202888
