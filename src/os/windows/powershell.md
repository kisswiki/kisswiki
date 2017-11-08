## Services

```powershell
Get-Service | where {$_.status -eq 'running'} | foreach { $_.name + ": " + $_.canstop.tostring().toupper() }
```
