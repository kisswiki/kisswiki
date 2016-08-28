## enable the hidden Windows 10 administrator account

1. Start cmd.exe as administrator.
2. Display users: `net user`
3. `net user administrator /active:yes`
4. Set password: `net user administrator *`
5. Display info: `net user administrator`
6. Delete user: `net user username /delete`
