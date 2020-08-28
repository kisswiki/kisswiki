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
- https://www.reddit.com/r/Windows10/comments/etbnru/vmmem_hogging_memory/
- https://www.reddit.com/r/bashonubuntuonwindows/comments/eey84y/while_upgrading_to_wsl_2_the_vmmem_task_started/
  - https://github.com/ruebenramirez/blog/issues/429#issuecomment-534987584

Maybe periodically clear memory manually? https://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/
