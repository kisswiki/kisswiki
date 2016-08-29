## show all users and groups


```
cat /etc/passwd
cat /etc/group
```

> it might be preferable to use getent passwd / getent group instead of cat'ing the local files (getent should work for non-local accounts as well)

```
compgen -u
compgen -g
```

- http://askubuntu.com/questions/515103/how-to-display-all-user-and-groups-by-command
- https://ubuntuforums.org/showthread.php?t=1583028
