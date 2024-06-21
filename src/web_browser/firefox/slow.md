`about:profiles`

```
cd ~/Library/Application\ Support/Firefox/Profiles/*.default/
ls -lh places.*
sqlite3 places.sqlite "vacuum;"
ls -lh places.*
```

https://superuser.com/questions/3275/firefox-on-mac-slow-slow-slow/3739#3739
