## delete service failed 1072

Run cmd.exe as Administrator

```
> taskkill /F /IM mmc.exe
> sc delete mongodb
```

- https://stackoverflow.com/questions/305037/sc-deleteservice-failed-1072/7202888#7202888
