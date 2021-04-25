```reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Classes\*\shell\Open with &gitk --all\command]
@="C:\\Users\\rofro\\scoop\\shims\\gitk.exe --all \"%1\""

[HKEY_CURRENT_USER\Software\Classes\directory\Background\shell\Open with &gitk --all\command]
@="C:\\Users\\rofro\\scoop\\shims\\gitk.exe --all \"%V\""
```

- https://stackoverflow.com/questions/20449316/how-add-context-menu-item-to-windows-explorer-for-folders
- https://superuser.com/questions/1097054/shell-context-menu-registry-extension-doesnt-work-when-default-program-is-other/1097153#1097153
- https://serverfault.com/questions/681996/how-can-we-insert-multiple-keys-into-a-registry-folder-without-using-3rd-party-t
- https://docs.microsoft.com/en-us/powershell/scripting/samples/working-with-registry-keys
- `;` https://stackoverflow.com/questions/27632612/comment-in-reg-file
- https://stackoverflow.com/questions/10905932/git-for-windows-launch-gitk-context-menu-with-gitk-all/67257954#67257954
