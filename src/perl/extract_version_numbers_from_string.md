```bash
git version | perl -ne  '/git version (\d+)\.(\d+)/; if($1 <= 2 && $2 < 9) { exit 1 };'

if [ ! "$?" == 0 ]; then
  echo "Required git version => 2.9"
  exit 1
fi
```


original

```bash
echo "customer-asset-tag-1.0.2.9"  | perl -ne  '/([a-z-]*)-([\d+.+]*)/; print "Component= $1\nVersion= $2\n"'
```

https://askubuntu.com/questions/428445/how-do-i-extract-the-version-number-portion-from-the-version-string