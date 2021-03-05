- create_profile.md
- https://en.wikiversity.org/wiki/PowerShell/Functions

## Services

```powershell
Get-Service | where {$_.status -eq 'running'} | foreach { $_.name + ": " + $_.canstop.tostring().toupper() }
```

## User functions

https://github.com/rofrol/dotfiles/blob/master/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

## Env variables

`$Env:Path`

`Get-ChildItem Env:Path`

- https://superuser.com/questions/1216658/path-environment-variable-windows-10-echo-path-on-command-prompt-shows-only

## Comment

```powershell
# this is comment
```

- https://stackoverflow.com/questions/7342597/how-do-you-comment-out-code-in-powershell

## Unapproved verbs in cmd-let name

Use `Add-ToPath` intead of `AddTo-Path`

```powershell
Get-Verb
```

- https://stackoverflow.com/questions/11039482/powershell-what-verb-to-use-for-a-processing-cmdlet/11043069#11043069
