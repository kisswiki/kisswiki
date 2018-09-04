create_profile.md and then in `Microsoft.PowerShell_profile.ps1`:

```powershell
function Stop-ProcessByPort( [ValidateNotNullOrEmpty()] [int]$port)
{
  Stop-Process -Id (Get-NetTCPConnection -LocalPort $port).OwningProcess -Force
}

sal killp Stop-ProcessByPort
```

Restart shell and use:

```powershell
killp 4200
```

- https://stackoverflow.com/questions/39632667/how-to-kill-the-process-currently-using-a-port-on-localhost-in-windows/47717839#47717839
- https://stackoverflow.com/questions/6204003/kill-a-process-by-looking-up-the-port-being-used-by-it-from-a-bat/40388270#40388270
- https://superuser.com/questions/455280/windows-fastest-way-of-killing-a-process-running-on-a-specific-port
- https://github.com/majkinetor/posh/blob/master/MM_Network/Stop-ProcessByPort.ps1
