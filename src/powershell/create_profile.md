## Create profile

https://superuser.com/questions/106360/how-to-enable-execution-of-powershell-scripts

and then:

``` powershell
PS C:\Users\rofrol> new-item -type file -path $profile -force


    Directory: C:\Users\rofrol\Documents\WindowsPowerShell


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----       2018-09-04     20:09              0 Microsoft.PowerShell_profile.ps1
```

https://stackoverflow.com/questions/8997316/powershell-profile-is-pointing-to-a-path-that-i-cant-find-and-setting-permane/8997378#8997378
