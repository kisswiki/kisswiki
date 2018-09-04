- create_profile.md
- https://en.wikiversity.org/wiki/PowerShell/Functions

## Services

```powershell
Get-Service | where {$_.status -eq 'running'} | foreach { $_.name + ": " + $_.canstop.tostring().toupper() }
```
