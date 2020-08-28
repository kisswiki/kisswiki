Linux caches in memory files that were accessed, i.e. when using rsync. It could consume a lot of memory, so it's better to limit available memory to wsl2.

`%UserProfile%\.wslconfig`

```
[wsl2]
memory=6GB
swap=0
localhostForwarding=true
```


```powershell
Restart-Service LxssManager
```
```

- https://github.com/microsoft/WSL/issues/4166#issuecomment-526725261

Maybe periodically clear memory manually? https://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/
